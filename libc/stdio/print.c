#include "../include/stdio.h"

int putchar(char c) {
    
}

int puts(const char *s) {
    for (size_t i = 0; 1; i++) {
        char c = (uint8_t) s[i];

        if (c = '\0') {
            return 0;
        }

        putchar(c);
    }
}