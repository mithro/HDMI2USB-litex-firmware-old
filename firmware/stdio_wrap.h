
#include <generated/csr.h>
#include <stdbool.h>

#include "telnet.h"

#ifdef ETHMAC_BASE

#define wprintf(...)					\
	do {						\
		if(telnet_active) {			\
			telnet_printf(__VA_ARGS__);	\
		}					\
		printf(__VA_ARGS__);			\
	} while(false)

#define wputs(s)					\
	do {						\
		if(telnet_active) {			\
			telnet_puts(s);			\
		}					\
		puts(s);				\
	} while(false)

#define wputsnonl(s)					\
	do {						\
		if(telnet_active) {			\
			telnet_putsnonl(s);		\
		}					\
		putsnonl(s);				\
	} while(false)

#else

#define wprintf		printf
#define wputs		puts
#define wputsnonl	putsnonl

#endif
