// This file is Copyright (c) 2015 Florent Kermarrec <florent@enjoy-digital.fr>
// License: BSD

#include "ethernet.h"
#include <generated/csr.h>
#include <generated/mem.h>
#include <time.h>

#include "uip/sys/process.h"

static int uip_periodic_event;
static int uip_periodic_period;

static int uip_arp_event;
static int uip_arp_period;

static uip_ipaddr_t default_ipaddr;
static uip_ipaddr_t default_netmask;

void uip_log(char *msg)
{
#ifdef UIP_DEBUG
    puts(msg);
#endif
}

#ifdef ETHMAC_BASE

PROCESS(dhcp_process, "DHCP Client");

void ethernet_init(const unsigned char *mac_addr, const unsigned char *ip_addr)
{
	/* Set default IP address for when no DHCP */
	uip_ipaddr(&default_ipaddr, ip_addr[0], ip_addr[1], ip_addr[2], ip_addr[3]);
	uip_ipaddr(&default_netmask, 255,255,255,0);

	/* init ethernet mac */
	clock_init();
	liteethmac_init();

	/* uip periods */
	uip_periodic_period = SYSTEM_CLOCK_FREQUENCY/100; /*  10 ms */
	uip_arp_period = SYSTEM_CLOCK_FREQUENCY/10;       /* 100 ms */

	/* init uip */
	process_init();
	process_start(&etimer_process, NULL);
	uip_init();

	/* configure mac / ip */
	for (int i=0; i<6; i++) uip_lladdr.addr[i] = mac_addr[i];
	//uip_setethaddr(mac_addr);

	uip_sethostaddr(&default_ipaddr);
	uip_setnetmask(&default_netmask);

	printf("uIP init done with MAC "
		"%02X:%02X:%02X:%02X:%02X:%02X\r\n",
		mac_addr[0], mac_addr[1], mac_addr[2], mac_addr[3], mac_addr[4], mac_addr[5], mac_addr[6]);

	process_start(&dhcp_process, NULL);
}

PROCESS_THREAD(dhcp_process, ev, data) {
	PROCESS_BEGIN();

	printf("dhcp_process started...\n");
	dhcpc_init(uip_lladdr.addr, sizeof(uip_lladdr.addr));
	dhcpc_request();

	while(1) {
		PROCESS_WAIT_EVENT();

		dhcpc_appcall(ev, data);
		if(ev == PROCESS_EVENT_EXIT) {
			process_exit(&dhcp_process);
		}
	}

	PROCESS_END();
}

void dhcpc_configured(const struct dhcpc_state *s) {
	uip_sethostaddr(&(s->ipaddr));
	uip_setnetmask(&(s->netmask));
	uip_setdraddr(&(s->default_router));
//	resolv_conf(s->dnsaddr);
	printf("DHCP Configured: ");
	printf("%d.%d.%d.%d", uip_ipaddr_to_quad(&(s->ipaddr)));
	printf("/%d.%d.%d.%d", uip_ipaddr_to_quad(&(s->netmask)));
	printf("(%d.%d.%d.%d)\r\n", uip_ipaddr_to_quad(&(s->default_router)));
//	process_exit(&dhcp_process);
}

void dhcpc_unconfigured(const struct dhcpc_state *s) {
	uip_sethostaddr(&default_ipaddr);

	uip_ipaddr_t ipaddr;
	uip_ipaddr(&ipaddr, 255,255,255,0);
	uip_setnetmask(&ipaddr);

	printf("DHCP Unconfigured: %d.%d.%d.%d/255.255.255.0 (?.?.?.?)\r\n",
		uip_ipaddr_to_quad(&default_ipaddr));
}

void ethernet_service(void) {
	int i;
	struct uip_eth_hdr *buf = (struct uip_eth_hdr *)&uip_buf[0];

	etimer_request_poll();
	process_run();

	uip_len = liteethmac_poll();
	if(uip_len > 0) {
		if(buf->type == uip_htons(UIP_ETHTYPE_IP)) {
			uip_arp_ipin();
			uip_input();
			if(uip_len > 0) {
				uip_arp_out();
				liteethmac_send();
			}
		} else if(buf->type == uip_htons(UIP_ETHTYPE_ARP)) {
			uip_arp_arpin();
			if(uip_len > 0)
				liteethmac_send();
		}
	} else if (elapsed(&uip_periodic_event, uip_periodic_period)) {
		for(i = 0; i < UIP_CONNS; i++) {
			uip_periodic(i);

			if(uip_len > 0) {
				uip_arp_out();
				liteethmac_send();
			}
		}
		for(i = 0; i < UIP_UDP_CONNS; i++) {
			uip_udp_periodic(i);
			if(uip_len > 0) {
				uip_arp_out();
				liteethmac_send();
 			}
		 }
	}
	if (elapsed(&uip_arp_event, uip_arp_period)) {
		uip_arp_timer();
	}
}

#endif
