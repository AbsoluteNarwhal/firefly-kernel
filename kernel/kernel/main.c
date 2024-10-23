#include "kprint.h"

// Entry point for kernel once the assembly stuff is done
void kernel_main() {
    vm_clear_screen();
    vm_set_output_color(PRINT_COLOR_YELLOW, PRINT_COLOR_BLACK);
    vm_puts("Hello, 64-bit Firefly World!\n");
}