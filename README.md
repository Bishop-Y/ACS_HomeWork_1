# ACS_HomeWork_1 <br/> Работу выполнил Епифанов Артём, группа БПИ 217, Вариант 37
# Введение:
## Условие задачи
> * Изначальное условие задачи мне показалось не совсем корректнм (так как в массиве B порождались пустые элементы, и было непонятно чем их заполнять). Поэтому я решил, что вместо условия i <= (N / 2) буду использовать i < (N / 2). Тогда одна часть массива B дополняет другую, и в массиве B стали отсутствовать пустые элементы.
## Программа на C и на ассемблере без замера времени:
> * Чтобы использовать ввод с файла, надо использовать командную стркоу и прописать в нейкорректное количество элементов в файле input.txt. Результат выполнения программы запишется в файл output.txt
> * Чтобы использовать ручной ввод или рандомный, не вводите дополнительные параметры в командную строку и следуйте командам, которые будут предлагаться по мере использования программы. Результат будет выводиться в командную строку.
> * [Программа на C без замера времени](https://github.com/Bishop-Y/ACS_HomeWork_1/tree/main/Program%20on%20C) <br/>
> * [Программа на ассемблере без модификаций и без замера времени, с комментариями](https://github.com/Bishop-Y/ACS_HomeWork_1/tree/main/ASM%20without%20modifications) <br/>
> * [Программа на ассемблере с модификациями без замера времени, с комментариями](https://github.com/Bishop-Y/ACS_HomeWork_1/tree/main/ASM%20with%20modifications) <br/>

## Программа на C и на ассемблере с замером времени: 
> * Максимальное количество элементов возросло до 200 включительно, а function отрабатывает 5000000 раз.
> * [Программа на C с замером времени](https://github.com/Bishop-Y/ACS_HomeWork_1/tree/main/Program%20on%20C%20with%20clock) <br/>
> * [Программа на ассемблере с замером времени без модификаций](https://github.com/Bishop-Y/ACS_HomeWork_1/tree/main/ASM%20without%20modifications%20with%20clock) <br/>
> * [Программа на ассемблере с замером времени с модификациями](https://github.com/Bishop-Y/ACS_HomeWork_1/tree/main/ASM%20with%20clock) <br/>

# На 4 балла:
## Приведено решение задачи на C: <br/>
> * [Программа на C без замера времени](https://github.com/Bishop-Y/ACS_HomeWork_1/tree/main/Program%20on%20C) <br/>

## Ассемблерная программа без модификаций: <br/>
> * [Программа на ассемблере без модификаций и без замера времени, с комментариями](https://github.com/Bishop-Y/ACS_HomeWork_1/tree/main/ASM%20without%20modifications) <br/>
> * [Информация о переменных на стеке в разных файлах](https://github.com/Bishop-Y/ACS_HomeWork_1/blob/main/ASM%20without%20modifications/stack_info.md) <br/>

## Ассемблерная программа с модификациями: <br/>
> * [Программа на ассемблере с модификациями без замера времени, с комментариями](https://github.com/Bishop-Y/ACS_HomeWork_1/tree/main/ASM%20with%20modifications) <br/>

## Тесты: <br/>
> * [Тесты](https://github.com/Bishop-Y/ACS_HomeWork_1/blob/main/Tests.md) <br/>

## Отчёт: <br/>
> * [Отчёт](https://github.com/Bishop-Y/ACS_HomeWork_1/blob/main/ASM%20with%20modifications/README.md) <br/>
---- 
# На 5 баллов:
##  Программа на C с передачей данных через параметры + использованы локальные переменные: <br/>
> * [Программа на C](https://github.com/Bishop-Y/ACS_HomeWork_1/tree/main/Program%20on%20C) <br/>

## Модифицированная ассемблерная программа с комментариями + комментарии, показывающие связь между параметрами языка C и стеком: <br/>
> * [Программа на ассемблере с модификациями, с комментариями](https://github.com/Bishop-Y/ACS_HomeWork_1/tree/main/ASM%20with%20modifications) <br/>
> * [Информация о переменных на стеке в разных модифицированных файлах](https://github.com/Bishop-Y/ACS_HomeWork_1/blob/main/ASM%20with%20modifications/stack_mod_info.md)

## Отчёт: <br/>
> * Вызовы уже существующих функций были прокомментированны. Была прокоментированна связь между параметрами языка Си и регистрами по правилам:
> * eax/rax - для запоминания/копирования данных
> * rdi/edi - первый аргумент в функции
> * rsi/esi - второй аргумент в функции
> * rdx/edx - третий аргумент в функции
> * rcx - счётчик
> * [Отчёт](https://github.com/Bishop-Y/ACS_HomeWork_1/blob/main/ASM%20with%20modifications/README.md) <br/>
---- 
# На 6 баллов:
## Модифицированная ассемблерная программа с проведенным рефакторингом + с поясняющими комментариями: <br/>
> * [Программа на ассемблере с модификациями, с комментариями](https://github.com/Bishop-Y/ACS_HomeWork_1/tree/main/ASM%20with%20modifications) <br/>
> * [Информация о переменных на стеке в разных модифицированных файлах](https://github.com/Bishop-Y/ACS_HomeWork_1/blob/main/ASM%20with%20modifications/stack_mod_info.md)

## Тесты: <br/>
> * [Тесты](https://github.com/Bishop-Y/ACS_HomeWork_1/blob/main/Tests.md) <br/>

## Отчёт: <br/>
> * [Отчёт](https://github.com/Bishop-Y/ACS_HomeWork_1/blob/main/ASM%20with%20modifications/README.md) <br/>
----
# На 7 баллов:

## Модифицированная программа на ассемблере, в виде 6 единиц компиляции: <br/>
> * [Модифицированная программа на ассемблере](https://github.com/Bishop-Y/ACS_HomeWork_1/tree/main/ASM%20without%20modifications) <br/>

## Модифицированная программа на ассемблере, с поддержкой ввода с файла и вывода в файл: <br/>
> * [Модифицированная программа на ассемблере](https://github.com/Bishop-Y/ACS_HomeWork_1/tree/main/ASM%20without%20modifications) <br/>

## Тесты ввода с файла и вывод в файл: <br/>
> * [Тесты](https://github.com/Bishop-Y/ACS_HomeWork_1/blob/main/Tests.md) <br/>

## Отчёт: <br/>
> * [Отчёт](https://github.com/Bishop-Y/ACS_HomeWork_1/blob/main/ASM%20with%20modifications/README.md) <br/>
----
# На 8 баллов:
## Программа на C с генератором данных: <br/>
> * [Программа на C без замера времени](https://github.com/Bishop-Y/ACS_HomeWork_1/tree/main/Program%20on%20C) <br/>
## Программа на ассемблере с генератором данных: <br/>
> * [Модифицированная программа на ассемблере без замера времени](https://github.com/Bishop-Y/ACS_HomeWork_1/tree/main/ASM%20without%20modifications) <br/>
## Тесты генерации массивов: <br/>
> * [Тесты](https://github.com/Bishop-Y/ACS_HomeWork_1/blob/main/Tests.md) <br/>
# На 8-9 баллов:
## Замер времени: <br/>
> * [Программа на C с замером времени](https://github.com/Bishop-Y/ACS_HomeWork_1/tree/main/Program%20on%20C%20with%20clock) <br/>
> * [Программа на ассемблере с замером времени без модификаций](https://github.com/Bishop-Y/ACS_HomeWork_1/tree/main/ASM%20without%20modifications%20with%20clock) <br/>
> * [Программа на ассемблере с замером времени с модификациями](https://github.com/Bishop-Y/ACS_HomeWork_1/tree/main/ASM%20with%20clock) <br/>
## Тесты замера времени с отчётом: <br/>
> * Количество элементов в массиве было увеличено до 200, а function (заполнение массива B) прокручивалась 5000000 раз для увеличение времени работы программы.
> * В программе на ассемблере итерируемые переменные были заменены на регистры r12d, r13d, r14d и r15d. За счёт этого программа стала работать быстрее в ~1.6 раз. 
> * [Тесты](https://github.com/Bishop-Y/ACS_HomeWork_1/blob/main/Tests.md) <br/>
