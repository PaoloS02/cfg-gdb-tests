#!/bin/bash


i=0
j=1
k=1

for k in 1 2 3 4 5 6 7; do
	for j in 1 2; do
		for i in 0 1 2 3 4 5 6 7 8 9; do
			sed -i -e "s~file test1-1~file test$k-$j-$i~g" gdb_commands/gdb_test$k-$j-$i.txt
			sed -i -e "s~gdb_output/gdb_output_test1-1.txt~gdb_output/gdb_output_test$k-$j.txt~g" gdb_commands/gdb_test$k-$j-$i.txt
		done	
	done
done


for k in 8 9; do
	for j in 1 2 3 4; do
		for i in 0 1 2 3 4 5 6 7 8 9; do
			sed -i -e "s~file test1-1~file test$k-$j-$i~g" gdb_commands/gdb_test$k-$j-$i.txt
			sed -i -e "s~gdb_output/gdb_output_test1-1.txt~gdb_output/gdb_output_test$k-$j.txt~g" gdb_commands/gdb_test$k-$j-$i.txt
		done	
	done
done


for k in 10 11; do
	for j in 1 2 3 4 5 6 7 8; do
		for i in 0 1 2 3 4 5 6 7 8 9; do
			sed -i -e "s~file test1-1~file test$k-$j-$i~g" gdb_commands/gdb_test$k-$j-$i.txt
			sed -i -e "s~gdb_output/gdb_output_test1-1.txt~gdb_output/gdb_output_test$k-$j.txt~g" gdb_commands/gdb_test$k-$j-$i.txt
		done	
	done
done


for j in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16; do
	for i in 0 1 2 3 4 5 6 7 8 9; do
		sed -i -e "s~file test1-1~file test12-$j-$i~g" gdb_commands/gdb_test12-$j-$i.txt
		sed -i -e "s~gdb_output/gdb_output_test1-1.txt~gdb_output/gdb_output_test12-$j.txt~g" gdb_commands/gdb_test12-$j-$i.txt
	done	
done

