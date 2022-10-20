#include <stdio.h>

void fillArrayFile(int size, int* array) {
    FILE* input;
    input = fopen("input.txt", "r");
    int index;
    for (index = 0; index < size; ++index) {
        fscanf(input, "%d", &array[index]);
    }
    fclose(input);
}
