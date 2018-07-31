#!/bin/bash

j=1
k=1

for k in 1 3 4 5 6 7; do
	for j in 1 2; do
		sed -i -e "s~(3, 7, true~(ARG1, ARG2, true~g" test-cases/main$k-$j.c
		sed -i -e "s~(3, 7, false~(ARG1, ARG2, false~g" test-cases/main$k-$j.c	
	done
done

for j in 1 2; do
	sed -i -e "s~(3, 7, 4, 5,~(ARG1, ARG2, ARG3, ARG4,~g" test-cases/main2-$j.c	
done

for j in 1 2 3 4; do
	sed -i -e "s~(3, 7, true~(ARG1, ARG2, true~g" test-cases/main8-$j.c
	sed -i -e "s~(3, 7, false~(ARG1, ARG2, false~g" test-cases/main8-$j.c	
done


for j in 1 2 3 4; do
	sed -i -e "s~(3, 7, 4, true~(ARG1, ARG2, ARG3, true~g" test-cases/main9-$j.c
	sed -i -e "s~(3, 7, 4, false~(ARG1, ARG2, ARG3, false~g" test-cases/main9-$j.c	
done

for k in 10 11; do
	for j in 1 2 3 4 5 6 7 8; do
		sed -i -e "s~(3, 7, 4, true~(ARG1, ARG2, ARG3, true~g" test-cases/main$k-$j.c
		sed -i -e "s~(3, 7, 4, false~(ARG1, ARG2, ARG3, false~g" test-cases/main$k-$j.c	
	done
done


for j in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16; do
	sed -i -e "s~(3, 7, 4, true~(ARG1, ARG2, ARG3, true~g" test-cases/main12-$j.c
	sed -i -e "s~(3, 7, 4, false~(ARG1, ARG2, ARG3, false~g" test-cases/main12-$j.c	
done

