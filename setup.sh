#!/bin/bash

cwd=$(pwd)
echo "current working dir ...${cwd}"
if [ ! -d "${cwd}/lib" ]
then
	mkdir -p ${cwd}/lib
fi

if [ ! -d "${cwd}/lib/googletest" ]
then 
   cd ${cwd}/lib	
   git clone https://github.com/google/googletest.git
else
   echo "googletest already cloned"
fi

cd ${cwd}

# Create build directory
cmake -E make_directory build

# Generate Makefiles
cmake -E chdir build cmake ..

# Build tests
cmake --build build

if [ -e "Makefile" ]
then
   make all
fi

