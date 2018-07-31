#!/bin/bash


i=0
j=1
k=1

for k in 1 2 3 4 5 6 7; do
	for j in 1 2; do
		for i in 0 1 2 3 4 5 6 7 8 9; do
			cp gdb_commands/gdb_test1-1.txt gdb_commands/gdb_test$k-$j-$i.txt
		done	
	done
done


for k in 8 9; do
	for j in 1 2 3 4; do
		for i in 0 1 2 3 4 5 6 7 8 9; do
			cp gdb_commands/gdb_test1-1.txt gdb_commands/gdb_test$k-$j-$i.txt
		done	
	done
done


for k in 10 11; do
	for j in 1 2 3 4 5 6 7 8; do
		for i in 0 1 2 3 4 5 6 7 8 9; do
			cp gdb_commands/gdb_test1-1.txt gdb_commands/gdb_test$k-$j-$i.txt
		done	
	done
done


for j in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16; do
	for i in 0 1 2 3 4 5 6 7 8 9; do
		cp gdb_commands/gdb_test1-1.txt gdb_commands/gdb_test12-$j-$i.txt
	done	
done

