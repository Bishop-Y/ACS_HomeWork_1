#include <stdio.h>
#include <stdlib.h>

void generation(int size, int* array) {
    int index;
    int seed;
    printf("Enter seed: ");
    scanf("%d", &seed);
    srand(seed);
    printf("\nA: ");
    for (index = 0; index < size; ++index) {
        array[index] = rand() % 10;
        printf("%d ", array[index]);
    }
}
