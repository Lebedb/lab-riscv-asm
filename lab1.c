#include <stdio.h>

#define N 4 // line
#define M 4 // column
#define TARGET_COL 0// < M

int process(int c, int matrix[M][N]){
    int sum = 0;
    for (int i = 0; i < N; ++i) {
        sum += matrix[i][c];
    }
    return sum;
}

int main(){
    int matrix[M][N] = {
        {-1, 1, -3, 0},
        { 4, 1, -6, 0},
        { 8, 1,  3, 0},
        { 0, 1,  3, 0},
    };

    int result = 0;
    
    result = process(TARGET_COL, matrix);

    printf("%d ", result);

    return 0;
}


