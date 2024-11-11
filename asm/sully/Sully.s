global main
extern dprintf
extern system

section .data
	quine db "global main%3$cextern dprintf%3$cextern system%3$c%3$csection .data%3$c%2$cquine db %4$c%1$s%4$c, 0%3$c%2$cfilename db %4$cSully_0.s%4$c, 0%3$c%2$ccmd db %4$c%5$s%4$c, 0%3$c%2$cit db %6$d%3$c%3$csection .text%3$cmain:%3$c%2$cmovsx rax, byte [rel it]%3$c%2$cadd rax, 48%3$c%2$ccmp rax, 0x2F%3$c%2$cjle out0%3$c%3$c%2$clea r10, [rel filename]%3$c%2$cadd r10, 6%3$c%2$cmov [r10], al%3$c%3$c%2$cmov rax, 2%3$c%2$clea rdi, [rel filename]%3$c%2$cmov rsi, 0x241%3$c%2$cmov rdx, 0x180%3$c%2$csyscall%3$c%2$ccmp rax, 0%3$c%2$cjl outopen%3$c%2$cpush rax%3$c%3$c%2$cmov rdi, rax%3$c%2$clea rsi, [rel quine]%3$c%2$clea rdx, [rel quine]%3$c%2$cmov rcx, 0x09%3$c%2$cmov r8, 0x0A%3$c%2$cmov r9, 0x22%3$c%2$cmovzx r12, byte [rel it]%3$c%2$cdec r12%3$c%2$cpush r12%3$c%2$clea r12, [rel cmd]%3$c%2$cpush r12%3$c%3$c%2$ccall dprintf wrt ..plt%3$c%3$c%2$cmov rax, 3%3$c%2$cpop rdi%3$c%2$csyscall%3$c%3$c%2$clea rax, [rel cmd]%3$c%2$cmovzx r10, byte [rel it]%3$c%2$cadd r10, 48%3$c%2$cmov byte [rax + 34], r10b%3$c%2$cmov byte [rax + 59], r10b%3$c%2$cmov byte [rax + 72], r10b%3$c%2$cmov byte [rax + 85], r10b%3$c%3$c%2$clea rdi, [rel cmd]%3$c%3$c%2$cmov rax, rsp%3$c%2$cand rax, 0xF%3$c%2$csub rsp, rax%3$c%3$c%2$ccall system wrt ..plt%3$c%3$c%2$cout0:%3$c%2$c%2$cmov rax, 60%3$c%2$c%2$cmov rdi, 0%3$c%2$c%2$csyscall%3$c%3$c%2$cout1:%3$c%2$c%2$cmov rax, 60%3$c%2$c%2$cmov rdi, 1%3$c%2$c%2$csyscall%3$c%3$c%2$coutopen:%3$c%2$c%2$cmov rdi, rax%3$c%2$c%2$cmov rax, 60%3$c%2$c%2$csyscall%3$c%3$csection .note.GNU-stack noalloc noexec nowrite progbits%3$c", 0
	filename db "Sully_0.s", 0
	cmd db "/bin/bash -c 'nasm -f elf64 Sully_0.s && gcc -no-pie Sully_0.o -o Sully_0 && ./Sully_0 && rm -f *.o'", 0
	it db 5

section .text
main:
	movsx rax, byte [rel it]
	add rax, 48
	cmp rax, 0x2F
	jle out0

	lea r10, [rel filename]
	add r10, 6
	mov [r10], al

	mov rax, 2
	lea rdi, [rel filename]
	mov rsi, 0x241
	mov rdx, 0x180
	syscall
	cmp rax, 0
	jl outopen
	push rax

	mov rdi, rax
	lea rsi, [rel quine]
	lea rdx, [rel quine]
	mov rcx, 0x09
	mov r8, 0x0A
	mov r9, 0x22
	movzx r12, byte [rel it]
	dec r12
	push r12
	lea r12, [rel cmd]
	push r12

	call dprintf wrt ..plt

	mov rax, 3
	pop rdi
	syscall

	lea rax, [rel cmd]
	movzx r10, byte [rel it]
	add r10, 48
	mov byte [rax + 34], r10b
	mov byte [rax + 59], r10b
	mov byte [rax + 72], r10b
	mov byte [rax + 85], r10b

	lea rdi, [rel cmd]

	mov rax, rsp
	and rax, 0xF
	sub rsp, rax

	call system wrt ..plt

	out0:
		mov rax, 60
		mov rdi, 0
		syscall

	out1:
		mov rax, 60
		mov rdi, 1
		syscall

	outopen:
		mov rdi, rax
		mov rax, 60
		syscall

section .note.GNU-stack noalloc noexec nowrite progbits
