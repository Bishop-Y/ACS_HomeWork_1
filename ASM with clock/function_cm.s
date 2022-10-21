	.file	"function.c"
	.intel_syntax noprefix
	.text
	.globl	function
	.type	function, @function
function:
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	DWORD PTR -36[rbp], edx
	# mov DWORD PTR -12[rbp], 0
	mov r14d, 0 #
	# mov DWORD PTR -8[rbp], 1
	mov r15d, 1 #
	# mov DWORD PTR -4[rbp], 0
	mov r12d, 0 #
	jmp	.L2
.L5:
	mov	eax, DWORD PTR -36[rbp]
	add	eax, 1
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	# cmp DWORD PTR -4[rbp], eax
	cmp r12d, eax #
	jge	.L3
	# mov eax, DWORD PTR -4[rbp]
	mov eax, r12d #
	# cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	edx, r14d #
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*4]
	mov	rdx, QWORD PTR -32[rbp]
	add	rdx, rcx
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR [rdx], eax
	add	r14d, 2
	jmp	.L4
.L3:
	# mov eax, DWORD PTR -4[rbp]
	mov eax, r12d #
	# cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	edx, r15d
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*4]
	mov	rdx, QWORD PTR -32[rbp]
	add	rdx, rcx
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR [rdx], eax
	add	r15d, 2
.L4:
	# add DWORD PTR -4[rbp], 1
	add r12d, 1 #
.L2:
	# mov eax, DWORD PTR -4[rbp]
	mov eax, r12d #
	cmp	eax, DWORD PTR -36[rbp]
	jl	.L5
	nop
	nop
	pop	rbp
	ret
	.size	function, .-function
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
