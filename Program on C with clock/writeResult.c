#include <stdio.h>

void writeResult(int size, int* array) {
    FILE* output;
    output = fopen("..\\output.txt", "w");
    int index;
    for (index = 0; index < size; ++index) {
        fprintf(output, "%d ", array[index]);
    }
}