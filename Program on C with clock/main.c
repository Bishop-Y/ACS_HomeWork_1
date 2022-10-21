#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void fillArrayManual(int size, int* array);
void function(const int* first, int* second, int size);
void generation(int size, int* array);
void fillArrayFile(int size, int* array);
void writeResult(int size, int* array);

int main(int argc, char* argv[]) {
    int length;
    int inputType;
    if (argc == 2) {
        length = atoi(argv[1]);
        int A[length], B[length];
        fillArrayFile(length, A);
        function(A, B, length);
        writeResult(length, B);
        return 0;
    }
    printf("Enter input length (0 < length <= 200):");
    scanf("%d", &length);

    if (length < 1 || length > 200) {
        printf("Incorrect length = %d", length);
        return 1;
    }

    int A[length], B[length];
    printf("Enter type of filling: manual (1) or random (number != 1):");
    scanf("%d", &inputType);

    if (inputType == 1) {
        fillArrayManual(length, A);
    } else {
        generation(length, A);
    }
    time_t start_time =  clock();
    int i;
    for (i = 0; i < 5000000; ++i) {
        function(A, B, length);
    }
    time_t end_time = clock();
    printf("\n\nB: ");
    for (i = 0; i < length; ++i) {
        printf("%d ", B[i]);
    }
    printf("\n\n%d\n", (int)difftime(end_time, start_time));
    return 0;
}