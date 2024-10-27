; Outside comment

global main
extern printf
extern fflush
extern stdout

section .text

main:
	; Inside comment
	mov rdi, str
	call colleen

colleen:
	mov rsi, rdi
	mov rcx, 9
	mov rdx, 10
	mov r8, 34
	call printf wrt ..plt
	mov rdi, [stdout]
	call fflush
	mov rax, 60
	mov rdi, 0
	syscall

section .rodata
	str: db "; Outside comment%2$c%2$cglobal main%2$cextern printf%2$cextern fflush%2$cextern stdout%2$c%2$csection .text%2$c%2$cmain:%2$c%3$c; Inside comment%2$c%3$cmov rdi, str%2$c%3$ccall colleen%2$c%2$ccolleen:%2$c%3$cmov rsi, rdi%2$c%3$cmov rcx, 9%2$c%3$cmov rdx, 10%2$c%3$cmov r8, 34%2$c%3$ccall printf wrt ..plt%2$c%3$cmov rdi, [stdout]%2$c%3$ccall fflush%2$c%3$cmov rax, 60%2$c%3$cmov rdi, 0%2$c%3$csyscall%2$c%2$csection .rodata%2$c%3$cstr: db %4$c%1$s%4$c, 0%2$c", 0
