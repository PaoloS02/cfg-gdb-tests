index = 1 2 3 4 5 6 7 8 9 10 11 12
RISCV-GCC = /home/paolo/side-channel-llvm/cfb_benchmarking/install/bin/riscv32-unknown-elf-gcc

prepare:	
	
	$(foreach i, $(index), /home/paolo/side-channel-llvm/llvm/build/bin/clang -S -emit-llvm ./functions/f$(i).c -o f$(i).ll;)
	$(foreach i, $(index), /home/paolo/side-channel-llvm/llvm/build/bin/llc f$(i).ll -o f$(i).s;)
#	/home/paolo/side-channel-llvm/llvm/build/bin/llc ./functions/f$(i).ll -o f$(i).s;
	
test1:	
	$(RISCV-GCC) ./test-cases/main1-1.c f1.s -g -o test1-1-0 -DARG1=3 -DARG2=7
	$(RISCV-GCC) ./test-cases/main1-1.c f1.s -g -o test1-1-1 -DARG1=85 -DARG2=17
	$(RISCV-GCC) ./test-cases/main1-1.c f1.s -g -o test1-1-2 -DARG1=45730 -DARG2=21
	$(RISCV-GCC) ./test-cases/main1-1.c f1.s -g -o test1-1-3 -DARG1=-27 -DARG2=5
	$(RISCV-GCC) ./test-cases/main1-1.c f1.s -g -o test1-1-4 -DARG1=27 -DARG2=-5
	$(RISCV-GCC) ./test-cases/main1-1.c f1.s -g -o test1-1-5 -DARG1=99 -DARG2=3
	$(RISCV-GCC) ./test-cases/main1-1.c f1.s -g -o test1-1-6 -DARG1=4 -DARG2=19828
	$(RISCV-GCC) ./test-cases/main1-1.c f1.s -g -o test1-1-7 -DARG1=3495895 -DARG2=470
	$(RISCV-GCC) ./test-cases/main1-1.c f1.s -g -o test1-1-8 -DARG1=825740652 -DARG2=6025620460
	$(RISCV-GCC) ./test-cases/main1-1.c f1.s -g -o test1-1-9 -DARG1=-34649 -DARG2=-5468
	
	$(RISCV-GCC) ./test-cases/main1-2.c f1.s -g -o test1-2-0 -DARG1=3 -DARG2=7
	$(RISCV-GCC) ./test-cases/main1-2.c f1.s -g -o test1-2-1 -DARG1=85 -DARG2=17
	$(RISCV-GCC) ./test-cases/main1-2.c f1.s -g -o test1-2-2 -DARG1=45730 -DARG2=21
	$(RISCV-GCC) ./test-cases/main1-2.c f1.s -g -o test1-2-3 -DARG1=-27 -DARG2=5
	$(RISCV-GCC) ./test-cases/main1-2.c f1.s -g -o test1-2-4 -DARG1=27 -DARG2=-5
	$(RISCV-GCC) ./test-cases/main1-2.c f1.s -g -o test1-2-5 -DARG1=99 -DARG2=3
	$(RISCV-GCC) ./test-cases/main1-2.c f1.s -g -o test1-2-6 -DARG1=4 -DARG2=19828
	$(RISCV-GCC) ./test-cases/main1-2.c f1.s -g -o test1-2-7 -DARG1=3495895 -DARG2=470
	$(RISCV-GCC) ./test-cases/main1-2.c f1.s -g -o test1-2-8 -DARG1=825740652 -DARG2=6025620460
	$(RISCV-GCC) ./test-cases/main1-2.c f1.s -g -o test1-2-9 -DARG1=-34649 -DARG2=-5468
	
	
test2:
	$(RISCV-GCC) ./test-cases/main2-1.c f2.s -g -o test2-1-0 -DARG1=3 -DARG2=7 -DARG3=4 -DARG4=5
	$(RISCV-GCC) ./test-cases/main2-1.c f2.s -g -o test2-1-0 -DARG1=3745 -DARG2=85965 -DARG3=423 -DARG4=6562
	$(RISCV-GCC) ./test-cases/main2-1.c f2.s -g -o test2-1-0 -DARG1=0 -DARG2=0 -DARG3=0 -DARG4=0
	$(RISCV-GCC) ./test-cases/main2-1.c f2.s -g -o test2-1-0 -DARG1=-89 -DARG2=15 -DARG3=32 -DARG4=44
	$(RISCV-GCC) ./test-cases/main2-1.c f2.s -g -o test2-1-0 -DARG1=15 -DARG2=-89 -DARG3=32 -DARG4=44
	$(RISCV-GCC) ./test-cases/main2-1.c f2.s -g -o test2-1-0 -DARG1=3 -DARG2=7 -DARG3=4 -DARG4=5
	$(RISCV-GCC) ./test-cases/main2-1.c f2.s -g -o test2-1-0 -DARG1=3 -DARG2=7 -DARG3=4 -DARG4=5
	$(RISCV-GCC) ./test-cases/main2-1.c f2.s -g -o test2-1-0 -DARG1=3 -DARG2=7 -DARG3=4 -DARG4=5
	$(RISCV-GCC) ./test-cases/main2-1.c f2.s -g -o test2-1-0 -DARG1=3 -DARG2=7 -DARG3=4 -DARG4=5
	$(RISCV-GCC) ./test-cases/main2-1.c f2.s -g -o test2-1-0 -DARG1=37965 -DARG2=4683 -DARG3=4 -DARG4=5
	$(RISCV-GCC) ./test-cases/main2-1.c f2.s -g -o test2-1-0 -DARG1=567654 -DARG2=8594656 -DARG3=4 -DARG4=5
	$(RISCV-GCC) ./test-cases/main2-1.c f2.s -g -o test2-1-0 -DARG1=9999 -DARG2=11111 -DARG3=4 -DARG4=5
	
	
	$(RISCV-GCC) ./test-cases/main2-2.c f2.s -g -o test2-2
test3:
	$(RISCV-GCC) ./test-cases/main3-1.c f3.s -g -o test3-1
	$(RISCV-GCC) ./test-cases/main3-2.c f3.s -g -o test3-2
test4:
	$(RISCV-GCC) ./test-cases/main4-1.c f4.s -g -o test4-1
	$(RISCV-GCC) ./test-cases/main4-2.c f4.s -g -o test4-2
test5:
	$(RISCV-GCC) ./test-cases/main5-1.c f5.s -g -o test5-1
	$(RISCV-GCC) ./test-cases/main5-2.c f5.s -g -o test5-2
test6:
	$(RISCV-GCC) ./test-cases/main6-1.c f6.s -g -o test6-1
	$(RISCV-GCC) ./test-cases/main6-2.c f6.s -g -o test6-2
test7:
	$(RISCV-GCC) ./test-cases/main7-1.c f7.s -g -o test7-1
	$(RISCV-GCC) ./test-cases/main7-2.c f7.s -g -o test7-2
test8:
	$(RISCV-GCC) ./test-cases/main8-1.c f8.s -g -o test8-1
	$(RISCV-GCC) ./test-cases/main8-2.c f8.s -g -o test8-2
	$(RISCV-GCC) ./test-cases/main8-3.c f8.s -g -o test8-3
	$(RISCV-GCC) ./test-cases/main8-4.c f8.s -g -o test8-4
test9:
	$(RISCV-GCC) ./test-cases/main9-1.c f9.s -g -o test9-1
	$(RISCV-GCC) ./test-cases/main9-2.c f9.s -g -o test9-2
	$(RISCV-GCC) ./test-cases/main9-3.c f9.s -g -o test9-3
	$(RISCV-GCC) ./test-cases/main9-4.c f9.s -g -o test9-4
test10:
	$(RISCV-GCC) ./test-cases/main10-1.c f10.s -g -o test10-1
	$(RISCV-GCC) ./test-cases/main10-2.c f10.s -g -o test10-2
	$(RISCV-GCC) ./test-cases/main10-3.c f10.s -g -o test10-3
	$(RISCV-GCC) ./test-cases/main10-4.c f10.s -g -o test10-4
	$(RISCV-GCC) ./test-cases/main10-5.c f10.s -g -o test10-5
	$(RISCV-GCC) ./test-cases/main10-6.c f10.s -g -o test10-6
	$(RISCV-GCC) ./test-cases/main10-7.c f10.s -g -o test10-7
	$(RISCV-GCC) ./test-cases/main10-8.c f10.s -g -o test10-8
test11:
	$(RISCV-GCC) ./test-cases/main11-1.c f11.s -g -o test11-1
	$(RISCV-GCC) ./test-cases/main11-2.c f11.s -g -o test11-2
	$(RISCV-GCC) ./test-cases/main11-3.c f11.s -g -o test11-3
	$(RISCV-GCC) ./test-cases/main11-4.c f11.s -g -o test11-4
	$(RISCV-GCC) ./test-cases/main11-5.c f11.s -g -o test11-5
	$(RISCV-GCC) ./test-cases/main11-6.c f11.s -g -o test11-6
	$(RISCV-GCC) ./test-cases/main11-7.c f11.s -g -o test11-7
	$(RISCV-GCC) ./test-cases/main11-8.c f11.s -g -o test11-8
test12:
	$(RISCV-GCC) ./test-cases/main12-1.c f12.s -g -o test12-1
	$(RISCV-GCC) ./test-cases/main12-2.c f12.s -g -o test12-2
	$(RISCV-GCC) ./test-cases/main12-3.c f12.s -g -o test12-3
	$(RISCV-GCC) ./test-cases/main12-4.c f12.s -g -o test12-4
	$(RISCV-GCC) ./test-cases/main12-5.c f12.s -g -o test12-5
	$(RISCV-GCC) ./test-cases/main12-6.c f12.s -g -o test12-6
	$(RISCV-GCC) ./test-cases/main12-7.c f12.s -g -o test12-7
	$(RISCV-GCC) ./test-cases/main12-8.c f12.s -g -o test12-8
	$(RISCV-GCC) ./test-cases/main12-9.c f12.s -g -o test12-9
	$(RISCV-GCC) ./test-cases/main12-10.c f12.s -g -o test12-10
	$(RISCV-GCC) ./test-cases/main12-11.c f12.s -g -o test12-11
	$(RISCV-GCC) ./test-cases/main12-12.c f12.s -g -o test12-12
	$(RISCV-GCC) ./test-cases/main12-13.c f12.s -g -o test12-13
	$(RISCV-GCC) ./test-cases/main12-14.c f12.s -g -o test12-14
	$(RISCV-GCC) ./test-cases/main12-15.c f12.s -g -o test12-15
	$(RISCV-GCC) ./test-cases/main12-16.c f12.s -g -o test12-16
	
all-tests: test1 test2 test3 test4 test5 test6 test7 test8 test9 test10 test11 test12
	
clean:
	rm -f f*.ll f*.s

clean-all:
	rm -f f*.ll f*.s test?-? test?-?? test??-? test??-?? gdb_output/gdb_output_test*

clean-output:
	rm -f gdb_output/gdb_output_test*
	
clean-results:
	rm -f test_results.txt

