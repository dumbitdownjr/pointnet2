#/bin/bash
TF_INC=/home/arafian-admin/Repos/lib/python3.5/site-packages/tensorflow/include
TF_LIB=/home/arafian-admin/Repos/lib/python3.5/site-packages/tensorflow
TF_PUB=/home/arafian-admin/Repos/lib/python3.5/site-packages/tensorflow/include/external/nsync/public
nvcc=/usr/local/cuda/bin/nvcc
cudalib=/usr/local/cuda/lib64
cuda=/usr/local/cuda/include

$nvcc tf_sampling_g.cu -o tf_sampling_g.cu.o -c -O2 -DGOOGLE_CUDA=1 -x cu -Xcompiler -fPIC

# TF1.2
#g++ -std=c++11 tf_sampling.cpp tf_sampling_g.cu.o -o tf_sampling_so.so -shared -fPIC -I /usr/local/lib/python2.7/dist-packages/tensorflow/include -I /usr/local/cuda-8.0/include -lcudart -L /usr/local/cuda-8.0/lib64/ -O2 -D_GLIBCXX_USE_CXX11_ABI=0

# TF1.4
g++ -std=c++11 tf_sampling.cpp tf_sampling_g.cu.o -o tf_sampling_so.so -shared -fPIC -I $TF_INC -I $cuda -I $TF_PUB -lcudart -L $cudalib -L $TF_LIB -ltensorflow_framework -O2 -D_GLIBCXX_USE_CXX11_ABI=0
