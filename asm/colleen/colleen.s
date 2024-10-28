; Outside comment

global main
extern printf
extern fflush
extern stdout

section .text

main:
	; Inside comment
	lea rdi, [rel str]
	call colleen

colleen:
	mov rsi, rdi
	mov rcx, 9
	mov rdx, 10
	mov r8, 34
	call printf wrt ..plt
	mov rdi, [rel stdout wrt ..got]
	mov rdi, [rdi]
	call fflush wrt ..plt
	mov rax, 60
	mov rdi, 0
	syscall

section .note.GNU-stack noalloc noexec nowrite progbits

section .rodata
	str: db "; Outside comment%2$c%2$cglobal main%2$cextern printf%2$cextern fflush%2$cextern stdout%2$c%2$csection .text%2$c%2$cmain:%2$c%3$c; Inside comment%2$c%3$clea rdi, [rel str]%2$c%3$ccall colleen%2$c%2$ccolleen:%2$c%3$cmov rsi, rdi%2$c%3$cmov rcx, 9%2$c%3$cmov rdx, 10%2$c%3$cmov r8, 34%2$c%3$ccall printf wrt ..plt%2$c%3$cmov rdi, [rel stdout wrt ..got]%2$c%3$cmov rdi, [rdi]%2$c%3$ccall fflush wrt ..plt%2$c%3$cmov rax, 60%2$c%3$cmov rdi, 0%2$c%3$csyscall%2$c%2$csection .note.GNU-stack noalloc noexec nowrite progbits%2$c%2$csection .rodata%2$c%3$cstr: db %4$c%1$s%4$c, 0%2$c", 0
