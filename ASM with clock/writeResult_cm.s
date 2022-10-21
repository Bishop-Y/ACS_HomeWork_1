	.file	"writeResult.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"w"
.LC1:
	.string	"output.txt"
.LC2:
	.string	"%d "
	.text
	.globl	writeResult
	.type	writeResult, @function
writeResult:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	DWORD PTR -20[rbp], edi
	mov	QWORD PTR -32[rbp], rsi
	lea	rsi, .LC0[rip]
	lea	rdi, .LC1[rip]
	call	fopen@PLT
	mov	QWORD PTR -8[rbp], rax
	# mov DWORD PTR -12[rbp], 0
    mov r13d, 0 #
	jmp	.L2
.L3:
	# mov eax, DWORD PTR -12[rbp]
    mov eax, r13d #
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -8[rbp]
	lea	rsi, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	# add DWORD PTR -12[rbp], 1
    add r13d, 1 #
.L2:
	# mov eax, DWORD PTR -12[rbp]
    mov eax, r13d #
	cmp	eax, DWORD PTR -20[rbp]
	jl	.L3
	nop
	nop
	leave
	ret
	.size	writeResult, .-writeResult
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
