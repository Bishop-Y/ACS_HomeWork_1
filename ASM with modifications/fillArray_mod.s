	.file	"fillArray.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"A[%d] ="
.LC1:
	.string	"%d"
	.text
	.globl	fillArrayManual
	.type	fillArrayManual, @function
fillArrayManual:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	DWORD PTR -20[rbp], edi
	mov	QWORD PTR -32[rbp], rsi
	mov	edi, 10
	call	putchar@PLT
	mov	r13d, 0 # DWORD PTR -4[rbp] => r13d = index
	jmp	.L2
.L3:
	mov	eax, r13d # DWORD PTR -4[rbp] => r13d
	mov	esi, eax
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, r13d # DWORD PTR -4[rbp] => r13d
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	add	r13d, 1 # DWORD PTR -4[rbp] => r13d
.L2:
	mov	eax, r13d
	cmp	eax, DWORD PTR -20[rbp]
	jl	.L3
	nop
	nop
	leave
	ret
	.size	fillArrayManual, .-fillArrayManual
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
