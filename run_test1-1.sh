#!/bin/bash

#LIST="$(ls -1 gdb_test*-*.txt)"
export PATH=/home/paolo/side-channel-llvm/cfb_benchmarking/install/bin/:$PATH
#j="0"

for i in gdb_commands/gdb_test*-*.txt
do
	for j  in 1 2 3 4 5 6 7 8 9 10 
	do
		#cat $i | head -2
		riscv32-unknown-elf-gdb -x $i
		#j=$[$j + 1]
		#echo $j
		#echo \n
	done;
done
