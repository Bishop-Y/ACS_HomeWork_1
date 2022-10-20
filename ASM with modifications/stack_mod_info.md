# main_mod.s:
-48 = указатель на начало массива B (если ввод с аргументов cmd)
<br> -64 = указатель на начало массива A (если ввод с аргументов cmd)
<br> -80 = указатель на начало массива B
<br> -104 = указатель на начало массива A
<br> -108 = i (итерируемая переменная) 
<br> -112 = input type
<br> -116 = length
<br> -132 = argc
<br> -144 = argv <br/>

# function_mod.s:
-4 = index
<br> -8 = odd
<br> -12 = even
<br> -24 = указатель на начало массива A
<br> -32 = указатель на начало массива B
<br> -36 = size <br/>

# fillArray_mod.s:
-4 = index
<br> -20 = length
<br> -32 = указатель на начало массива A <br/>

# generation_mod.s:
-12 = index
<br> -20 = size
<br> -32 = указатель на начало массива A <br/>

# fillArrayFile_mod.s:
-8 = указатель на input
<br> -12 = index
<br> -20 = size
<br> -32 = указатель на начало массива A <br/>

# writeResult_mod.s:
-8 = указатель на output
<br> -12 = index
<br> -20 = size
<br> -32 = указатель на начало массива B <br/>
