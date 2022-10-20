	.file	"function.c"
	.intel_syntax noprefix
	.text
	.globl	function
	.type	function, @function
function:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -24[rbp], rdi # указатель на начало массива A (как входной параметр)
	mov	QWORD PTR -32[rbp], rsi # указатель на начало массива B (как входной параметр)
	mov	DWORD PTR -36[rbp], edx # размер (как передаваемый параметр)
	mov	DWORD PTR -4[rbp], 0 # even = 0
	mov	DWORD PTR -8[rbp], 1 # odd = 1
	mov	DWORD PTR -12[rbp], 0 # index = 0
	jmp	.L2 # переход в цикл
.L5:
	mov	eax, DWORD PTR -36[rbp] # eax = size
	add	eax, 1 #  в if выражение size + 1
	mov	edx, eax # edx = eax = size + 1
	shr	edx, 31
	add	eax, edx
	sar	eax # eax /= 2
	cmp	DWORD PTR -12[rbp], eax # сравнение index и (size + 1) / 2
	jge	.L3 # if (index >= (size + 1) / 2)
	mov	eax, DWORD PTR -12[rbp] # eax = index
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp] # rax = указатель на начало A
	add	rax, rdx 
	mov	edx, DWORD PTR -4[rbp] # edx = even
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*4]
	mov	rdx, QWORD PTR -32[rbp] # rdx = указатель на начало массива B
	add	rdx, rcx 
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR [rdx], eax 
	add	DWORD PTR -4[rbp], 2 # even += 2
	jmp	.L4
.L3:
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR -8[rbp]
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*4]
	mov	rdx, QWORD PTR -32[rbp]
	add	rdx, rcx
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR [rdx], eax
	add	DWORD PTR -8[rbp], 2 # odd += 2
.L4:
	add	DWORD PTR -12[rbp], 1
.L2:
	mov	eax, DWORD PTR -12[rbp] # eax = index
	cmp	eax, DWORD PTR -36[rbp] # index == size
	jl	.L5 # if (index < size)
	nop
	nop
	pop	rbp
	ret
	.size	function, .-function
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
