#define _CRT_SECURE_NO_WARNINGS

#include <stdio.h>
#include <stdlib.h>

#define NUMOF_TEST_PATTERN 15
#define ITERATE 100
#define SEED 3

int main(void) {
    FILE *fp_test_pattern, *fp_result;

    fp_test_pattern = fopen("ref_c_rand_test_pattern.txt", "w");
    fp_result       = fopen("ref_c_result.txt", "w");
    
    unsigned char test_pattern[NUMOF_TEST_PATTERN];
    unsigned char result[NUMOF_TEST_PATTERN];

    for(int iterate = 0; iterate < ITERATE; iterate++) {
        srand(iterate + SEED); // seed

        for(int i = 0; i < NUMOF_TEST_PATTERN; i++) {
            test_pattern[i] = (rand() % 2); // 0 or 1 random generation
            fprintf(fp_test_pattern, "%d ", test_pattern[i]);
        }
        fprintf(fp_test_pattern, "\n");

        result[0] = 0;
        result[1] = 0; 
        fprintf(fp_result, "%d ", result[0]);
        fprintf(fp_result, "%d ", result[0]); // first 2 result will be always zero
        for(int i = 0; i < NUMOF_TEST_PATTERN - 2; i++) {
            if((test_pattern[i] == 1) && (test_pattern[i + 1] == 1) && (test_pattern[i + 2] == 0)) {
                result[i + 2] = 1;
            } else {
                result[i + 2] = 0;
            }

            fprintf(fp_result, "%d ", result[i + 2]);
        }

        fprintf(fp_result, "\n");
    }
    
    printf("generation success.");
    return 0;
}