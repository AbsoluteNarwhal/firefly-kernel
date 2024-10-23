asm=nasm
cc=x86_64-elf-gcc
ld=x86_64-elf-ld

# Files
kernel_c_src := $(shell find kernel/kernel -name *.c)
kernel_c_obj := $(patsubst kernel/kernel/%.c, build/kernel/%.o, $(kernel_c_src))

x86_64_c_src := $(shell find kernel/x86_64 -name *.c)
x86_64_c_obj := $(patsubst kernel/x86_64/%.c, build/x86_64/%.o, $(x86_64_c_src))

x86_64_asm_src := $(shell find kernel/x86_64 -name *.asm)
x86_64_asm_obj := $(patsubst kernel/x86_64/%.asm, build/x86_64/%.o, $(x86_64_asm_src))

x86_64_obj := $(x86_64_c_obj) $(x86_64_asm_obj)



# Compile and assemble
$(x86_64_asm_obj): build/x86_64/%.o : kernel/x86_64/%.asm
	mkdir -p $(dir $@) && \
	$(asm) -f elf64 $(patsubst build/x86_64/%.o, kernel/x86_64/%.asm, $@) -o $@

$(x86_64_c_obj): build/x86_64/%.o : kernel/x86_64/%.c
	mkdir -p $(dir $@) && \
	$(cc) -c -I kernel/include -ffreestanding $(patsubst build/x86_64/%.o, kernel/x86_64/*.c, $@) -o $@

$(kernel_c_obj): build/kernel/%.o : kernel/kernel/%.c
	mkdir -p $(dir $@) && \
	$(cc) -c -I kernel/include -ffreestanding $(patsubst build/kernel/%.o, kernel/kernel/*.c, $@) -o $@



# Build targets
.PHONY: build-x86_64
build-x86_64: $(kernel_c_obj) $(x86_64_obj)
	mkdir -p dist/x86_64 && \
	$(ld) -n -o dist/x86_64/kernel.bin -T targets/x86_64/linker.ld $(kernel_c_obj) $(x86_64_obj) && \
	cp dist/x86_64/kernel.bin targets/x86_64/iso/boot/kernel.bin && \
	grub-mkrescue /usr/lib/grub/i386-pc -o dist/x86_64/kernel.iso targets/x86_64/iso