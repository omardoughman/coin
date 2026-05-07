#include <stdio.h>
#include <unistd.h>

int main() {
    printf("C Engine: Running independently...\n");
    while(1) {
        FILE *f = fopen("main.codec", "wb");
        if (f) {
            fprintf(f, "ENCODED_DATA_STREAM");
            fclose(f);
        }
        sleep(10); // Run every 10 seconds
    }
    return 0;
}
