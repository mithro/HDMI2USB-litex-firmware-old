
#include <generated/csr.h>
#include <stdbool.h>

#include "telnet.h"

#ifdef ETHMAC_BASE

#define ci_printf(...)					\
	do {						\
		if(telnet_active) {			\
			telnet_printf(__VA_ARGS__);	\
		}					\
		printf(__VA_ARGS__);			\
	} while(false)

#define ci_puts(s)					\
	do {						\
		if(telnet_active) {			\
			telnet_puts(s);			\
		}					\
		puts(s);				\
	} while(false)

#define ci_putsnonl(s)					\
	do {						\
		if(telnet_active) {			\
			telnet_putsnonl(s);		\
		}					\
		putsnonl(s);				\
	} while(false)

#else

#define ci_printf	printf
#define ci_puts		puts
#define ci_putsnonl	putsnonl

#endif
