	.file	"function.c"
	.intel_syntax noprefix
	.text
	.globl	function
	.type	function, @function
function:
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -24[rbp], rdi # первый входной параметр из функции (указатель на начало массива A)
	mov	QWORD PTR -32[rbp], rsi # первый входной параметр из функции (указатель на начало массива B)
	mov	DWORD PTR -36[rbp], edx # третий входной параметр (size)
	mov	DWORD PTR -12[rbp], 0 # -12 = even
	mov	DWORD PTR -8[rbp], 1 # -8 = odd
	mov	r13d, 0 # DWORD PTR -4[rbp] => r13d # -4 = index
	jmp	.L2
.L5:
	mov	eax, DWORD PTR -36[rbp]
	add	eax, 1
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	cmp	r13d, eax # DWORD PTR -4[rbp] => r13d
	jge	.L3
	mov	eax, r13d # DWORD PTR -4[rbp] => r13d
	# cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	# mov edx, DWORD PTR -12[rbp]
	# movsx	rdx, edx
	movsx rdx, DWORD PTR -12[rbp] #
	lea	rcx, 0[0+rdx*4]
	mov	rdx, QWORD PTR -32[rbp]
	add	rdx, rcx
	mov eax, DWORD PTR [rax]
	mov DWORD PTR [rdx], eax
	add	DWORD PTR -12[rbp], 2
	jmp	.L4
.L3:
	mov	eax, r13d # DWORD PTR -4[rbp] => r13d
	# cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	# mov edx, DWORD PTR -8[rbp]
	# movsx	rdx, edx
	movsx rdx, DWORD PTR -8[rbp] #
	lea	rcx, 0[0+rdx*4]
	mov	rdx, QWORD PTR -32[rbp]
	add	rdx, rcx
	mov eax, DWORD PTR [rax]
	mov DWORD PTR [rdx], eax
	add	DWORD PTR -8[rbp], 2
.L4:
	add	r13d, 1 # DWORD PTR -4[rbp] => r13d
.L2:
	mov	eax, r13d # DWORD PTR -4[rbp] => r13d
	cmp	eax, DWORD PTR -36[rbp]
	jl	.L5
	nop
	nop
	pop	rbp
	ret
	.size	function, .-function
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
