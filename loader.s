.set MAGIC, 0x1BADB002
.set FLAGS, (1<<0 | 1<<1)
.set CHECKSUM, -(MAGIC + FLAGS)

.section .multiboot
  .long MAGIC
  .long FLAGS
  .long CHECKSUM



.section .text
.extrn kernalMain
.global loader

loader:
    mov &kernal_stack ,%esp
    call kernalMain
    push %eax
    push %ebx

_stop:
    cli
    hlt
    jmp _stop



.section .bss
.space 2*1024*1024 # 2 MB for kernel stack
kernal_stack:
