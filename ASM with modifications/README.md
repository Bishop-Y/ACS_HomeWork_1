# Для модификации была применена команда 
>     gcc -O0 -Wall -masm=intel -S -fno-asynchronous-unwind-tables -fcf-protection=none name.s -o name.o
После чего все файлы были отредактированны вручную:
# main_mod.s
###    Бесполезные переприсваивания:
*     - mov r12, rax
*     - mov eax, DWORD PTR -116[rbp]
*     - mov eax, DWORD PTR -116[rbp]
      - mov	rdx, QWORD PTR -64[rbp]
      - mov	rsi, rdx
      - mov edi, eax
      + mov rsi, QWORD PTR -64[rbp]
      + mov edi, DWORD PTR -116[rbp]
*     - mov rcx, QWORD PTR -48[rbp]
      - mov rax, QWORD PTR -64[rbp]
      - mov rsi, rcx
      - mov rdi, rax
      + mov rsi, QWORD PTR -48[rbp]
      + mov rdi, QWORD PTR -64[rbp]
*     - mov eax, DWORD PTR -116[rbp]
      - mov rdx, QWORD PTR -48[rbp]
      - mov rsi, rdx
      - mov edi, eax
      + mov rsi, QWORD PTR -48[rbp]
      + mov edi, DWORD PTR -116[rbp]
*     - mov eax, DWORD PTR -116[rbp]
      - mov esi, eax
      - mov esi, DWORD PTR -116[rbp]
*     - mov r14, rdx
      - mov r15d, 0   
*     - mov eax, DWORD PTR -116[rbp]
      - mov rdx, QWORD PTR -104[rbp]
      - mov rsi, rdx
      - mov edi, eax
      + mov rsi, QWORD PTR -104[rbp]
      + mov edi, DWORD PTR -116[rbp]
*     - mov eax, DWORD PTR -116[rbp]
      - mov rdx, QWORD PTR -104[rbp]
      - mov rsi, rdx
      - mov edi, eax
      + mov rsi, QWORD PTR -104[rbp]
      + mov edi, DWORD PTR -116[rbp]
*     - mov rcx, QWORD PTR -80[rbp]
      - mov rax, QWORD PTR -104[rbp]
      - mov rsi, rcx
      - mov rdi, rax
      + mov rsi, QWORD PTR -80[rbp]
      + mov rdi, QWORD PTR -104[rbp]
*     Удалены cdqe
*     Удалена канарейка и весь блок .L9, в программе jmp .L9 заменено на jmp .L23: 
      - mov rax, QWORD PTR fs:40
      - mov QWORD PTR -40[rbp], rax
      В конце:
      - .L9:
      - mov rsp, r12
      - mov rbx, QWORD PTR -40[rbp]
      - xor rbx, QWORD PTR fs:40
      - je .L23
      - call __stack_chk_fail@PLT
###     С массивами:
*     В каждом объявлении массива аккуратно удалены лишние переменные
*     Например одно из таких бесполезных созданий (массив А):
      - sub rdx, 1
      - mov QWORD PTR -72[rbp], rdx
      - movsx rdx, eax
      - mov QWORD PTR -160[rbp], rdx
      - mov QWORD PTR -152[rbp], 0
      - movsx	rdx, eax
      - mov QWORD PTR -176[rbp], rdx
      - mov QWORD PTR -168[rbp], 0

###     Регистры:
Были добавлены:
*     r15d вместо lenght
*     r15 вместо указателя на начало массива A
*     r12 вместо указателя на начало массива B
*     r11d вместо input type
*     r13d вместо i (итерируемая переменная)

# function_mod.s
### Удалены ненужные присваивания:
*     - mov edx, DWORD PTR -12[rbp]
      - movsx rdx, edx
      + movsx rdx, DWORD PTR -12[rbp]
*     - mov edx, DWORD PTR -8[rbp]
      - movsx rdx, edx
      + movsx rdx, DWORD PTR -8[rbp]
###     Регистры:
*     r13d вместо index (итерируемая переменная)
*     r15d вместо size

# fillArray_mod.s
### Регистры:
*     r13d вместо index (итерируемая переменная)
*     r15d вместо length

# generaion_mod.s
###     Регистры:
*     r13d вместо index (итерируемая переменная)
*     r15d вместо size

# fillArrayFile_mod.s
###     Регистры:
*     r13d вместо index (итерируемая переменная)
*     r15d вместо size
*     r14 вместо input

# fillArrayFile_mod.s
###     Регистры:
*     r13d вместо index (итерируемая переменная)
*     r15d вместо size
*     r14 вместо output
