	.file	"fillArrayFile.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"input.txt"
.LC2:
	.string	"%d"
	.text
	.globl	fillArrayFile
	.type	fillArrayFile, @function
fillArrayFile:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	DWORD PTR -20[rbp], edi
	mov	QWORD PTR -32[rbp], rsi
	lea	rsi, .LC0[rip]
	lea	rdi, .LC1[rip]
	call	fopen@PLT
	mov	QWORD PTR -8[rbp], rax
	mov r14, QWORD PTR -8[rbp] # r14 = указатель на input
	mov	r13d, 0 # DWORD PTR -12[rbp] => r13d (итерируемая переменная)
	jmp	.L2
.L3:
	mov	eax, r13d # DWORD PTR -12[rbp] => r13d (итерируемая переменная)
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp]
	add	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	lea	rsi, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	add	r13d, 1 # DWORD PTR -12[rbp] => r13d (итерируемая переменная)
.L2:
	mov	eax, r13d # DWORD PTR -12[rbp] => r13d (итерируемая переменная)
	cmp	eax, DWORD PTR -20[rbp]
	jl	.L3
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	fclose@PLT
	nop
	leave
	ret
	.size	fillArrayFile, .-fillArrayFile
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
