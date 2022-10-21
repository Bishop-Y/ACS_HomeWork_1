#include <stdio.h>

void fillArrayManual(int length, int *array) {
    int index;
    printf("\n");
    for (index = 0; index < length; ++index) {
        printf("A[%d] =", index);
        scanf("%d", array + index);
    }
}
