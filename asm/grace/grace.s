%define FILE_NAME "grace_kid.s"
%define MAIN_MACRO main

section .rodata:
	filename db FILE_NAME, 0
	quine db "%%define FILE_NAME %4$cgrace_kid.s%4$c%3$c%%define MAIN_MACRO main%3$c%3$csection .rodata:%3$c%2$cfilename db FILE_NAME, 0%3$c%2$cquine db %4$c%1$s%4$c, 0%3$c%3$c; One Comment%3$c%3$csection .text%3$cglobal MAIN_MACRO%3$cextern dprintf%3$cextern stdout%3$cextern fflush%3$c%3$c%%macro REPLICATE 0%3$c%2$cmov rax, 2%3$c%2$cmov rdi, filename%3$c%2$cmov rsi, 0x241%3$c%2$cmov rdx, 0x180%3$c%2$csyscall%3$c%2$cpush rax%3$c%3$c%2$cmov rdi, rax%3$c%2$clea rsi, [quine]%3$c%2$cmov rdx, quine%3$c%2$cmov rcx, 0x9%3$c%2$cmov r8, 0xa%3$c%2$cmov r9, 0x22%3$c%2$ccall dprintf%3$c%3$c%2$cmov rax, 3%3$c%2$cpop rdi%3$c%2$csyscall%3$c%3$c%2$cmov rdi, [stdout]%3$c%2$ccall fflush%3$c%3$c%2$cmov rax, 60%3$c%2$cmov rdi, 0%3$c%2$csyscall%3$c%%endmacro REPLICATE%3$c%3$cMAIN_MACRO:%3$c%2$cREPLICATE%3$c", 0

; One Comment

section .text
global MAIN_MACRO
extern dprintf
extern stdout
extern fflush

%macro REPLICATE 0
	mov rax, 2
	mov rdi, filename
	mov rsi, 0x241
	mov rdx, 0x180
	syscall
	push rax

	mov rdi, rax
	lea rsi, [quine]
	mov rdx, quine
	mov rcx, 0x9
	mov r8, 0xa
	mov r9, 0x22
	call dprintf

	mov rax, 3
	pop rdi
	syscall

	mov rdi, [stdout]
	call fflush

	mov rax, 60
	mov rdi, 0
	syscall
%endmacro REPLICATE

MAIN_MACRO:
	REPLICATE
