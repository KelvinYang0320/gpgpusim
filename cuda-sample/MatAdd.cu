#include<stdio.h>
#include<cuda.h>
#include<cuda_runtime.h>

#define N 512
#define BLOCK_SIZE 32

__global__ void MatAdd(float *A, float *B, float *C){
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    // C = A + B (write down your codes)
    if(i < N && j < N){
        C[i*N+j] = A[i*N+j] + B[i*N+j];
    }

}

int main(){

    float *h_A, *h_B, *h_C;
    float *d_A, *d_B, *d_C;

    int i;

    h_A = (float*)malloc(N * N * sizeof(float));
    h_B = (float*)malloc(N * N * sizeof(float));
    h_C = (float*)malloc(N * N * sizeof(float));

    // init data
    for(i = 0; i < (N * N); i++){
	    h_A[i] = 1.0;
	    h_B[i] = 2.0;
	    h_C[i] = 0.0;
    }

    // allocate device memory
    cudaMalloc((void**)&d_A,  N * N * sizeof(float));
    cudaMalloc((void**)&d_B,  N * N * sizeof(float));
    cudaMalloc((void**)&d_C,  N * N * sizeof(float));
    
    // transfer data to device
    cudaMemcpy(d_A, h_A, N * N * sizeof(float), cudaMemcpyHostToDevice);
    cudaMemcpy(d_B, h_B, N * N * sizeof(float), cudaMemcpyHostToDevice);

    // fill in correct thread/blocks
    dim3 blockSize( (N + BLOCK_SIZE - 1)/BLOCK_SIZE , (N + BLOCK_SIZE - 1)/BLOCK_SIZE);
    dim3 numBlock( BLOCK_SIZE, BLOCK_SIZE);

    // MatAdd kernel
    MatAdd<<<numBlock, blockSize>>>(d_A, d_B, d_C);
    cudaDeviceSynchronize();

    // transfer data back to host
    cudaMemcpy(h_C, d_C, N * N * sizeof(float), cudaMemcpyDeviceToHost);

    for(i = 0; i < (N * N); i++){
    	
        if(h_C[i]!= 3.0){
	        printf("Error:%f, idx:%d\n", h_C[i], i);
            return 0;
	    }
    }

    printf("PASS\n");

    // free memory

    free(h_A);
    free(h_B);
    free(h_C);

    cudaFree(d_A);
    cudaFree(d_B);
    cudaFree(d_C);

    return 0;
}