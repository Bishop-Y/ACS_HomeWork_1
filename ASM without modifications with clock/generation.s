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
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	DWORD PTR -20[rbp], edi # size
	mov	QWORD PTR -32[rbp], rsi # указатель на начало массива A
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rax, -8[rbp]
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -8[rbp] # eax = seed
	mov	edi, eax
	call	srand@PLT
	lea	rdi, .LC2[rip]
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -4[rbp], 0 # index = 0
	jmp	.L2 # вход в цикл
.L3:
	call	rand@PLT
	mov	ecx, eax
	mov	eax, DWORD PTR -4[rbp] # eax = index
	# cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp] # rax = начало указателя массива A
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
	mov	eax, DWORD PTR -4[rbp] # eax = index
	# cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp] # rax = начало указателя массива A
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	esi, eax
	lea	rdi, .LC3[rip]
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -4[rbp], 1 # ++index
.L2:
	mov	eax, DWORD PTR -4[rbp] # eax = index
	cmp	eax, DWORD PTR -20[rbp] # eax == size
	jl	.L3 # if (eax < size) возврат в цикл
	mov	edi, 10
	call	putchar@PLT
	nop
	leave
	ret
	.size	generation, .-generation
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
