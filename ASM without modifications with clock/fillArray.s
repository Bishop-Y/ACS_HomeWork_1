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
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	DWORD PTR -20[rbp], edi # передаваемый аргумент length
	mov	QWORD PTR -32[rbp], rsi # передаваемый аргумент указатель на начало массива 
	mov	edi, 10
	call	putchar@PLT
	mov	DWORD PTR -4[rbp], 0 # объявление index = 0
	jmp	.L2 # вход в цикл
.L3:
	mov	eax, DWORD PTR -4[rbp] # eax = index
	mov	esi, eax
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR -4[rbp] # eax = index
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp] # rax = начало массива A
	add	rax, rdx # rax += rdx
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	add	DWORD PTR -4[rbp], 1 # ++index
.L2:
	mov	eax, DWORD PTR -4[rbp] # eax = index
	cmp	eax, DWORD PTR -20[rbp] # сравнение eax и length
	jl	.L3 # if (eax < length), то продолжаем цикл
	nop
	nop
	leave
	ret
	.size	fillArrayManual, .-fillArrayManual
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
