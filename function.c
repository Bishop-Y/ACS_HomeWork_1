void function(const int *a, int *b, int size) {
    int even = 0;
    int odd = 1;
    int index;
    for (index = 0; index < size; ++index) {
        if (index < (size + 1) / 2) {
            b[even] = a[index];
            even += 2;
        } else {
            b[odd] = a[index];
            odd += 2;
        }
    }
}
