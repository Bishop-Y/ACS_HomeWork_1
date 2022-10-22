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
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	DWORD PTR -20[rbp], edi # size
	mov	QWORD PTR -32[rbp], rsi # указатель на начало массива A
	lea	rsi, .LC0[rip] # устанавливаем ссылку на "r"
	lea	rdi, .LC1[rip] # устанавливаем ссылку на "input.txt"
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax # указатель на input
	mov	DWORD PTR -4[rbp], 0 # index = 0
	jmp	.L2 # входим в цикл
.L3:
	mov	eax, DWORD PTR -4[rbp] # eax = index
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp] # rax = указатель на начало массива A
	add	rdx, rax
	mov	rax, QWORD PTR -16[rbp] # rax = указатель на input
	lea	rsi, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	add	DWORD PTR -4[rbp], 1 # ++index
.L2:
	mov	eax, DWORD PTR -4[rbp] # eax = index
	cmp	eax, DWORD PTR -20[rbp] # eax == size
	jl	.L3 # if (eax < size) входим обратно в цикл
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	fclose@PLT
	nop
	leave
	ret
	.size	fillArrayFile, .-fillArrayFile
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
