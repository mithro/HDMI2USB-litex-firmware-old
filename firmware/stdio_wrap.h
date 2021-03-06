#include <stdarg.h>

int wputs(const char *s);
int wprintf(const char *fmt, ...) __attribute__((format(printf, 1, 2)));
void wputsnonl(const char *s);

int sprintf(char *str, const char *format, ...)  __attribute__((format(printf, 2, 3)));
int snprintf(char *str, size_t size, const char *format, ...)  __attribute__((format(printf, 3, 4)));
