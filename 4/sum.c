#include <stdio.h>
#include <time.h>

int main() {
    int n = 100000000; // 100 millones
    long long sum = 0;
    clock_t start, end;
    double cpu_time_used;

    start = clock();
    for (int i = 1; i <= n; i++) {
        sum += i;
    }
    end = clock();

    cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
    printf("Suma: %lld\n", sum);
    printf("Tiempo de ejecución en C: %f segundos\n", cpu_time_used);

    return 0;
}
