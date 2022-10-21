	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"Enter input length (0 < length <= 20):"
.LC1:
	.string	"%d"
.LC2:
	.string	"Incorrect length = %d"
	.align 8
.LC3:
	.string	"Enter type of filling: manual (1) or random (number != 1):"
.LC4:
	.string	"\nB: "
.LC5:
	.string	"%d "
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
	sub	rsp, 192
	mov	DWORD PTR -132[rbp], edi # запись argc (-132 = argc)
	mov	QWORD PTR -144[rbp], rsi # запись argv (-144 = argv)
	# mov rax, QWORD PTR fs:40
	# mov QWORD PTR -40[rbp], rax
	xor	eax, eax
	mov	rax, rsp
	# mov r12, rax
	cmp	DWORD PTR -132[rbp], 2 # сравниваем argc с 2
	jne	.L2 # if (argc == 2) (...) else (...)
	mov	rax, rsp
	mov	rbx, rax
	mov	rax, QWORD PTR -144[rbp] # # сохраняем значение rax = argv[0]
	add	rax, 8 # rax += 8 (указываем на argv[1])
	mov	rax, QWORD PTR [rax]
    mov	rdi, rax # rdi = rax (передаём в функцию atoi параметр argv[1])
	call	atoi@PLT
	mov	DWORD PTR -116[rbp], eax # length = резульать функции atoi
	# mov	eax, DWORD PTR -116[rbp]
	mov r15d, DWORD PTR -116[rbp] # запись length в r15d
	movsx	rdx, eax
	# sub rdx, 1
	# mov QWORD PTR -72[rbp], rdx
	# movsx	rdx, eax
	# mov QWORD PTR -160[rbp], rdx
	# mov	QWORD PTR -152[rbp], 0
	# movsx	rdx, eax
	# mov QWORD PTR -176[rbp], rdx
	# mov QWORD PTR -168[rbp], 0
	# cdqe
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
	mov r15, QWORD PTR -64[rbp] # r15 = указатель на начало массива A из cmd
	mov	eax, DWORD PTR -116[rbp]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -56[rbp], rdx
	movsx	rdx, eax
	mov	r10, rdx
	mov	r11d, 0
	movsx	rdx, eax
	mov	r8, rdx
	mov	r9d, 0
	# cdqe
	lea	rdx, 0[0+rax*4]
	mov	eax, 16
	sub	rax, 1
	add	rax, rdx
	mov	esi, 16
	mov	edx, 0
	div	rsi
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
	mov r12, QWORD PTR -48[rbp] # r12 = указатель на начало массива B с cmd
	# mov eax, DWORD PTR -116[rbp]
	# mov	rdx, QWORD PTR -64[rbp]
	# mov	rsi, rdx
	mov rsi, QWORD PTR -64[rbp] # оптимизированная передача указателя массива A в fillArrayFile
	# mov edi, eax
	mov edi, DWORD PTR -116[rbp] # оптимизированная передача длины массива (length)
	call	fillArrayFile@PLT
	mov	edx, DWORD PTR -116[rbp] # передача length в function
    # mov rcx, QWORD PTR -48[rbp]
	# mov rax, QWORD PTR -64[rbp]
	# mov rsi, rcx
	mov rsi, QWORD PTR -48[rbp] # оптимизированная передача указателя массива B в function
	# mov rdi, rax
	mov rdi, QWORD PTR -64[rbp] # оптимизированная передача указателя массива A в function
	call	function@PLT
	# mov eax, DWORD PTR -116[rbp]
	# mov rdx, QWORD PTR -48[rbp]
	# mov rsi, rdx
	mov rsi, QWORD PTR -48[rbp] # оптимизированная передача указателя массива B в writeResult
	# mov edi, eax
	mov edi, DWORD PTR -116[rbp] # оптимизированная передача length в writeResult
	call	writeResult@PLT
	mov	eax, 0
	mov	rsp, rbx
	# jmp .L9
.L2:
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rax, -116[rbp]
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -116[rbp] # eax = length
	mov r15d, DWORD PTR -116[rbp] # r15d = length 
	test	eax, eax
	jle	.L10
	mov	eax, DWORD PTR -116[rbp]
	cmp	eax, 20
	jle	.L11
.L10:
	# mov eax, DWORD PTR -116[rbp]
	# mov esi, eax
	mov esi, DWORD PTR -116[rbp] # оптимизированная передача length в printf
	lea	rdi, .LC2[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 1
	# jmp .L9
.L11:
	mov	eax, DWORD PTR -116[rbp]
	# movsx	rdx, eax
	# sub rdx, 1
	# mov QWORD PTR -96[rbp], rdx
	movsx	rdx, eax
	# mov QWORD PTR -192[rbp], rdx
	# mov QWORD PTR -184[rbp], 0
	# movsx	rdx, eax
	# mov QWORD PTR -208[rbp], rdx
	# mov QWORD PTR -200[rbp], 0
	# cdqe
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
	mov	QWORD PTR -104[rbp], rax
	mov r15, QWORD PTR -104[rbp] # r15 = указатель на начало массива A
	mov	eax, DWORD PTR -116[rbp]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -88[rbp], rdx
	movsx	rdx, eax
	mov	QWORD PTR -224[rbp], rdx
	mov	QWORD PTR -216[rbp], 0
	movsx	rdx, eax
	# mov r14, rdx
	# mov r15d, 0
	# cdqe
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
	mov	QWORD PTR -80[rbp], rax
	mov r12, QWORD PTR -80[rbp] # r12 = указатель на начало массива B
	lea	rdi, .LC3[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rax, -112[rbp]
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -112[rbp] # -112 = input type
	cmp	eax, 1
	jne	.L18
	# mov eax, DWORD PTR -116[rbp]
	# mov rdx, QWORD PTR -104[rbp]
	# mov rsi, rdx
	mov rsi, QWORD PTR -104[rbp] # оптимизированная передача указателя массива A в fillArrayManual
	# mov edi, eax
	mov edi, DWORD PTR -116[rbp] # оптимизированная передача length в fillArrayManual
	call	fillArrayManual@PLT
	jmp	.L19
.L18:
	# mov eax, DWORD PTR -116[rbp]
	# mov rdx, QWORD PTR -104[rbp]
	# mov rsi, rdx
	mov rsi, QWORD PTR -104[rbp] # оптимизированная передача указателя массива A в generation
	# mov edi, eax
	mov edi, DWORD PTR -116[rbp] # оптимизированная передача length в generation
	call	generation@PLT
.L19:
	mov	edx, DWORD PTR -116[rbp] # передача length в function
	# mov rcx, QWORD PTR -80[rbp]
	# mov rax, QWORD PTR -104[rbp]
	# mov rsi, rcx
	mov rsi, QWORD PTR -80[rbp] # оптимизированная передача указателя массива B в function
	# mov rdi, rax
	mov rdi, QWORD PTR -104[rbp] # оптимизированная передача указателя массива A в function
	call	function@PLT
	lea	rdi, .LC4[rip]
	mov	eax, 0
	call	printf@PLT
	mov	r13d, 0 # DWORD PTR -108[rbp] => r13d (итерируемая переменная)
	jmp	.L20
.L21:
	mov	rax, QWORD PTR -80[rbp]
	mov	edx, r13d # DWORD PTR -108[rbp] => r13d
	movsx	rdx, edx
	mov	eax, DWORD PTR [rax+rdx*4]
	mov	esi, eax
	lea	rdi, .LC5[rip]
	mov	eax, 0
	call	printf@PLT
	add	r13d, 1 # DWORD PTR -108[rbp] => r13d
.L20:
	mov	eax, DWORD PTR -116[rbp]
	cmp	r13d, eax # DWORD PTR -108[rbp] => r13d
	jl	.L21
	mov	eax, 0
# .L9:
	# mov rsp, r12
	# mov rbx, QWORD PTR -40[rbp]
	# xor rbx, QWORD PTR fs:40
	# je .L23
	# call	__stack_chk_fail@PLT
.L23:
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
