nvcc --cudart shared -o matadd matadd.cu -gencode arch=compute_75,code=compute_75
mv matadd ../gpu-configs/SM75_RTX2060
cd ../gpu-configs/SM75_RTX2060
./matadd 1 1  | tee testadd_1_1.log
./matadd 2 2  | tee testadd_2_2.log
./matadd 4 4  | tee testadd_4_4.log
./matadd 8 8  | tee testadd_8_8.log
./matadd 16 16  | tee testadd_16_16.log
./matadd 32 32  | tee testadd_32_32.log
./matadd 8 1  | tee testadd_8_1.log
./matadd 8 2  | tee testadd_8_2.log
./matadd 8 4  | tee testadd_8_4.log
./matadd 8 8  | tee testadd_8_8.log
./matadd 8 16  | tee testadd_8_16.log
./matadd 8 32  | tee testadd_8_32.log
./matadd 8 64  | tee testadd_8_64.log
./matadd 8 128  | tee testadd_8_128.log
./matadd 1 8  | tee testadd_1_8.log
./matadd 2 8  | tee testadd_2_8.log
./matadd 4 8  | tee testadd_4_8.log
./matadd 16 8  | tee testadd_16_8.log
./matadd 32 8  | tee testadd_32_8.log
./matadd 64 8  | tee testadd_64_8.log
./matadd 128 8  | tee testadd_128_8.log

cd ../../
cd cuda-example/

nvcc --cudart shared -o matmul matmul.cu -gencode arch=compute_75,code=compute_75
mv matmul ../gpu-configs/SM75_RTX2060
cd ../gpu-configs/SM75_RTX2060
./matmul 1 1  | tee testmul_1_1.log
./matmul 2 2  | tee testmul_2_2.log
./matmul 4 4  | tee testmul_4_4.log
./matmul 8 8  | tee testmul_8_8.log
./matmul 16 16  | tee testmul_16_16.log
./matmul 32 32  | tee testmul_32_32.log
./matmul 8 1  | tee testmul_8_1.log
./matmul 8 2  | tee testmul_8_2.log
./matmul 8 4  | tee testmul_8_4.log
./matmul 8 8  | tee testmul_8_8.log
./matmul 8 16  | tee testmul_8_16.log
./matmul 8 32  | tee testmul_8_32.log
./matmul 8 64  | tee testmul_8_64.log
./matmul 8 128  | tee testmul_8_128.log
./matmul 1 8  | tee testmul_1_8.log
./matmul 2 8  | tee testmul_2_8.log
./matmul 4 8  | tee testmul_4_8.log
./matmul 16 8  | tee testmul_16_8.log
./matmul 32 8  | tee testmul_32_8.log
./matmul 64 8  | tee testmul_64_8.log
./matmul 128 8  | tee testmul_128_8.log