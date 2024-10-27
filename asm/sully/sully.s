global main
extern dprintf
extern system

section .data
	quine db "global main%3$cextern dprintf%3$cextern system%3$c%3$csection .data%3$c%2$cquine db %4$c%1$s%4$c, 0%3$c%2$cfilename db %4$c%6$s%4$c, 0%3$c%2$ccmd db %4$c%5$s%4$c, 0%3$c%3$csection .bss%3$c%2$cit resb 1%3$c%2$cargs resb 32%3$c%3$csection .text%3$cmain:%3$c%2$cmov r10, filename%3$c%2$cadd r10, 6%3$c%2$cdec byte [r10]%3$c%3$c%2$cmov r11b, [r10]%3$c%2$cmov [it], r11b%3$c%3$c%2$ccmp byte [r10], 0x2F%3$c%2$cje out0%3$c%3$c%2$cmov rax, 2%3$c%2$cmov rdi, filename%3$c%2$cmov rsi, 0x241%3$c%2$cmov rdx, 0x180%3$c%2$csyscall%3$c%2$ccmp rax, 0%3$c%2$cjl outopen%3$c%2$cpush rax%3$c%3$c%2$cmov rdi, rax%3$c%2$cmov rsi, quine%3$c%2$cmov rdx, quine%3$c%2$cmov rcx, 0x09%3$c%2$cmov r8, 0x0A%3$c%2$cmov r9, 0x22%3$c%2$cpush filename%3$c%2$cpush cmd%3$c%3$c%2$ccall dprintf%3$c%3$c%2$cmov rax, 3%3$c%2$cpop rdi%3$c%2$csyscall%3$c%3$c%2$cmov rax, cmd%3$c%2$cmov r10b, [it]%3$c%2$cmov byte [rax + 34], r10b%3$c%2$cmov byte [rax + 59], r10b%3$c%3$c%2$cmov rdi, cmd%3$c%3$c%2$cmov rax, rsp%3$c%2$cand rax, 0xF%3$c%2$csub rsp, rax%3$c%3$c%2$ccall system%3$c%3$c%2$cout0:%3$c%2$c%2$cmov rax, 60%3$c%2$c%2$cmov rdi, 0%3$c%2$c%2$csyscall%3$c%3$c%2$cout1:%3$c%2$c%2$cmov rax, 60%3$c%2$c%2$cmov rdi, 1%3$c%2$c%2$csyscall%3$c%3$c%2$coutopen:%3$c%2$c%2$cmov rdi, rax%3$c%2$c%2$cmov rax, 60%3$c%2$c%2$csyscall%3$c", 0
	filename db "sully_5.s", 0
	cmd db "/bin/bash -c 'nasm -f elf64 sully_0.s && gcc -no-pie sully_0.o -o sully && ./sully'", 0

section .bss
	it resb 1
	args resb 32

section .text
main:
	mov r10, filename
	add r10, 6
	dec byte [r10]

	mov r11b, [r10]
	mov [it], r11b

	cmp byte [r10], 0x2F
	je out0

	mov rax, 2
	mov rdi, filename
	mov rsi, 0x241
	mov rdx, 0x180
	syscall
	cmp rax, 0
	jl outopen
	push rax

	mov rdi, rax
	mov rsi, quine
	mov rdx, quine
	mov rcx, 0x09
	mov r8, 0x0A
	mov r9, 0x22
	push filename
	push cmd

	call dprintf

	mov rax, 3
	pop rdi
	syscall

	mov rax, cmd
	mov r10b, [it]
	mov byte [rax + 34], r10b
	mov byte [rax + 59], r10b

	mov rdi, cmd

	mov rax, rsp
	and rax, 0xF
	sub rsp, rax

	call system

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
