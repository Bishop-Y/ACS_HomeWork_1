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
	endbr64
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	r12
	push	rbx
	sub	rsp, 176
	mov	DWORD PTR -116[rbp], edi # запись argc (-116 - argc)
	mov	QWORD PTR -128[rbp], rsi # запись argv (-128 - argv)
	mov	rax, rsp
	mov	r12, rax
	cmp	DWORD PTR -116[rbp], 2 # сравниваем argc с 2
	jne	.L2 # if (argc == 2) (...) else (...)
	mov	rax, rsp
	mov	rbx, rax
	mov	rax, QWORD PTR -128[rbp] # сохраняем значение argv[0]
	add	rax, 8 # сдвигаемся на argv[1], чтобы считать значение c командной строки
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -108[rbp], eax # length = eax => (-108 - length)
	mov	eax, DWORD PTR -108[rbp] 
	movsx	rdx, eax # начало создания массива A с аргументов cmd
	sub	rdx, 1
	mov	QWORD PTR -80[rbp], rdx 
	movsx	rdx, eax
	mov	QWORD PTR -144[rbp], rdx
	mov	QWORD PTR -136[rbp], 0
	movsx	rdx, eax
	mov	QWORD PTR -160[rbp], rdx
	mov	QWORD PTR -152[rbp], 0
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
	mov	QWORD PTR -88[rbp], rax # указатель на начало массива A c аргументов cmd
	mov	eax, DWORD PTR -108[rbp] # начало создания массива B c аргументов cmd
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -96[rbp], rdx
	movsx	rdx, eax
	mov	r10, rdx
	mov	r11d, 0
	movsx	rdx, eax
	mov	r8, rdx
	mov	r9d, 0
	cdqe
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
	mov	QWORD PTR -104[rbp], rax # указатель на начало массива B c аргументов cmd
	mov	eax, DWORD PTR -108[rbp] # передача в функцию самого массива A c аргументов cmd
	mov	rdx, QWORD PTR -88[rbp] # передача в функцию длины массива A
	mov	rsi, rdx
	mov	edi, eax
	call	fillArrayFile@PLT
	mov	edx, DWORD PTR -108[rbp] # передача в функцию длины массива
	mov	rcx, QWORD PTR -104[rbp] # передача в функцию указателя на начало массива B c аргументов cmd
	mov	rax, QWORD PTR -88[rbp] # передача в функцию указателя на начало массива A c аргументов cmd
	mov	rsi, rcx
	mov	rdi, rax
	call	function@PLT
	mov	eax, DWORD PTR -108[rbp] # передача в функцию длины массива
	mov	rdx, QWORD PTR -104[rbp] # передача в функцию массива B c аргументов cmd
	mov	rsi, rdx
	mov	edi, eax
	call	writeResult@PLT
	mov	eax, 0
	mov	rsp, rbx
	jmp	.L9 # конец программы
.L2:
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rax, -108[rbp]
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -108[rbp] # запись длины массива
	test	eax, eax
	jle	.L10 # если данные некорректны
	mov	eax, DWORD PTR -108[rbp]
	cmp	eax, 20
	jle	.L11 # если данные корректны
.L10:
	mov	eax, DWORD PTR -108[rbp]
	mov	esi, eax
	lea	rdi, .LC2[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 1
	jmp	.L9 # конец работы программы
.L11:
	mov	eax, DWORD PTR -108[rbp]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -48[rbp], rdx # начало создания массива A
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
	mov	QWORD PTR -40[rbp], rax # указатель на начало массива A
	mov	eax, DWORD PTR -108[rbp]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -64[rbp], rdx # начало создания массива B
	movsx	rdx, eax
	mov	QWORD PTR -208[rbp], rdx
	mov	QWORD PTR -200[rbp], 0
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
	mov	QWORD PTR -72[rbp], rax # конец создания массива B
	lea	rdi, .LC3[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rax, -112[rbp]
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -112[rbp] # eax = input type
	cmp	eax, 1 # input type == 1
	jne	.L18 # if (input type != 1)
	mov	eax, DWORD PTR -108[rbp] # передача в функцию длины массива
	mov	rdx, QWORD PTR -40[rbp] # передача в функцию массива A
	mov	rsi, rdx
	mov	edi, eax
	call	fillArrayManual@PLT
	jmp	.L19
.L18:
	mov	eax, DWORD PTR -108[rbp] # передача в функцию длины массива
	mov	rdx, QWORD PTR -40[rbp] # передача в функцию массива A
	mov	rsi, rdx
	mov	edi, eax
	call	generation@PLT
.L19:
	mov	edx, DWORD PTR -108[rbp] # передача в функцию длины массива
	mov	rcx, QWORD PTR -72[rbp] # передача в функцию массива B
	mov	rax, QWORD PTR -40[rbp] # передача в функцию массива A
	mov	rsi, rcx
	mov	rdi, rax
	call	function@PLT
	lea	rdi, .LC4[rip]
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -52[rbp], 0 # объявление итерируемой переменной i = 0
	jmp	.L20 # переход в цикл
.L21:
	mov	rax, QWORD PTR -72[rbp] # rax = начало массива B
	mov	edx, DWORD PTR -52[rbp]
	movsx	rdx, edx
	mov	eax, DWORD PTR [rax+rdx*4] # доcтуп к B[i]
	mov	esi, eax
	lea	rdi, .LC5[rip]
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -52[rbp], 1 # ++i
.L20:
	mov	eax, DWORD PTR -108[rbp] # условие цикла < length
	cmp	DWORD PTR -52[rbp], eax # сравнение i и length
	jl	.L21 # если i < length, то повторяем цикл
	mov	eax, 0
.L9:
	mov	rsp, r12
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
