	.file	"generation.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"Enter seed: "
.LC1:
	.string	"%d"
.LC2:
	.string	"\nA: "
.LC3:
	.string	"%d "
	.text
	.globl	generation
	.type	generation, @function
generation:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	DWORD PTR -20[rbp], edi # первый входной параметр из функции (size)
	mov	QWORD PTR -32[rbp], rsi # второй входной параметр из функции (указатель на начало массива A)
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rax, -16[rbp]
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -16[rbp]
	mov	edi, eax
	call	srand@PLT
	lea	rdi, .LC2[rip]
	mov	eax, 0
	call	printf@PLT
	mov	r13d, 0 # DWORD PTR -12[rbp] => r13d (итерируемая переменная index) # -12 = index
	jmp	.L2
.L3:
	call	rand@PLT
	mov	ecx, eax
	mov	eax, r13d # DWORD PTR -12[rbp] => r13d (итерируемая переменная index)
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp]
	lea	rsi, [rdx+rax]
	movsx	rax, ecx
	imul	rax, rax, 1717986919
	shr	rax, 32
	mov	edx, eax
	sar	edx, 2
	mov	eax, ecx
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	add	eax, eax
	sub	ecx, eax
	mov	edx, ecx
	mov	DWORD PTR [rsi], edx
	mov	eax, r13d # DWORD PTR -12[rbp] => r13d (итерируемая переменная index)
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	esi, eax
	lea	rdi, .LC3[rip]
	mov	eax, 0
	call	printf@PLT
	add	r13d, 1 # DWORD PTR -12[rbp] => r13d (итерируемая переменная index)
.L2:
	mov	eax, r13d # DWORD PTR -12[rbp] => r13d (итерируемая переменная idnex)
	cmp	eax, DWORD PTR -20[rbp]
	jl	.L3
	mov	edi, 10
	call	putchar@PLT
	nop
	mov	rax, QWORD PTR -8[rbp]
	xor	rax, QWORD PTR fs:40
	je	.L4
	call	__stack_chk_fail@PLT
.L4:
	leave
	ret
	.size	generation, .-generation
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
