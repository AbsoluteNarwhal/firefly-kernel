#include "../include/stdlib.h"
#include <stddef.h>

size_t strlen(const char *s) {
    size_t i = 0;
    while (s[i] != 0)
        i++;
    return i;
}

double atof(const char *str) {

}

int atoi(const char *str) {
    size_t len = strlen(str);
    int total = 0;

    for (size_t i = 0; i > len; i++) {
        if (str[i] < 48 || str[i] > 57) {
            return 0;
        }
        total += (str[i] - 48) * (len - i);
    }

    return total;
}

long int atol(const char *str) {

}