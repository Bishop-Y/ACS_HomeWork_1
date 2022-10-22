	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"Enter input length (0 < length <= 200):"
.LC1:
	.string	"%d"
.LC2:
	.string	"Incorrect length = %d"
	.align 8
.LC3:
	.string	"Enter type of filling: manual (1) or random (number != 1):"
.LC4:
	.string	"\n\nB: "
.LC5:
	.string	"%d "
.LC6:
	.string	"\n\n%d\n"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	r12
	push	rbx
	sub	rsp, 240
	mov	DWORD PTR -148[rbp], edi
	mov	QWORD PTR -160[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -40[rbp], rax
	xor	eax, eax
	mov	rax, rsp
	mov	r12, rax
	cmp	DWORD PTR -148[rbp], 2
	jne	.L2
	mov	rax, rsp
	mov	rbx, rax
	mov	rax, QWORD PTR -160[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -132[rbp], eax
	mov	eax, DWORD PTR -132[rbp]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -72[rbp], rdx
	movsx	rdx, eax
	mov	QWORD PTR -176[rbp], rdx
	mov	QWORD PTR -168[rbp], 0
	movsx	rdx, eax
	mov	QWORD PTR -192[rbp], rdx
	mov	QWORD PTR -184[rbp], 0
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	eax, 16
	sub	rax, 1
	add	rax, rdx
	mov	ecx, 16
	mov	edx, 0
	div	rcx
	imul	rax, rax, 16
	mov	rdx, rax
	and	rdx, -4096
	mov	rcx, rsp
	sub	rcx, rdx
	mov	rdx, rcx
.L3:
	cmp	rsp, rdx
	je	.L4
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L3
.L4:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L5
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L5:
	mov	rax, rsp
	add	rax, 3
	shr	rax, 2
	sal	rax, 2
	mov	QWORD PTR -64[rbp], rax
	mov	eax, DWORD PTR -132[rbp]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -56[rbp], rdx
	movsx	rdx, eax
	mov	QWORD PTR -208[rbp], rdx
	mov	QWORD PTR -200[rbp], 0
	movsx	rdx, eax
	mov	QWORD PTR -224[rbp], rdx
	mov	QWORD PTR -216[rbp], 0
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	eax, 16
	sub	rax, 1
	add	rax, rdx
	mov	ecx, 16
	mov	edx, 0
	div	rcx
	imul	rax, rax, 16
	mov	rdx, rax
	and	rdx, -4096
	mov	rcx, rsp
	sub	rcx, rdx
	mov	rdx, rcx
.L6:
	cmp	rsp, rdx
	je	.L7
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L6
.L7:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L8
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L8:
	mov	rax, rsp
	add	rax, 3
	shr	rax, 2
	sal	rax, 2
	mov	QWORD PTR -48[rbp], rax
	mov	eax, DWORD PTR -132[rbp]
	mov	rdx, QWORD PTR -64[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	fillArrayFile@PLT
	mov	edx, DWORD PTR -132[rbp]
	mov	rcx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -64[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	function@PLT
	mov	eax, DWORD PTR -132[rbp]
	mov	rdx, QWORD PTR -48[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	writeResult@PLT
	mov	eax, 0
	mov	rsp, rbx
	jmp	.L9
.L2:
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rax, -132[rbp]
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -132[rbp]
	test	eax, eax
	jle	.L10
	mov	eax, DWORD PTR -132[rbp]
	cmp	eax, 200
	jle	.L11
.L10:
	mov	eax, DWORD PTR -132[rbp]
	mov	esi, eax
	lea	rdi, .LC2[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 1
	jmp	.L9
.L11:
	mov	eax, DWORD PTR -132[rbp]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -120[rbp], rdx
	movsx	rdx, eax
	mov	QWORD PTR -240[rbp], rdx
	mov	QWORD PTR -232[rbp], 0
	movsx	rdx, eax
	mov	QWORD PTR -256[rbp], rdx
	mov	QWORD PTR -248[rbp], 0
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	eax, 16
	sub	rax, 1
	add	rax, rdx
	mov	ebx, 16
	mov	edx, 0
	div	rbx
	imul	rax, rax, 16
	mov	rdx, rax
	and	rdx, -4096
	mov	rbx, rsp
	sub	rbx, rdx
	mov	rdx, rbx
.L12:
	cmp	rsp, rdx
	je	.L13
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L12
.L13:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L14
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L14:
	mov	rax, rsp
	add	rax, 3
	shr	rax, 2
	sal	rax, 2
	mov	QWORD PTR -112[rbp], rax
	mov	eax, DWORD PTR -132[rbp]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -104[rbp], rdx
	movsx	rdx, eax
	mov	QWORD PTR -272[rbp], rdx
	mov	QWORD PTR -264[rbp], 0
	movsx	rdx, eax
	mov	r14, rdx
	mov	r15d, 0
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	eax, 16
	sub	rax, 1
	add	rax, rdx
	mov	ebx, 16
	mov	edx, 0
	div	rbx
	imul	rax, rax, 16
	mov	rdx, rax
	and	rdx, -4096
	mov	rbx, rsp
	sub	rbx, rdx
	mov	rdx, rbx
.L15:
	cmp	rsp, rdx
	je	.L16
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L15
.L16:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L17
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L17:
	mov	rax, rsp
	add	rax, 3
	shr	rax, 2
	sal	rax, 2
	mov	QWORD PTR -96[rbp], rax
	lea	rdi, .LC3[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rax, -128[rbp]
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -128[rbp]
	cmp	eax, 1
	jne	.L18
	mov	eax, DWORD PTR -132[rbp]
	mov	rdx, QWORD PTR -112[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	fillArrayManual@PLT
	jmp	.L19
.L18:
	mov	eax, DWORD PTR -132[rbp]
	mov	rdx, QWORD PTR -112[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	generation@PLT
.L19:
	call	clock@PLT
	mov	QWORD PTR -88[rbp], rax
	mov	DWORD PTR -124[rbp], 0
	jmp	.L20
.L21:
	mov	edx, DWORD PTR -132[rbp]
	mov	rcx, QWORD PTR -96[rbp]
	mov	rax, QWORD PTR -112[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	function@PLT
	add	DWORD PTR -124[rbp], 1
.L20:
	cmp	DWORD PTR -124[rbp], 4999999
	jle	.L21
	call	clock@PLT
	mov	QWORD PTR -80[rbp], rax
	lea	rdi, .LC4[rip]
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -124[rbp], 0
	jmp	.L22
.L23:
	mov	rax, QWORD PTR -96[rbp]
	mov	edx, DWORD PTR -124[rbp]
	movsx	rdx, edx
	mov	eax, DWORD PTR [rax+rdx*4]
	mov	esi, eax
	lea	rdi, .LC5[rip]
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -124[rbp], 1
.L22:
	mov	eax, DWORD PTR -132[rbp]
	cmp	DWORD PTR -124[rbp], eax
	jl	.L23
	mov	rdx, QWORD PTR -88[rbp]
	mov	rax, QWORD PTR -80[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	difftime@PLT
	cvttsd2si	eax, xmm0
	movsx	rdx, eax
	imul	rdx, rdx, 274877907
	shr	rdx, 32
	sar	edx, 6
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	mov	esi, eax
	lea	rdi, .LC6[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
.L9:
	mov	rsp, r12
	mov	rbx, QWORD PTR -40[rbp]
	xor	rbx, QWORD PTR fs:40
	je	.L25
	call	__stack_chk_fail@PLT
.L25:
	lea	rsp, -32[rbp]
	pop	rbx
	pop	r12
	pop	r14
	pop	r15
	pop	rbp
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
