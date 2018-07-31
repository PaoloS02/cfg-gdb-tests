index = 1 2 3 4 5 6 7 8 9 10 11 12
RISCV-GCC = /home/paolo/side-channel-llvm/cfb_benchmarking/install/bin/riscv32-unknown-elf-gcc

prepare:	
	$(foreach i, $(index), /home/paolo/side-channel-llvm/llvm/build/bin/clang -S -emit-llvm ./functions/f$(i).c -o f$(i).ll;)
	$(foreach i, $(index), /home/paolo/side-channel-llvm/llvm/build/bin/llc f$(i).ll -riscv-cfg-balance -o f$(i).s;)

prepare-unbalanced:
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
	$(RISCV-GCC) ./test-cases/main2-1.c f2.s -g -o test2-1-1 -DARG1=3745 -DARG2=85965 -DARG3=567654 -DARG4=6562
	$(RISCV-GCC) ./test-cases/main2-1.c f2.s -g -o test2-1-2 -DARG1=0 -DARG2=0 -DARG3=0 -DARG4=0
	$(RISCV-GCC) ./test-cases/main2-1.c f2.s -g -o test2-1-3 -DARG1=-89 -DARG2=15 -DARG3=32 -DARG4=44
	$(RISCV-GCC) ./test-cases/main2-1.c f2.s -g -o test2-1-4 -DARG1=15 -DARG2=-89 -DARG3=32 -DARG4=44
	$(RISCV-GCC) ./test-cases/main2-1.c f2.s -g -o test2-1-5 -DARG1=15 -DARG2=89 -DARG3=-32 -DARG4=44
	$(RISCV-GCC) ./test-cases/main2-1.c f2.s -g -o test2-1-6 -DARG1=15 -DARG2=89 -DARG3=32 -DARG4=-44
	$(RISCV-GCC) ./test-cases/main2-1.c f2.s -g -o test2-1-7 -DARG1=15 -DARG2=89 -DARG3=-32 -DARG4=-44
	$(RISCV-GCC) ./test-cases/main2-1.c f2.s -g -o test2-1-8 -DARG1=12 -DARG2=8 -DARG3=448936 -DARG4=7437043
	$(RISCV-GCC) ./test-cases/main2-1.c f2.s -g -o test2-1-9 -DARG1=12 -DARG2=8 -DARG3=-448936 -DARG4=-7437043
		
	$(RISCV-GCC) ./test-cases/main2-2.c f2.s -g -o test2-2-0 -DARG1=3 -DARG2=7 -DARG3=4 -DARG4=5
	$(RISCV-GCC) ./test-cases/main2-2.c f2.s -g -o test2-2-1 -DARG1=3745 -DARG2=85965 -DARG3=423 -DARG4=6562
	$(RISCV-GCC) ./test-cases/main2-2.c f2.s -g -o test2-2-2 -DARG1=0 -DARG2=0 -DARG3=0 -DARG4=0
	$(RISCV-GCC) ./test-cases/main2-2.c f2.s -g -o test2-2-3 -DARG1=-89 -DARG2=15 -DARG3=32 -DARG4=44
	$(RISCV-GCC) ./test-cases/main2-2.c f2.s -g -o test2-2-4 -DARG1=15 -DARG2=-89 -DARG3=32 -DARG4=44
	$(RISCV-GCC) ./test-cases/main2-2.c f2.s -g -o test2-2-5 -DARG1=15 -DARG2=89 -DARG3=-32 -DARG4=44
	$(RISCV-GCC) ./test-cases/main2-2.c f2.s -g -o test2-2-6 -DARG1=15 -DARG2=89 -DARG3=32 -DARG4=-44
	$(RISCV-GCC) ./test-cases/main2-2.c f2.s -g -o test2-2-7 -DARG1=15 -DARG2=89 -DARG3=-32 -DARG4=-44
	$(RISCV-GCC) ./test-cases/main2-2.c f2.s -g -o test2-2-8 -DARG1=12 -DARG2=8 -DARG3=448936 -DARG4=7437043
	$(RISCV-GCC) ./test-cases/main2-2.c f2.s -g -o test2-2-9 -DARG1=12 -DARG2=8 -DARG3=-448936 -DARG4=-7437043
	
	
test3:
	$(RISCV-GCC) ./test-cases/main3-1.c f3.s -g -o test3-1-0 -DARG1=3 -DARG2=7
	$(RISCV-GCC) ./test-cases/main3-1.c f3.s -g -o test3-1-1 -DARG1=25 -DARG2=27
	$(RISCV-GCC) ./test-cases/main3-1.c f3.s -g -o test3-1-2 -DARG1=457 -DARG2=38
	$(RISCV-GCC) ./test-cases/main3-1.c f3.s -g -o test3-1-3 -DARG1=605 -DARG2=743
	$(RISCV-GCC) ./test-cases/main3-1.c f3.s -g -o test3-1-4 -DARG1=9650 -DARG2=97435
	$(RISCV-GCC) ./test-cases/main3-1.c f3.s -g -o test3-1-5 -DARG1=655065 -DARG2=2597595
	$(RISCV-GCC) ./test-cases/main3-1.c f3.s -g -o test3-1-6 -DARG1=26 -DARG2=1982843
	$(RISCV-GCC) ./test-cases/main3-1.c f3.s -g -o test3-1-7 -DARG1=3495459 -DARG2=43
	$(RISCV-GCC) ./test-cases/main3-1.c f3.s -g -o test3-1-8 -DARG1=-445 -DARG2=5425
	$(RISCV-GCC) ./test-cases/main3-1.c f3.s -g -o test3-1-9 -DARG1=-34649 -DARG2=542
	
	$(RISCV-GCC) ./test-cases/main3-2.c f3.s -g -o test3-2-0 -DARG1=3 -DARG2=7
	$(RISCV-GCC) ./test-cases/main3-2.c f3.s -g -o test3-2-1 -DARG1=25 -DARG2=27
	$(RISCV-GCC) ./test-cases/main3-2.c f3.s -g -o test3-2-2 -DARG1=457 -DARG2=38
	$(RISCV-GCC) ./test-cases/main3-2.c f3.s -g -o test3-2-3 -DARG1=605 -DARG2=743
	$(RISCV-GCC) ./test-cases/main3-2.c f3.s -g -o test3-2-4 -DARG1=9650 -DARG2=97435
	$(RISCV-GCC) ./test-cases/main3-2.c f3.s -g -o test3-2-5 -DARG1=655065 -DARG2=2597595
	$(RISCV-GCC) ./test-cases/main3-2.c f3.s -g -o test3-2-6 -DARG1=26 -DARG2=1982843
	$(RISCV-GCC) ./test-cases/main3-2.c f3.s -g -o test3-2-7 -DARG1=3495459 -DARG2=43
	$(RISCV-GCC) ./test-cases/main3-2.c f3.s -g -o test3-2-8 -DARG1=-445 -DARG2=5425
	$(RISCV-GCC) ./test-cases/main3-2.c f3.s -g -o test3-2-9 -DARG1=-34649 -DARG2=542
	
	
test4:
	$(RISCV-GCC) ./test-cases/main4-1.c f4.s -g -o test4-1-0 -DARG1=0 -DARG2=7
	$(RISCV-GCC) ./test-cases/main4-1.c f4.s -g -o test4-1-1 -DARG1=1 -DARG2=48
	$(RISCV-GCC) ./test-cases/main4-1.c f4.s -g -o test4-1-2 -DARG1=2 -DARG2=1516
	$(RISCV-GCC) ./test-cases/main4-1.c f4.s -g -o test4-1-3 -DARG1=3 -DARG2=2342
	$(RISCV-GCC) ./test-cases/main4-1.c f4.s -g -o test4-1-4 -DARG1=4 -DARG2=-4531
	$(RISCV-GCC) ./test-cases/main4-1.c f4.s -g -o test4-1-5 -DARG1=5 -DARG2=321
	$(RISCV-GCC) ./test-cases/main4-1.c f4.s -g -o test4-1-6 -DARG1=6 -DARG2=999
	$(RISCV-GCC) ./test-cases/main4-1.c f4.s -g -o test4-1-7 -DARG1=7 -DARG2=834265
	$(RISCV-GCC) ./test-cases/main4-1.c f4.s -g -o test4-1-8 -DARG1=8 -DARG2=-4366543
	$(RISCV-GCC) ./test-cases/main4-1.c f4.s -g -o test4-1-9 -DARG1=9 -DARG2=0
	
	
	$(RISCV-GCC) ./test-cases/main4-2.c f4.s -g -o test4-2-0 -DARG1=0 -DARG2=7
	$(RISCV-GCC) ./test-cases/main4-2.c f4.s -g -o test4-2-1 -DARG1=1 -DARG2=48
	$(RISCV-GCC) ./test-cases/main4-2.c f4.s -g -o test4-2-2 -DARG1=2 -DARG2=1516
	$(RISCV-GCC) ./test-cases/main4-2.c f4.s -g -o test4-2-3 -DARG1=3 -DARG2=2342
	$(RISCV-GCC) ./test-cases/main4-2.c f4.s -g -o test4-2-4 -DARG1=4 -DARG2=-4531
	$(RISCV-GCC) ./test-cases/main4-2.c f4.s -g -o test4-2-5 -DARG1=5 -DARG2=321
	$(RISCV-GCC) ./test-cases/main4-2.c f4.s -g -o test4-2-6 -DARG1=6 -DARG2=999
	$(RISCV-GCC) ./test-cases/main4-2.c f4.s -g -o test4-2-7 -DARG1=7 -DARG2=834265
	$(RISCV-GCC) ./test-cases/main4-2.c f4.s -g -o test4-2-8 -DARG1=8 -DARG2=-4366543
	$(RISCV-GCC) ./test-cases/main4-2.c f4.s -g -o test4-2-9 -DARG1=9 -DARG2=0
	
	
test5:
	$(RISCV-GCC) ./test-cases/main5-1.c f5.s -g -o test5-1-0 -DARG1=3 -DARG2=0
	$(RISCV-GCC) ./test-cases/main5-1.c f5.s -g -o test5-1-1 -DARG1=43 -DARG2=1
	$(RISCV-GCC) ./test-cases/main5-1.c f5.s -g -o test5-1-2 -DARG1=289 -DARG2=2
	$(RISCV-GCC) ./test-cases/main5-1.c f5.s -g -o test5-1-3 -DARG1=3793354 -DARG2=3
	$(RISCV-GCC) ./test-cases/main5-1.c f5.s -g -o test5-1-4 -DARG1=-49256 -DARG2=4
	$(RISCV-GCC) ./test-cases/main5-1.c f5.s -g -o test5-1-5 -DARG1=-517 -DARG2=5
	$(RISCV-GCC) ./test-cases/main5-1.c f5.s -g -o test5-1-6 -DARG1=-4 -DARG2=6
	$(RISCV-GCC) ./test-cases/main5-1.c f5.s -g -o test5-1-7 -DARG1=-54898274 -DARG2=7
	$(RISCV-GCC) ./test-cases/main5-1.c f5.s -g -o test5-1-8 -DARG1=194754250 -DARG2=8
	$(RISCV-GCC) ./test-cases/main5-1.c f5.s -g -o test5-1-9 -DARG1=0 -DARG2=9
	
	$(RISCV-GCC) ./test-cases/main5-2.c f5.s -g -o test5-2-0 -DARG1=3 -DARG2=0
	$(RISCV-GCC) ./test-cases/main5-2.c f5.s -g -o test5-2-1 -DARG1=43 -DARG2=1
	$(RISCV-GCC) ./test-cases/main5-2.c f5.s -g -o test5-2-2 -DARG1=289 -DARG2=2
	$(RISCV-GCC) ./test-cases/main5-2.c f5.s -g -o test5-2-3 -DARG1=3793354 -DARG2=3
	$(RISCV-GCC) ./test-cases/main5-2.c f5.s -g -o test5-2-4 -DARG1=-49256 -DARG2=4
	$(RISCV-GCC) ./test-cases/main5-2.c f5.s -g -o test5-2-5 -DARG1=-517 -DARG2=5
	$(RISCV-GCC) ./test-cases/main5-2.c f5.s -g -o test5-2-6 -DARG1=-4 -DARG2=6
	$(RISCV-GCC) ./test-cases/main5-2.c f5.s -g -o test5-2-7 -DARG1=-54898274 -DARG2=7
	$(RISCV-GCC) ./test-cases/main5-2.c f5.s -g -o test5-2-8 -DARG1=194754250 -DARG2=8
	$(RISCV-GCC) ./test-cases/main5-2.c f5.s -g -o test5-2-9 -DARG1=0 -DARG2=9
	
	
test6:
	$(RISCV-GCC) ./test-cases/main6-1.c f6.s -g -o test6-1-0 -DARG1=0 -DARG2=0
	$(RISCV-GCC) ./test-cases/main6-1.c f6.s -g -o test6-1-1 -DARG1=1 -DARG2=5
	$(RISCV-GCC) ./test-cases/main6-1.c f6.s -g -o test6-1-2 -DARG1=2 -DARG2=3
	$(RISCV-GCC) ./test-cases/main6-1.c f6.s -g -o test6-1-3 -DARG1=3 -DARG2=1
	$(RISCV-GCC) ./test-cases/main6-1.c f6.s -g -o test6-1-4 -DARG1=4 -DARG2=9
	$(RISCV-GCC) ./test-cases/main6-1.c f6.s -g -o test6-1-5 -DARG1=5 -DARG2=2
	$(RISCV-GCC) ./test-cases/main6-1.c f6.s -g -o test6-1-6 -DARG1=6 -DARG2=4
	$(RISCV-GCC) ./test-cases/main6-1.c f6.s -g -o test6-1-7 -DARG1=7 -DARG2=7
	$(RISCV-GCC) ./test-cases/main6-1.c f6.s -g -o test6-1-8 -DARG1=8 -DARG2=6
	$(RISCV-GCC) ./test-cases/main6-1.c f6.s -g -o test6-1-9 -DARG1=9 -DARG2=8
	
	$(RISCV-GCC) ./test-cases/main6-2.c f6.s -g -o test6-2-0 -DARG1=0 -DARG2=0
	$(RISCV-GCC) ./test-cases/main6-2.c f6.s -g -o test6-2-1 -DARG1=1 -DARG2=5
	$(RISCV-GCC) ./test-cases/main6-2.c f6.s -g -o test6-2-2 -DARG1=2 -DARG2=3
	$(RISCV-GCC) ./test-cases/main6-2.c f6.s -g -o test6-2-3 -DARG1=3 -DARG2=1
	$(RISCV-GCC) ./test-cases/main6-2.c f6.s -g -o test6-2-4 -DARG1=4 -DARG2=9
	$(RISCV-GCC) ./test-cases/main6-2.c f6.s -g -o test6-2-5 -DARG1=5 -DARG2=2
	$(RISCV-GCC) ./test-cases/main6-2.c f6.s -g -o test6-2-6 -DARG1=6 -DARG2=4
	$(RISCV-GCC) ./test-cases/main6-2.c f6.s -g -o test6-2-7 -DARG1=7 -DARG2=7
	$(RISCV-GCC) ./test-cases/main6-2.c f6.s -g -o test6-2-8 -DARG1=8 -DARG2=6
	$(RISCV-GCC) ./test-cases/main6-2.c f6.s -g -o test6-2-9 -DARG1=9 -DARG2=8
	
	
test7:
	$(RISCV-GCC) ./test-cases/main7-1.c f7.s -g -o test7-1-0 -DARG1=0 -DARG2=9
	$(RISCV-GCC) ./test-cases/main7-1.c f7.s -g -o test7-1-1 -DARG1=1 -DARG2=8
	$(RISCV-GCC) ./test-cases/main7-1.c f7.s -g -o test7-1-2 -DARG1=2 -DARG2=7
	$(RISCV-GCC) ./test-cases/main7-1.c f7.s -g -o test7-1-3 -DARG1=3 -DARG2=6
	$(RISCV-GCC) ./test-cases/main7-1.c f7.s -g -o test7-1-4 -DARG1=4 -DARG2=5
	$(RISCV-GCC) ./test-cases/main7-1.c f7.s -g -o test7-1-5 -DARG1=5 -DARG2=4
	$(RISCV-GCC) ./test-cases/main7-1.c f7.s -g -o test7-1-6 -DARG1=6 -DARG2=3
	$(RISCV-GCC) ./test-cases/main7-1.c f7.s -g -o test7-1-7 -DARG1=7 -DARG2=2
	$(RISCV-GCC) ./test-cases/main7-1.c f7.s -g -o test7-1-8 -DARG1=8 -DARG2=1
	$(RISCV-GCC) ./test-cases/main7-1.c f7.s -g -o test7-1-9 -DARG1=9 -DARG2=0
	
	$(RISCV-GCC) ./test-cases/main7-2.c f7.s -g -o test7-2-0 -DARG1=0 -DARG2=9
	$(RISCV-GCC) ./test-cases/main7-2.c f7.s -g -o test7-2-1 -DARG1=1 -DARG2=8
	$(RISCV-GCC) ./test-cases/main7-2.c f7.s -g -o test7-2-2 -DARG1=2 -DARG2=7
	$(RISCV-GCC) ./test-cases/main7-2.c f7.s -g -o test7-2-3 -DARG1=3 -DARG2=6
	$(RISCV-GCC) ./test-cases/main7-2.c f7.s -g -o test7-2-4 -DARG1=4 -DARG2=5
	$(RISCV-GCC) ./test-cases/main7-2.c f7.s -g -o test7-2-5 -DARG1=5 -DARG2=4
	$(RISCV-GCC) ./test-cases/main7-2.c f7.s -g -o test7-2-6 -DARG1=6 -DARG2=3
	$(RISCV-GCC) ./test-cases/main7-2.c f7.s -g -o test7-2-7 -DARG1=7 -DARG2=2
	$(RISCV-GCC) ./test-cases/main7-2.c f7.s -g -o test7-2-8 -DARG1=8 -DARG2=1
	$(RISCV-GCC) ./test-cases/main7-2.c f7.s -g -o test7-2-9 -DARG1=9 -DARG2=0
	
test8:
	$(RISCV-GCC) ./test-cases/main8-1.c f8.s -g -o test8-1-0 -DARG1=3 -DARG2=7
	$(RISCV-GCC) ./test-cases/main8-1.c f8.s -g -o test8-1-1 -DARG1=42 -DARG2=24
	$(RISCV-GCC) ./test-cases/main8-1.c f8.s -g -o test8-1-2 -DARG1=34710 -DARG2=24
	$(RISCV-GCC) ./test-cases/main8-1.c f8.s -g -o test8-1-3 -DARG1=-31 -DARG2=8
	$(RISCV-GCC) ./test-cases/main8-1.c f8.s -g -o test8-1-4 -DARG1=19 -DARG2=-6
	$(RISCV-GCC) ./test-cases/main8-1.c f8.s -g -o test8-1-5 -DARG1=44 -DARG2=4
	$(RISCV-GCC) ./test-cases/main8-1.c f8.s -g -o test8-1-6 -DARG1=3 -DARG2=19828
	$(RISCV-GCC) ./test-cases/main8-1.c f8.s -g -o test8-1-7 -DARG1=7942502 -DARG2=625
	$(RISCV-GCC) ./test-cases/main8-1.c f8.s -g -o test8-1-8 -DARG1=564050426 -DARG2=3740375040
	$(RISCV-GCC) ./test-cases/main8-1.c f8.s -g -o test8-1-9 -DARG1=-89846 -DARG2=-8653
	
	
	$(RISCV-GCC) ./test-cases/main8-2.c f8.s -g -o test8-2-0 -DARG1=3 -DARG2=7
	$(RISCV-GCC) ./test-cases/main8-2.c f8.s -g -o test8-2-1 -DARG1=42 -DARG2=24
	$(RISCV-GCC) ./test-cases/main8-2.c f8.s -g -o test8-2-2 -DARG1=34710 -DARG2=24
	$(RISCV-GCC) ./test-cases/main8-2.c f8.s -g -o test8-2-3 -DARG1=-31 -DARG2=8
	$(RISCV-GCC) ./test-cases/main8-2.c f8.s -g -o test8-2-4 -DARG1=19 -DARG2=-6
	$(RISCV-GCC) ./test-cases/main8-2.c f8.s -g -o test8-2-5 -DARG1=44 -DARG2=4
	$(RISCV-GCC) ./test-cases/main8-2.c f8.s -g -o test8-2-6 -DARG1=3 -DARG2=19828
	$(RISCV-GCC) ./test-cases/main8-2.c f8.s -g -o test8-2-7 -DARG1=7942502 -DARG2=625
	$(RISCV-GCC) ./test-cases/main8-2.c f8.s -g -o test8-2-8 -DARG1=564050426 -DARG2=3740375040
	$(RISCV-GCC) ./test-cases/main8-2.c f8.s -g -o test8-2-9 -DARG1=-89846 -DARG2=-8653
	
	$(RISCV-GCC) ./test-cases/main8-3.c f8.s -g -o test8-3-0 -DARG1=3 -DARG2=7
	$(RISCV-GCC) ./test-cases/main8-3.c f8.s -g -o test8-3-1 -DARG1=42 -DARG2=24
	$(RISCV-GCC) ./test-cases/main8-3.c f8.s -g -o test8-3-2 -DARG1=34710 -DARG2=24
	$(RISCV-GCC) ./test-cases/main8-3.c f8.s -g -o test8-3-3 -DARG1=-31 -DARG2=8
	$(RISCV-GCC) ./test-cases/main8-3.c f8.s -g -o test8-3-4 -DARG1=19 -DARG2=-6
	$(RISCV-GCC) ./test-cases/main8-3.c f8.s -g -o test8-3-5 -DARG1=44 -DARG2=4
	$(RISCV-GCC) ./test-cases/main8-3.c f8.s -g -o test8-3-6 -DARG1=3 -DARG2=19828
	$(RISCV-GCC) ./test-cases/main8-3.c f8.s -g -o test8-3-7 -DARG1=7942502 -DARG2=625
	$(RISCV-GCC) ./test-cases/main8-3.c f8.s -g -o test8-3-8 -DARG1=564050426 -DARG2=3740375040
	$(RISCV-GCC) ./test-cases/main8-3.c f8.s -g -o test8-3-9 -DARG1=-89846 -DARG2=-8653
	
	$(RISCV-GCC) ./test-cases/main8-4.c f8.s -g -o test8-4-0 -DARG1=3 -DARG2=7
	$(RISCV-GCC) ./test-cases/main8-4.c f8.s -g -o test8-4-1 -DARG1=42 -DARG2=24
	$(RISCV-GCC) ./test-cases/main8-4.c f8.s -g -o test8-4-2 -DARG1=34710 -DARG2=24
	$(RISCV-GCC) ./test-cases/main8-4.c f8.s -g -o test8-4-3 -DARG1=-31 -DARG2=8
	$(RISCV-GCC) ./test-cases/main8-4.c f8.s -g -o test8-4-4 -DARG1=19 -DARG2=-6
	$(RISCV-GCC) ./test-cases/main8-4.c f8.s -g -o test8-4-5 -DARG1=44 -DARG2=4
	$(RISCV-GCC) ./test-cases/main8-4.c f8.s -g -o test8-4-6 -DARG1=3 -DARG2=19828
	$(RISCV-GCC) ./test-cases/main8-4.c f8.s -g -o test8-4-7 -DARG1=7942502 -DARG2=625
	$(RISCV-GCC) ./test-cases/main8-4.c f8.s -g -o test8-4-8 -DARG1=564050426 -DARG2=3740375040
	$(RISCV-GCC) ./test-cases/main8-4.c f8.s -g -o test8-4-9 -DARG1=-89846 -DARG2=-8653
	
	
test9:
	$(RISCV-GCC) ./test-cases/main9-1.c f9.s -g -o test9-1-0 -DARG1=3 -DARG2=7 -DARG3=4
	$(RISCV-GCC) ./test-cases/main9-1.c f9.s -g -o test9-1-1 -DARG1=39 -DARG2=84 -DARG3=63
	$(RISCV-GCC) ./test-cases/main9-1.c f9.s -g -o test9-1-2 -DARG1=425 -DARG2=623 -DARG3=542
	$(RISCV-GCC) ./test-cases/main9-1.c f9.s -g -o test9-1-3 -DARG1=8364 -DARG2=949 -DARG3=7532
	$(RISCV-GCC) ./test-cases/main9-1.c f9.s -g -o test9-1-4 -DARG1=346 -DARG2=-12 -DARG3=932
	$(RISCV-GCC) ./test-cases/main9-1.c f9.s -g -o test9-1-5 -DARG1=-234 -DARG2=-5026 -DARG3=-405
	$(RISCV-GCC) ./test-cases/main9-1.c f9.s -g -o test9-1-6 -DARG1=-2354856 -DARG2=4560 -DARG3=2593
	$(RISCV-GCC) ./test-cases/main9-1.c f9.s -g -o test9-1-7 -DARG1=1 -DARG2=1 -DARG3=-1
	$(RISCV-GCC) ./test-cases/main9-1.c f9.s -g -o test9-1-8 -DARG1=58648 -DARG2=74264 -DARG3=-4246493
	$(RISCV-GCC) ./test-cases/main9-1.c f9.s -g -o test9-1-9 -DARG1=0 -DARG2=0 -DARG3=0
		
	$(RISCV-GCC) ./test-cases/main9-2.c f9.s -g -o test9-2-0 -DARG1=3 -DARG2=7 -DARG3=4
	$(RISCV-GCC) ./test-cases/main9-2.c f9.s -g -o test9-2-1 -DARG1=39 -DARG2=84 -DARG3=63
	$(RISCV-GCC) ./test-cases/main9-2.c f9.s -g -o test9-2-2 -DARG1=425 -DARG2=623 -DARG3=542
	$(RISCV-GCC) ./test-cases/main9-2.c f9.s -g -o test9-2-3 -DARG1=8364 -DARG2=949 -DARG3=7532
	$(RISCV-GCC) ./test-cases/main9-2.c f9.s -g -o test9-2-4 -DARG1=346 -DARG2=-12 -DARG3=932
	$(RISCV-GCC) ./test-cases/main9-2.c f9.s -g -o test9-2-5 -DARG1=-234 -DARG2=-5026 -DARG3=-405
	$(RISCV-GCC) ./test-cases/main9-2.c f9.s -g -o test9-2-6 -DARG1=-2354856 -DARG2=4560 -DARG3=2593
	$(RISCV-GCC) ./test-cases/main9-2.c f9.s -g -o test9-2-7 -DARG1=1 -DARG2=1 -DARG3=-1
	$(RISCV-GCC) ./test-cases/main9-2.c f9.s -g -o test9-2-8 -DARG1=58648 -DARG2=74264 -DARG3=-4246493
	$(RISCV-GCC) ./test-cases/main9-2.c f9.s -g -o test9-2-9 -DARG1=0 -DARG2=0 -DARG3=0
	
	$(RISCV-GCC) ./test-cases/main9-3.c f9.s -g -o test9-3-0 -DARG1=3 -DARG2=7 -DARG3=4
	$(RISCV-GCC) ./test-cases/main9-3.c f9.s -g -o test9-3-1 -DARG1=39 -DARG2=84 -DARG3=63
	$(RISCV-GCC) ./test-cases/main9-3.c f9.s -g -o test9-3-2 -DARG1=425 -DARG2=623 -DARG3=542
	$(RISCV-GCC) ./test-cases/main9-3.c f9.s -g -o test9-3-3 -DARG1=8364 -DARG2=949 -DARG3=7532
	$(RISCV-GCC) ./test-cases/main9-3.c f9.s -g -o test9-3-4 -DARG1=346 -DARG2=-12 -DARG3=932
	$(RISCV-GCC) ./test-cases/main9-3.c f9.s -g -o test9-3-5 -DARG1=-234 -DARG2=-5026 -DARG3=-405
	$(RISCV-GCC) ./test-cases/main9-3.c f9.s -g -o test9-3-6 -DARG1=-2354856 -DARG2=4560 -DARG3=2593
	$(RISCV-GCC) ./test-cases/main9-3.c f9.s -g -o test9-3-7 -DARG1=1 -DARG2=1 -DARG3=-1
	$(RISCV-GCC) ./test-cases/main9-3.c f9.s -g -o test9-3-8 -DARG1=58648 -DARG2=74264 -DARG3=-4246493
	$(RISCV-GCC) ./test-cases/main9-3.c f9.s -g -o test9-3-9 -DARG1=0 -DARG2=0 -DARG3=0
	
	$(RISCV-GCC) ./test-cases/main9-4.c f9.s -g -o test9-4-0 -DARG1=3 -DARG2=7 -DARG3=4
	$(RISCV-GCC) ./test-cases/main9-4.c f9.s -g -o test9-4-1 -DARG1=39 -DARG2=84 -DARG3=63
	$(RISCV-GCC) ./test-cases/main9-4.c f9.s -g -o test9-4-2 -DARG1=425 -DARG2=623 -DARG3=542
	$(RISCV-GCC) ./test-cases/main9-4.c f9.s -g -o test9-4-3 -DARG1=8364 -DARG2=949 -DARG3=7532
	$(RISCV-GCC) ./test-cases/main9-4.c f9.s -g -o test9-4-4 -DARG1=346 -DARG2=-12 -DARG3=932
	$(RISCV-GCC) ./test-cases/main9-4.c f9.s -g -o test9-4-5 -DARG1=-234 -DARG2=-5026 -DARG3=-405
	$(RISCV-GCC) ./test-cases/main9-4.c f9.s -g -o test9-4-6 -DARG1=-2354856 -DARG2=4560 -DARG3=2593
	$(RISCV-GCC) ./test-cases/main9-4.c f9.s -g -o test9-4-7 -DARG1=1 -DARG2=1 -DARG3=-1
	$(RISCV-GCC) ./test-cases/main9-4.c f9.s -g -o test9-4-8 -DARG1=58648 -DARG2=74264 -DARG3=-4246493
	$(RISCV-GCC) ./test-cases/main9-4.c f9.s -g -o test9-4-9 -DARG1=0 -DARG2=0 -DARG3=0
	
	
test10:
	$(RISCV-GCC) ./test-cases/main10-1.c f10.s -g -o test10-1-0 -DARG1=3 -DARG2=7 -DARG3=4
	$(RISCV-GCC) ./test-cases/main10-1.c f10.s -g -o test10-1-1 -DARG1=23 -DARG2=38 -DARG3=2424
	$(RISCV-GCC) ./test-cases/main10-1.c f10.s -g -o test10-1-2 -DARG1=41 -DARG2=532 -DARG3=20485
	$(RISCV-GCC) ./test-cases/main10-1.c f10.s -g -o test10-1-3 -DARG1=1 -DARG2=93 -DARG3=85334
	$(RISCV-GCC) ./test-cases/main10-1.c f10.s -g -o test10-1-4 -DARG1=19 -DARG2=0 -DARG3=-17004
	$(RISCV-GCC) ./test-cases/main10-1.c f10.s -g -o test10-1-5 -DARG1=-32 -DARG2=71 -DARG3=9823
	$(RISCV-GCC) ./test-cases/main10-1.c f10.s -g -o test10-1-6 -DARG1=872 -DARG2=1 -DARG3=0
	$(RISCV-GCC) ./test-cases/main10-1.c f10.s -g -o test10-1-7 -DARG1=41894 -DARG2=4 -DARG3=4542
	$(RISCV-GCC) ./test-cases/main10-1.c f10.s -g -o test10-1-8 -DARG1=0 -DARG2=162 -DARG3=963
	$(RISCV-GCC) ./test-cases/main10-1.c f10.s -g -o test10-1-9 -DARG1=23 -DARG2=12459 -DARG3=293476
	
	$(RISCV-GCC) ./test-cases/main10-2.c f10.s -g -o test10-2-0 -DARG1=3 -DARG2=7 -DARG3=4
	$(RISCV-GCC) ./test-cases/main10-2.c f10.s -g -o test10-2-1 -DARG1=23 -DARG2=38 -DARG3=2424
	$(RISCV-GCC) ./test-cases/main10-2.c f10.s -g -o test10-2-2 -DARG1=41 -DARG2=532 -DARG3=20485
	$(RISCV-GCC) ./test-cases/main10-2.c f10.s -g -o test10-2-3 -DARG1=1 -DARG2=93 -DARG3=85334
	$(RISCV-GCC) ./test-cases/main10-2.c f10.s -g -o test10-2-4 -DARG1=19 -DARG2=0 -DARG3=-17004
	$(RISCV-GCC) ./test-cases/main10-2.c f10.s -g -o test10-2-5 -DARG1=-32 -DARG2=71 -DARG3=9823
	$(RISCV-GCC) ./test-cases/main10-2.c f10.s -g -o test10-2-6 -DARG1=872 -DARG2=1 -DARG3=0
	$(RISCV-GCC) ./test-cases/main10-2.c f10.s -g -o test10-2-7 -DARG1=41894 -DARG2=4 -DARG3=4542
	$(RISCV-GCC) ./test-cases/main10-2.c f10.s -g -o test10-2-8 -DARG1=0 -DARG2=162 -DARG3=963
	$(RISCV-GCC) ./test-cases/main10-2.c f10.s -g -o test10-2-9 -DARG1=23 -DARG2=12459 -DARG3=293476
	
	$(RISCV-GCC) ./test-cases/main10-3.c f10.s -g -o test10-3-0 -DARG1=3 -DARG2=7 -DARG3=4
	$(RISCV-GCC) ./test-cases/main10-3.c f10.s -g -o test10-3-1 -DARG1=23 -DARG2=38 -DARG3=2424
	$(RISCV-GCC) ./test-cases/main10-3.c f10.s -g -o test10-3-2 -DARG1=41 -DARG2=532 -DARG3=20485
	$(RISCV-GCC) ./test-cases/main10-3.c f10.s -g -o test10-3-3 -DARG1=1 -DARG2=93 -DARG3=85334
	$(RISCV-GCC) ./test-cases/main10-3.c f10.s -g -o test10-3-4 -DARG1=19 -DARG2=0 -DARG3=-17004
	$(RISCV-GCC) ./test-cases/main10-3.c f10.s -g -o test10-3-5 -DARG1=-32 -DARG2=71 -DARG3=9823
	$(RISCV-GCC) ./test-cases/main10-3.c f10.s -g -o test10-3-6 -DARG1=872 -DARG2=1 -DARG3=0
	$(RISCV-GCC) ./test-cases/main10-3.c f10.s -g -o test10-3-7 -DARG1=41894 -DARG2=4 -DARG3=4542
	$(RISCV-GCC) ./test-cases/main10-3.c f10.s -g -o test10-3-8 -DARG1=0 -DARG2=162 -DARG3=963
	$(RISCV-GCC) ./test-cases/main10-3.c f10.s -g -o test10-3-9 -DARG1=23 -DARG2=12459 -DARG3=293476
	
	$(RISCV-GCC) ./test-cases/main10-4.c f10.s -g -o test10-4-0 -DARG1=3 -DARG2=7 -DARG3=4
	$(RISCV-GCC) ./test-cases/main10-4.c f10.s -g -o test10-4-1 -DARG1=23 -DARG2=38 -DARG3=2424
	$(RISCV-GCC) ./test-cases/main10-4.c f10.s -g -o test10-4-2 -DARG1=41 -DARG2=532 -DARG3=20485
	$(RISCV-GCC) ./test-cases/main10-4.c f10.s -g -o test10-4-3 -DARG1=1 -DARG2=93 -DARG3=85334
	$(RISCV-GCC) ./test-cases/main10-4.c f10.s -g -o test10-4-4 -DARG1=19 -DARG2=0 -DARG3=-17004
	$(RISCV-GCC) ./test-cases/main10-4.c f10.s -g -o test10-4-5 -DARG1=-32 -DARG2=71 -DARG3=9823
	$(RISCV-GCC) ./test-cases/main10-4.c f10.s -g -o test10-4-6 -DARG1=872 -DARG2=1 -DARG3=0
	$(RISCV-GCC) ./test-cases/main10-4.c f10.s -g -o test10-4-7 -DARG1=41894 -DARG2=4 -DARG3=4542
	$(RISCV-GCC) ./test-cases/main10-4.c f10.s -g -o test10-4-8 -DARG1=0 -DARG2=162 -DARG3=963
	$(RISCV-GCC) ./test-cases/main10-4.c f10.s -g -o test10-4-9 -DARG1=23 -DARG2=12459 -DARG3=293476
	
	$(RISCV-GCC) ./test-cases/main10-5.c f10.s -g -o test10-5-0 -DARG1=3 -DARG2=7 -DARG3=4
	$(RISCV-GCC) ./test-cases/main10-5.c f10.s -g -o test10-5-1 -DARG1=23 -DARG2=38 -DARG3=2424
	$(RISCV-GCC) ./test-cases/main10-5.c f10.s -g -o test10-5-2 -DARG1=41 -DARG2=532 -DARG3=20485
	$(RISCV-GCC) ./test-cases/main10-5.c f10.s -g -o test10-5-3 -DARG1=1 -DARG2=93 -DARG3=85334
	$(RISCV-GCC) ./test-cases/main10-5.c f10.s -g -o test10-5-4 -DARG1=19 -DARG2=0 -DARG3=-17004
	$(RISCV-GCC) ./test-cases/main10-5.c f10.s -g -o test10-5-5 -DARG1=-32 -DARG2=71 -DARG3=9823
	$(RISCV-GCC) ./test-cases/main10-5.c f10.s -g -o test10-5-6 -DARG1=872 -DARG2=1 -DARG3=0
	$(RISCV-GCC) ./test-cases/main10-5.c f10.s -g -o test10-5-7 -DARG1=41894 -DARG2=4 -DARG3=4542
	$(RISCV-GCC) ./test-cases/main10-5.c f10.s -g -o test10-5-8 -DARG1=0 -DARG2=162 -DARG3=963
	$(RISCV-GCC) ./test-cases/main10-5.c f10.s -g -o test10-5-9 -DARG1=23 -DARG2=12459 -DARG3=293476
	
	$(RISCV-GCC) ./test-cases/main10-6.c f10.s -g -o test10-6-0 -DARG1=3 -DARG2=7 -DARG3=4
	$(RISCV-GCC) ./test-cases/main10-6.c f10.s -g -o test10-6-1 -DARG1=23 -DARG2=38 -DARG3=2424
	$(RISCV-GCC) ./test-cases/main10-6.c f10.s -g -o test10-6-2 -DARG1=41 -DARG2=532 -DARG3=20485
	$(RISCV-GCC) ./test-cases/main10-6.c f10.s -g -o test10-6-3 -DARG1=1 -DARG2=93 -DARG3=85334
	$(RISCV-GCC) ./test-cases/main10-6.c f10.s -g -o test10-6-4 -DARG1=19 -DARG2=0 -DARG3=-17004
	$(RISCV-GCC) ./test-cases/main10-6.c f10.s -g -o test10-6-5 -DARG1=-32 -DARG2=71 -DARG3=9823
	$(RISCV-GCC) ./test-cases/main10-6.c f10.s -g -o test10-6-6 -DARG1=872 -DARG2=1 -DARG3=0
	$(RISCV-GCC) ./test-cases/main10-6.c f10.s -g -o test10-6-7 -DARG1=41894 -DARG2=4 -DARG3=4542
	$(RISCV-GCC) ./test-cases/main10-6.c f10.s -g -o test10-6-8 -DARG1=0 -DARG2=162 -DARG3=963
	$(RISCV-GCC) ./test-cases/main10-6.c f10.s -g -o test10-6-9 -DARG1=23 -DARG2=12459 -DARG3=293476
	
	$(RISCV-GCC) ./test-cases/main10-7.c f10.s -g -o test10-7-0 -DARG1=3 -DARG2=7 -DARG3=4
	$(RISCV-GCC) ./test-cases/main10-7.c f10.s -g -o test10-7-1 -DARG1=23 -DARG2=38 -DARG3=2424
	$(RISCV-GCC) ./test-cases/main10-7.c f10.s -g -o test10-7-2 -DARG1=41 -DARG2=532 -DARG3=20485
	$(RISCV-GCC) ./test-cases/main10-7.c f10.s -g -o test10-7-3 -DARG1=1 -DARG2=93 -DARG3=85334
	$(RISCV-GCC) ./test-cases/main10-7.c f10.s -g -o test10-7-4 -DARG1=19 -DARG2=0 -DARG3=-17004
	$(RISCV-GCC) ./test-cases/main10-7.c f10.s -g -o test10-7-5 -DARG1=-32 -DARG2=71 -DARG3=9823
	$(RISCV-GCC) ./test-cases/main10-7.c f10.s -g -o test10-7-6 -DARG1=872 -DARG2=1 -DARG3=0
	$(RISCV-GCC) ./test-cases/main10-7.c f10.s -g -o test10-7-7 -DARG1=41894 -DARG2=4 -DARG3=4542
	$(RISCV-GCC) ./test-cases/main10-7.c f10.s -g -o test10-7-8 -DARG1=0 -DARG2=162 -DARG3=963
	$(RISCV-GCC) ./test-cases/main10-7.c f10.s -g -o test10-7-9 -DARG1=23 -DARG2=12459 -DARG3=293476
	
	$(RISCV-GCC) ./test-cases/main10-8.c f10.s -g -o test10-8-0 -DARG1=3 -DARG2=7 -DARG3=4
	$(RISCV-GCC) ./test-cases/main10-8.c f10.s -g -o test10-8-1 -DARG1=23 -DARG2=38 -DARG3=2424
	$(RISCV-GCC) ./test-cases/main10-8.c f10.s -g -o test10-8-2 -DARG1=41 -DARG2=532 -DARG3=20485
	$(RISCV-GCC) ./test-cases/main10-8.c f10.s -g -o test10-8-3 -DARG1=1 -DARG2=93 -DARG3=85334
	$(RISCV-GCC) ./test-cases/main10-8.c f10.s -g -o test10-8-4 -DARG1=19 -DARG2=0 -DARG3=-17004
	$(RISCV-GCC) ./test-cases/main10-8.c f10.s -g -o test10-8-5 -DARG1=-32 -DARG2=71 -DARG3=9823
	$(RISCV-GCC) ./test-cases/main10-8.c f10.s -g -o test10-8-6 -DARG1=872 -DARG2=1 -DARG3=0
	$(RISCV-GCC) ./test-cases/main10-8.c f10.s -g -o test10-8-7 -DARG1=41894 -DARG2=4 -DARG3=4542
	$(RISCV-GCC) ./test-cases/main10-8.c f10.s -g -o test10-8-8 -DARG1=0 -DARG2=162 -DARG3=963
	$(RISCV-GCC) ./test-cases/main10-8.c f10.s -g -o test10-8-9 -DARG1=23 -DARG2=12459 -DARG3=293476
	
	
test11:
	$(RISCV-GCC) ./test-cases/main11-1.c f11.s -g -o test11-1-0 -DARG1=3 -DARG2=7 -DARG3=4
	$(RISCV-GCC) ./test-cases/main11-1.c f11.s -g -o test11-1-1 -DARG1=15 -DARG2=43 -DARG3=23
	$(RISCV-GCC) ./test-cases/main11-1.c f11.s -g -o test11-1-2 -DARG1=54 -DARG2=21 -DARG3=8
	$(RISCV-GCC) ./test-cases/main11-1.c f11.s -g -o test11-1-3 -DARG1=234 -DARG2=775 -DARG3=435
	$(RISCV-GCC) ./test-cases/main11-1.c f11.s -g -o test11-1-4 -DARG1=3245 -DARG2=324 -DARG3=6674
	$(RISCV-GCC) ./test-cases/main11-1.c f11.s -g -o test11-1-5 -DARG1=34762 -DARG2=6366 -DARG3=60673
	$(RISCV-GCC) ./test-cases/main11-1.c f11.s -g -o test11-1-6 -DARG1=5820 -DARG2=-5028650 -DARG3=9265
	$(RISCV-GCC) ./test-cases/main11-1.c f11.s -g -o test11-1-7 -DARG1=684 -DARG2=394 -DARG3=4928650354
	$(RISCV-GCC) ./test-cases/main11-1.c f11.s -g -o test11-1-8 -DARG1=97257 -DARG2=7462 -DARG3=7526
	$(RISCV-GCC) ./test-cases/main11-1.c f11.s -g -o test11-1-9 -DARG1=0 -DARG2=0 -DARG3=0
	
	
	$(RISCV-GCC) ./test-cases/main11-2.c f11.s -g -o test11-2-0 -DARG1=3 -DARG2=7 -DARG3=4
	$(RISCV-GCC) ./test-cases/main11-2.c f11.s -g -o test11-2-1 -DARG1=15 -DARG2=43 -DARG3=23
	$(RISCV-GCC) ./test-cases/main11-2.c f11.s -g -o test11-2-2 -DARG1=54 -DARG2=21 -DARG3=8
	$(RISCV-GCC) ./test-cases/main11-2.c f11.s -g -o test11-2-3 -DARG1=234 -DARG2=775 -DARG3=435
	$(RISCV-GCC) ./test-cases/main11-2.c f11.s -g -o test11-2-4 -DARG1=3245 -DARG2=324 -DARG3=6674
	$(RISCV-GCC) ./test-cases/main11-2.c f11.s -g -o test11-2-5 -DARG1=34762 -DARG2=6366 -DARG3=60673
	$(RISCV-GCC) ./test-cases/main11-2.c f11.s -g -o test11-2-6 -DARG1=5820 -DARG2=-5028650 -DARG3=9265
	$(RISCV-GCC) ./test-cases/main11-2.c f11.s -g -o test11-2-7 -DARG1=684 -DARG2=394 -DARG3=4928650354
	$(RISCV-GCC) ./test-cases/main11-2.c f11.s -g -o test11-2-8 -DARG1=97257 -DARG2=7462 -DARG3=7526
	$(RISCV-GCC) ./test-cases/main11-2.c f11.s -g -o test11-2-9 -DARG1=0 -DARG2=0 -DARG3=0

	$(RISCV-GCC) ./test-cases/main11-3.c f11.s -g -o test11-3-0 -DARG1=3 -DARG2=7 -DARG3=4
	$(RISCV-GCC) ./test-cases/main11-3.c f11.s -g -o test11-3-1 -DARG1=15 -DARG2=43 -DARG3=23
	$(RISCV-GCC) ./test-cases/main11-3.c f11.s -g -o test11-3-2 -DARG1=54 -DARG2=21 -DARG3=8
	$(RISCV-GCC) ./test-cases/main11-3.c f11.s -g -o test11-3-3 -DARG1=234 -DARG2=775 -DARG3=435
	$(RISCV-GCC) ./test-cases/main11-3.c f11.s -g -o test11-3-4 -DARG1=3245 -DARG2=324 -DARG3=6674
	$(RISCV-GCC) ./test-cases/main11-3.c f11.s -g -o test11-3-5 -DARG1=34762 -DARG2=6366 -DARG3=60673
	$(RISCV-GCC) ./test-cases/main11-3.c f11.s -g -o test11-3-6 -DARG1=5820 -DARG2=-5028650 -DARG3=9265
	$(RISCV-GCC) ./test-cases/main11-3.c f11.s -g -o test11-3-7 -DARG1=684 -DARG2=394 -DARG3=4928650354
	$(RISCV-GCC) ./test-cases/main11-3.c f11.s -g -o test11-3-8 -DARG1=97257 -DARG2=7462 -DARG3=7526
	$(RISCV-GCC) ./test-cases/main11-3.c f11.s -g -o test11-3-9 -DARG1=0 -DARG2=0 -DARG3=0
	
	$(RISCV-GCC) ./test-cases/main11-4.c f11.s -g -o test11-4-0 -DARG1=3 -DARG2=7 -DARG3=4
	$(RISCV-GCC) ./test-cases/main11-4.c f11.s -g -o test11-4-1 -DARG1=15 -DARG2=43 -DARG3=23
	$(RISCV-GCC) ./test-cases/main11-4.c f11.s -g -o test11-4-2 -DARG1=54 -DARG2=21 -DARG3=8
	$(RISCV-GCC) ./test-cases/main11-4.c f11.s -g -o test11-4-3 -DARG1=234 -DARG2=775 -DARG3=435
	$(RISCV-GCC) ./test-cases/main11-4.c f11.s -g -o test11-4-4 -DARG1=3245 -DARG2=324 -DARG3=6674
	$(RISCV-GCC) ./test-cases/main11-4.c f11.s -g -o test11-4-5 -DARG1=34762 -DARG2=6366 -DARG3=60673
	$(RISCV-GCC) ./test-cases/main11-4.c f11.s -g -o test11-4-6 -DARG1=5820 -DARG2=-5028650 -DARG3=9265
	$(RISCV-GCC) ./test-cases/main11-4.c f11.s -g -o test11-4-7 -DARG1=684 -DARG2=394 -DARG3=4928650354
	$(RISCV-GCC) ./test-cases/main11-4.c f11.s -g -o test11-4-8 -DARG1=97257 -DARG2=7462 -DARG3=7526
	$(RISCV-GCC) ./test-cases/main11-4.c f11.s -g -o test11-4-9 -DARG1=0 -DARG2=0 -DARG3=0
	
	$(RISCV-GCC) ./test-cases/main11-5.c f11.s -g -o test11-5-0 -DARG1=3 -DARG2=7 -DARG3=4
	$(RISCV-GCC) ./test-cases/main11-5.c f11.s -g -o test11-5-1 -DARG1=15 -DARG2=43 -DARG3=23
	$(RISCV-GCC) ./test-cases/main11-5.c f11.s -g -o test11-5-2 -DARG1=54 -DARG2=21 -DARG3=8
	$(RISCV-GCC) ./test-cases/main11-5.c f11.s -g -o test11-5-3 -DARG1=234 -DARG2=775 -DARG3=435
	$(RISCV-GCC) ./test-cases/main11-5.c f11.s -g -o test11-5-4 -DARG1=3245 -DARG2=324 -DARG3=6674
	$(RISCV-GCC) ./test-cases/main11-5.c f11.s -g -o test11-5-5 -DARG1=34762 -DARG2=6366 -DARG3=60673
	$(RISCV-GCC) ./test-cases/main11-5.c f11.s -g -o test11-5-6 -DARG1=5820 -DARG2=-5028650 -DARG3=9265
	$(RISCV-GCC) ./test-cases/main11-5.c f11.s -g -o test11-5-7 -DARG1=684 -DARG2=394 -DARG3=4928650354
	$(RISCV-GCC) ./test-cases/main11-5.c f11.s -g -o test11-5-8 -DARG1=97257 -DARG2=7462 -DARG3=7526
	$(RISCV-GCC) ./test-cases/main11-5.c f11.s -g -o test11-5-9 -DARG1=0 -DARG2=0 -DARG3=0
	
	$(RISCV-GCC) ./test-cases/main11-6.c f11.s -g -o test11-6-0 -DARG1=3 -DARG2=7 -DARG3=4
	$(RISCV-GCC) ./test-cases/main11-6.c f11.s -g -o test11-6-1 -DARG1=15 -DARG2=43 -DARG3=23
	$(RISCV-GCC) ./test-cases/main11-6.c f11.s -g -o test11-6-2 -DARG1=54 -DARG2=21 -DARG3=8
	$(RISCV-GCC) ./test-cases/main11-6.c f11.s -g -o test11-6-3 -DARG1=234 -DARG2=775 -DARG3=435
	$(RISCV-GCC) ./test-cases/main11-6.c f11.s -g -o test11-6-4 -DARG1=3245 -DARG2=324 -DARG3=6674
	$(RISCV-GCC) ./test-cases/main11-6.c f11.s -g -o test11-6-5 -DARG1=34762 -DARG2=6366 -DARG3=60673
	$(RISCV-GCC) ./test-cases/main11-6.c f11.s -g -o test11-6-6 -DARG1=5820 -DARG2=-5028650 -DARG3=9265
	$(RISCV-GCC) ./test-cases/main11-6.c f11.s -g -o test11-6-7 -DARG1=684 -DARG2=394 -DARG3=4928650354
	$(RISCV-GCC) ./test-cases/main11-6.c f11.s -g -o test11-6-8 -DARG1=97257 -DARG2=7462 -DARG3=7526
	$(RISCV-GCC) ./test-cases/main11-6.c f11.s -g -o test11-6-9 -DARG1=0 -DARG2=0 -DARG3=0
	
	$(RISCV-GCC) ./test-cases/main11-7.c f11.s -g -o test11-7-0 -DARG1=3 -DARG2=7 -DARG3=4
	$(RISCV-GCC) ./test-cases/main11-7.c f11.s -g -o test11-7-1 -DARG1=15 -DARG2=43 -DARG3=23
	$(RISCV-GCC) ./test-cases/main11-7.c f11.s -g -o test11-7-2 -DARG1=54 -DARG2=21 -DARG3=8
	$(RISCV-GCC) ./test-cases/main11-7.c f11.s -g -o test11-7-3 -DARG1=234 -DARG2=775 -DARG3=435
	$(RISCV-GCC) ./test-cases/main11-7.c f11.s -g -o test11-7-4 -DARG1=3245 -DARG2=324 -DARG3=6674
	$(RISCV-GCC) ./test-cases/main11-7.c f11.s -g -o test11-7-5 -DARG1=34762 -DARG2=6366 -DARG3=60673
	$(RISCV-GCC) ./test-cases/main11-7.c f11.s -g -o test11-7-6 -DARG1=5820 -DARG2=-5028650 -DARG3=9265
	$(RISCV-GCC) ./test-cases/main11-7.c f11.s -g -o test11-7-7 -DARG1=684 -DARG2=394 -DARG3=4928650354
	$(RISCV-GCC) ./test-cases/main11-7.c f11.s -g -o test11-7-8 -DARG1=97257 -DARG2=7462 -DARG3=7526
	$(RISCV-GCC) ./test-cases/main11-7.c f11.s -g -o test11-7-9 -DARG1=0 -DARG2=0 -DARG3=0
	
	$(RISCV-GCC) ./test-cases/main11-8.c f11.s -g -o test11-8-0 -DARG1=3 -DARG2=7 -DARG3=4
	$(RISCV-GCC) ./test-cases/main11-8.c f11.s -g -o test11-8-1 -DARG1=15 -DARG2=43 -DARG3=23
	$(RISCV-GCC) ./test-cases/main11-8.c f11.s -g -o test11-8-2 -DARG1=54 -DARG2=21 -DARG3=8
	$(RISCV-GCC) ./test-cases/main11-8.c f11.s -g -o test11-8-3 -DARG1=234 -DARG2=775 -DARG3=435
	$(RISCV-GCC) ./test-cases/main11-8.c f11.s -g -o test11-8-4 -DARG1=3245 -DARG2=324 -DARG3=6674
	$(RISCV-GCC) ./test-cases/main11-8.c f11.s -g -o test11-8-5 -DARG1=34762 -DARG2=6366 -DARG3=60673
	$(RISCV-GCC) ./test-cases/main11-8.c f11.s -g -o test11-8-6 -DARG1=5820 -DARG2=-5028650 -DARG3=9265
	$(RISCV-GCC) ./test-cases/main11-8.c f11.s -g -o test11-8-7 -DARG1=684 -DARG2=394 -DARG3=4928650354
	$(RISCV-GCC) ./test-cases/main11-8.c f11.s -g -o test11-8-8 -DARG1=97257 -DARG2=7462 -DARG3=7526
	$(RISCV-GCC) ./test-cases/main11-8.c f11.s -g -o test11-8-9 -DARG1=0 -DARG2=0 -DARG3=0
	
	
test12:
	$(RISCV-GCC) ./test-cases/main12-1.c f12.s -g -o test12-1-0 -DARG1=3 -DARG2=7 -DARG3=4
	$(RISCV-GCC) ./test-cases/main12-1.c f12.s -g -o test12-1-1 -DARG1=52 -DARG2=23 -DARG3=46
	$(RISCV-GCC) ./test-cases/main12-1.c f12.s -g -o test12-1-2 -DARG1=85 -DARG2=45 -DARG3=4
	$(RISCV-GCC) ./test-cases/main12-1.c f12.s -g -o test12-1-3 -DARG1=243 -DARG2=732 -DARG3=4946
	$(RISCV-GCC) ./test-cases/main12-1.c f12.s -g -o test12-1-4 -DARG1=542 -DARG2=636 -DARG3=342
	$(RISCV-GCC) ./test-cases/main12-1.c f12.s -g -o test12-1-5 -DARG1=5362 -DARG2=2345 -DARG3=143
	$(RISCV-GCC) ./test-cases/main12-1.c f12.s -g -o test12-1-6 -DARG1=66242 -DARG2=-63636 -DARG3=63562
	$(RISCV-GCC) ./test-cases/main12-1.c f12.s -g -o test12-1-7 -DARG1=76426 -DARG2=24552 -DARG3=1543616
	$(RISCV-GCC) ./test-cases/main12-1.c f12.s -g -o test12-1-8 -DARG1=5425 -DARG2=342 -DARG3=72572
	$(RISCV-GCC) ./test-cases/main12-1.c f12.s -g -o test12-1-9 -DARG1=0 -DARG2=0 -DARG3=0
	
	$(RISCV-GCC) ./test-cases/main12-2.c f12.s -g -o test12-2-0 -DARG1=3 -DARG2=7 -DARG3=4
	$(RISCV-GCC) ./test-cases/main12-2.c f12.s -g -o test12-2-1 -DARG1=52 -DARG2=23 -DARG3=46
	$(RISCV-GCC) ./test-cases/main12-2.c f12.s -g -o test12-2-2 -DARG1=85 -DARG2=45 -DARG3=4
	$(RISCV-GCC) ./test-cases/main12-2.c f12.s -g -o test12-2-3 -DARG1=243 -DARG2=732 -DARG3=4946
	$(RISCV-GCC) ./test-cases/main12-2.c f12.s -g -o test12-2-4 -DARG1=542 -DARG2=636 -DARG3=342
	$(RISCV-GCC) ./test-cases/main12-2.c f12.s -g -o test12-2-5 -DARG1=5362 -DARG2=2345 -DARG3=143
	$(RISCV-GCC) ./test-cases/main12-2.c f12.s -g -o test12-2-6 -DARG1=66242 -DARG2=-63636 -DARG3=63562
	$(RISCV-GCC) ./test-cases/main12-2.c f12.s -g -o test12-2-7 -DARG1=76426 -DARG2=24552 -DARG3=1543616
	$(RISCV-GCC) ./test-cases/main12-2.c f12.s -g -o test12-2-8 -DARG1=5425 -DARG2=342 -DARG3=72572
	$(RISCV-GCC) ./test-cases/main12-2.c f12.s -g -o test12-2-9 -DARG1=0 -DARG2=0 -DARG3=0
	
	$(RISCV-GCC) ./test-cases/main12-3.c f12.s -g -o test12-3-0 -DARG1=3 -DARG2=7 -DARG3=4
	$(RISCV-GCC) ./test-cases/main12-3.c f12.s -g -o test12-3-1 -DARG1=52 -DARG2=23 -DARG3=46
	$(RISCV-GCC) ./test-cases/main12-3.c f12.s -g -o test12-3-2 -DARG1=85 -DARG2=45 -DARG3=4
	$(RISCV-GCC) ./test-cases/main12-3.c f12.s -g -o test12-3-3 -DARG1=243 -DARG2=732 -DARG3=4946
	$(RISCV-GCC) ./test-cases/main12-3.c f12.s -g -o test12-3-4 -DARG1=542 -DARG2=636 -DARG3=342
	$(RISCV-GCC) ./test-cases/main12-3.c f12.s -g -o test12-3-5 -DARG1=5362 -DARG2=2345 -DARG3=143
	$(RISCV-GCC) ./test-cases/main12-3.c f12.s -g -o test12-3-6 -DARG1=66242 -DARG2=-63636 -DARG3=63562
	$(RISCV-GCC) ./test-cases/main12-3.c f12.s -g -o test12-3-7 -DARG1=76426 -DARG2=24552 -DARG3=1543616
	$(RISCV-GCC) ./test-cases/main12-3.c f12.s -g -o test12-3-8 -DARG1=5425 -DARG2=342 -DARG3=72572
	$(RISCV-GCC) ./test-cases/main12-3.c f12.s -g -o test12-3-9 -DARG1=0 -DARG2=0 -DARG3=0
	
	$(RISCV-GCC) ./test-cases/main12-4.c f12.s -g -o test12-4-0 -DARG1=3 -DARG2=7 -DARG3=4
	$(RISCV-GCC) ./test-cases/main12-1.c f12.s -g -o test12-4-1 -DARG1=52 -DARG2=23 -DARG3=46
	$(RISCV-GCC) ./test-cases/main12-1.c f12.s -g -o test12-4-2 -DARG1=85 -DARG2=45 -DARG3=4
	$(RISCV-GCC) ./test-cases/main12-1.c f12.s -g -o test12-4-3 -DARG1=243 -DARG2=732 -DARG3=4946
	$(RISCV-GCC) ./test-cases/main12-1.c f12.s -g -o test12-4-4 -DARG1=542 -DARG2=636 -DARG3=342
	$(RISCV-GCC) ./test-cases/main12-1.c f12.s -g -o test12-4-5 -DARG1=5362 -DARG2=2345 -DARG3=143
	$(RISCV-GCC) ./test-cases/main12-1.c f12.s -g -o test12-4-6 -DARG1=66242 -DARG2=-63636 -DARG3=63562
	$(RISCV-GCC) ./test-cases/main12-1.c f12.s -g -o test12-4-7 -DARG1=76426 -DARG2=24552 -DARG3=1543616
	$(RISCV-GCC) ./test-cases/main12-1.c f12.s -g -o test12-4-8 -DARG1=5425 -DARG2=342 -DARG3=72572
	$(RISCV-GCC) ./test-cases/main12-1.c f12.s -g -o test12-4-9 -DARG1=0 -DARG2=0 -DARG3=0
	
	$(RISCV-GCC) ./test-cases/main12-5.c f12.s -g -o test12-5-0 -DARG1=3 -DARG2=7 -DARG3=4
	$(RISCV-GCC) ./test-cases/main12-5.c f12.s -g -o test12-5-1 -DARG1=52 -DARG2=23 -DARG3=46
	$(RISCV-GCC) ./test-cases/main12-5.c f12.s -g -o test12-5-2 -DARG1=85 -DARG2=45 -DARG3=4
	$(RISCV-GCC) ./test-cases/main12-5.c f12.s -g -o test12-5-3 -DARG1=243 -DARG2=732 -DARG3=4946
	$(RISCV-GCC) ./test-cases/main12-5.c f12.s -g -o test12-5-4 -DARG1=542 -DARG2=636 -DARG3=342
	$(RISCV-GCC) ./test-cases/main12-5.c f12.s -g -o test12-5-5 -DARG1=5362 -DARG2=2345 -DARG3=143
	$(RISCV-GCC) ./test-cases/main12-5.c f12.s -g -o test12-5-6 -DARG1=66242 -DARG2=-63636 -DARG3=63562
	$(RISCV-GCC) ./test-cases/main12-5.c f12.s -g -o test12-5-7 -DARG1=76426 -DARG2=24552 -DARG3=1543616
	$(RISCV-GCC) ./test-cases/main12-5.c f12.s -g -o test12-5-8 -DARG1=5425 -DARG2=342 -DARG3=72572
	$(RISCV-GCC) ./test-cases/main12-5.c f12.s -g -o test12-5-9 -DARG1=0 -DARG2=0 -DARG3=0
	
	$(RISCV-GCC) ./test-cases/main12-6.c f12.s -g -o test12-6-0 -DARG1=3 -DARG2=7 -DARG3=4
	$(RISCV-GCC) ./test-cases/main12-6.c f12.s -g -o test12-6-1 -DARG1=52 -DARG2=23 -DARG3=46
	$(RISCV-GCC) ./test-cases/main12-6.c f12.s -g -o test12-6-2 -DARG1=85 -DARG2=45 -DARG3=4
	$(RISCV-GCC) ./test-cases/main12-6.c f12.s -g -o test12-6-3 -DARG1=243 -DARG2=732 -DARG3=4946
	$(RISCV-GCC) ./test-cases/main12-6.c f12.s -g -o test12-6-4 -DARG1=542 -DARG2=636 -DARG3=342
	$(RISCV-GCC) ./test-cases/main12-6.c f12.s -g -o test12-6-5 -DARG1=5362 -DARG2=2345 -DARG3=143
	$(RISCV-GCC) ./test-cases/main12-6.c f12.s -g -o test12-6-6 -DARG1=66242 -DARG2=-63636 -DARG3=63562
	$(RISCV-GCC) ./test-cases/main12-6.c f12.s -g -o test12-6-7 -DARG1=76426 -DARG2=24552 -DARG3=1543616
	$(RISCV-GCC) ./test-cases/main12-6.c f12.s -g -o test12-6-8 -DARG1=5425 -DARG2=342 -DARG3=72572
	$(RISCV-GCC) ./test-cases/main12-6.c f12.s -g -o test12-6-9 -DARG1=0 -DARG2=0 -DARG3=0
	
	$(RISCV-GCC) ./test-cases/main12-7.c f12.s -g -o test12-7-0 -DARG1=3 -DARG2=7 -DARG3=4
	$(RISCV-GCC) ./test-cases/main12-7.c f12.s -g -o test12-7-1 -DARG1=52 -DARG2=23 -DARG3=46
	$(RISCV-GCC) ./test-cases/main12-7.c f12.s -g -o test12-7-2 -DARG1=85 -DARG2=45 -DARG3=4
	$(RISCV-GCC) ./test-cases/main12-7.c f12.s -g -o test12-7-3 -DARG1=243 -DARG2=732 -DARG3=4946
	$(RISCV-GCC) ./test-cases/main12-7.c f12.s -g -o test12-7-4 -DARG1=542 -DARG2=636 -DARG3=342
	$(RISCV-GCC) ./test-cases/main12-7.c f12.s -g -o test12-7-5 -DARG1=5362 -DARG2=2345 -DARG3=143
	$(RISCV-GCC) ./test-cases/main12-7.c f12.s -g -o test12-7-6 -DARG1=66242 -DARG2=-63636 -DARG3=63562
	$(RISCV-GCC) ./test-cases/main12-7.c f12.s -g -o test12-7-7 -DARG1=76426 -DARG2=24552 -DARG3=1543616
	$(RISCV-GCC) ./test-cases/main12-7.c f12.s -g -o test12-7-8 -DARG1=5425 -DARG2=342 -DARG3=72572
	$(RISCV-GCC) ./test-cases/main12-7.c f12.s -g -o test12-7-9 -DARG1=0 -DARG2=0 -DARG3=0
	
	$(RISCV-GCC) ./test-cases/main12-8.c f12.s -g -o test12-8-0 -DARG1=3 -DARG2=7 -DARG3=4
	$(RISCV-GCC) ./test-cases/main12-8.c f12.s -g -o test12-8-1 -DARG1=52 -DARG2=23 -DARG3=46
	$(RISCV-GCC) ./test-cases/main12-8.c f12.s -g -o test12-8-2 -DARG1=85 -DARG2=45 -DARG3=4
	$(RISCV-GCC) ./test-cases/main12-8.c f12.s -g -o test12-8-3 -DARG1=243 -DARG2=732 -DARG3=4946
	$(RISCV-GCC) ./test-cases/main12-8.c f12.s -g -o test12-8-4 -DARG1=542 -DARG2=636 -DARG3=342
	$(RISCV-GCC) ./test-cases/main12-8.c f12.s -g -o test12-8-5 -DARG1=5362 -DARG2=2345 -DARG3=143
	$(RISCV-GCC) ./test-cases/main12-8.c f12.s -g -o test12-8-6 -DARG1=66242 -DARG2=-63636 -DARG3=63562
	$(RISCV-GCC) ./test-cases/main12-8.c f12.s -g -o test12-8-7 -DARG1=76426 -DARG2=24552 -DARG3=1543616
	$(RISCV-GCC) ./test-cases/main12-8.c f12.s -g -o test12-8-8 -DARG1=5425 -DARG2=342 -DARG3=72572
	$(RISCV-GCC) ./test-cases/main12-8.c f12.s -g -o test12-8-9 -DARG1=0 -DARG2=0 -DARG3=0
	
	$(RISCV-GCC) ./test-cases/main12-9.c f12.s -g -o test12-9-0 -DARG1=3 -DARG2=7 -DARG3=4
	$(RISCV-GCC) ./test-cases/main12-9.c f12.s -g -o test12-9-1 -DARG1=52 -DARG2=23 -DARG3=46
	$(RISCV-GCC) ./test-cases/main12-9.c f12.s -g -o test12-9-2 -DARG1=85 -DARG2=45 -DARG3=4
	$(RISCV-GCC) ./test-cases/main12-9.c f12.s -g -o test12-9-3 -DARG1=243 -DARG2=732 -DARG3=4946
	$(RISCV-GCC) ./test-cases/main12-9.c f12.s -g -o test12-9-4 -DARG1=542 -DARG2=636 -DARG3=342
	$(RISCV-GCC) ./test-cases/main12-9.c f12.s -g -o test12-9-5 -DARG1=5362 -DARG2=2345 -DARG3=143
	$(RISCV-GCC) ./test-cases/main12-9.c f12.s -g -o test12-9-6 -DARG1=66242 -DARG2=-63636 -DARG3=63562
	$(RISCV-GCC) ./test-cases/main12-9.c f12.s -g -o test12-9-7 -DARG1=76426 -DARG2=24552 -DARG3=1543616
	$(RISCV-GCC) ./test-cases/main12-9.c f12.s -g -o test12-9-8 -DARG1=5425 -DARG2=342 -DARG3=72572
	$(RISCV-GCC) ./test-cases/main12-9.c f12.s -g -o test12-9-9 -DARG1=0 -DARG2=0 -DARG3=0
	
	$(RISCV-GCC) ./test-cases/main12-10.c f12.s -g -o test12-10-0 -DARG1=3 -DARG2=7 -DARG3=4
	$(RISCV-GCC) ./test-cases/main12-10.c f12.s -g -o test12-10-1 -DARG1=52 -DARG2=23 -DARG3=46
	$(RISCV-GCC) ./test-cases/main12-10.c f12.s -g -o test12-10-2 -DARG1=85 -DARG2=45 -DARG3=4
	$(RISCV-GCC) ./test-cases/main12-10.c f12.s -g -o test12-10-3 -DARG1=243 -DARG2=732 -DARG3=4946
	$(RISCV-GCC) ./test-cases/main12-10.c f12.s -g -o test12-10-4 -DARG1=542 -DARG2=636 -DARG3=342
	$(RISCV-GCC) ./test-cases/main12-10.c f12.s -g -o test12-10-5 -DARG1=5362 -DARG2=2345 -DARG3=143
	$(RISCV-GCC) ./test-cases/main12-10.c f12.s -g -o test12-10-6 -DARG1=66242 -DARG2=-63636 -DARG3=63562
	$(RISCV-GCC) ./test-cases/main12-10.c f12.s -g -o test12-10-7 -DARG1=76426 -DARG2=24552 -DARG3=1543616
	$(RISCV-GCC) ./test-cases/main12-10.c f12.s -g -o test12-10-8 -DARG1=5425 -DARG2=342 -DARG3=72572
	$(RISCV-GCC) ./test-cases/main12-10.c f12.s -g -o test12-10-9 -DARG1=0 -DARG2=0 -DARG3=0
	
	$(RISCV-GCC) ./test-cases/main12-11.c f12.s -g -o test12-11-0 -DARG1=3 -DARG2=7 -DARG3=4
	$(RISCV-GCC) ./test-cases/main12-11.c f12.s -g -o test12-11-1 -DARG1=52 -DARG2=23 -DARG3=46
	$(RISCV-GCC) ./test-cases/main12-11.c f12.s -g -o test12-11-2 -DARG1=85 -DARG2=45 -DARG3=4
	$(RISCV-GCC) ./test-cases/main12-11.c f12.s -g -o test12-11-3 -DARG1=243 -DARG2=732 -DARG3=4946
	$(RISCV-GCC) ./test-cases/main12-11.c f12.s -g -o test12-11-4 -DARG1=542 -DARG2=636 -DARG3=342
	$(RISCV-GCC) ./test-cases/main12-11.c f12.s -g -o test12-11-5 -DARG1=5362 -DARG2=2345 -DARG3=143
	$(RISCV-GCC) ./test-cases/main12-11.c f12.s -g -o test12-11-6 -DARG1=66242 -DARG2=-63636 -DARG3=63562
	$(RISCV-GCC) ./test-cases/main12-11.c f12.s -g -o test12-11-7 -DARG1=76426 -DARG2=24552 -DARG3=1543616
	$(RISCV-GCC) ./test-cases/main12-11.c f12.s -g -o test12-11-8 -DARG1=5425 -DARG2=342 -DARG3=72572
	$(RISCV-GCC) ./test-cases/main12-11.c f12.s -g -o test12-11-9 -DARG1=0 -DARG2=0 -DARG3=0
	
	$(RISCV-GCC) ./test-cases/main12-12.c f12.s -g -o test12-12-0 -DARG1=3 -DARG2=7 -DARG3=4
	$(RISCV-GCC) ./test-cases/main12-12.c f12.s -g -o test12-12-1 -DARG1=52 -DARG2=23 -DARG3=46
	$(RISCV-GCC) ./test-cases/main12-12.c f12.s -g -o test12-12-2 -DARG1=85 -DARG2=45 -DARG3=4
	$(RISCV-GCC) ./test-cases/main12-12.c f12.s -g -o test12-12-3 -DARG1=243 -DARG2=732 -DARG3=4946
	$(RISCV-GCC) ./test-cases/main12-12.c f12.s -g -o test12-12-4 -DARG1=542 -DARG2=636 -DARG3=342
	$(RISCV-GCC) ./test-cases/main12-12.c f12.s -g -o test12-12-5 -DARG1=5362 -DARG2=2345 -DARG3=143
	$(RISCV-GCC) ./test-cases/main12-12.c f12.s -g -o test12-12-6 -DARG1=66242 -DARG2=-63636 -DARG3=63562
	$(RISCV-GCC) ./test-cases/main12-12.c f12.s -g -o test12-12-7 -DARG1=76426 -DARG2=24552 -DARG3=1543616
	$(RISCV-GCC) ./test-cases/main12-12.c f12.s -g -o test12-12-8 -DARG1=5425 -DARG2=342 -DARG3=72572
	$(RISCV-GCC) ./test-cases/main12-12.c f12.s -g -o test12-12-9 -DARG1=0 -DARG2=0 -DARG3=0
	
	$(RISCV-GCC) ./test-cases/main12-13.c f12.s -g -o test12-13-0 -DARG1=3 -DARG2=7 -DARG3=4
	$(RISCV-GCC) ./test-cases/main12-13.c f12.s -g -o test12-13-1 -DARG1=52 -DARG2=23 -DARG3=46
	$(RISCV-GCC) ./test-cases/main12-13.c f12.s -g -o test12-13-2 -DARG1=85 -DARG2=45 -DARG3=4
	$(RISCV-GCC) ./test-cases/main12-13.c f12.s -g -o test12-13-3 -DARG1=243 -DARG2=732 -DARG3=4946
	$(RISCV-GCC) ./test-cases/main12-13.c f12.s -g -o test12-13-4 -DARG1=542 -DARG2=636 -DARG3=342
	$(RISCV-GCC) ./test-cases/main12-13.c f12.s -g -o test12-13-5 -DARG1=5362 -DARG2=2345 -DARG3=143
	$(RISCV-GCC) ./test-cases/main12-13.c f12.s -g -o test12-13-6 -DARG1=66242 -DARG2=-63636 -DARG3=63562
	$(RISCV-GCC) ./test-cases/main12-13.c f12.s -g -o test12-13-7 -DARG1=76426 -DARG2=24552 -DARG3=1543616
	$(RISCV-GCC) ./test-cases/main12-13.c f12.s -g -o test12-13-8 -DARG1=5425 -DARG2=342 -DARG3=72572
	$(RISCV-GCC) ./test-cases/main12-13.c f12.s -g -o test12-13-9 -DARG1=0 -DARG2=0 -DARG3=0
	
	$(RISCV-GCC) ./test-cases/main12-14.c f12.s -g -o test12-14-0 -DARG1=3 -DARG2=7 -DARG3=4
	$(RISCV-GCC) ./test-cases/main12-14.c f12.s -g -o test12-14-1 -DARG1=52 -DARG2=23 -DARG3=46
	$(RISCV-GCC) ./test-cases/main12-14.c f12.s -g -o test12-14-2 -DARG1=85 -DARG2=45 -DARG3=4
	$(RISCV-GCC) ./test-cases/main12-14.c f12.s -g -o test12-14-3 -DARG1=243 -DARG2=732 -DARG3=4946
	$(RISCV-GCC) ./test-cases/main12-14.c f12.s -g -o test12-14-4 -DARG1=542 -DARG2=636 -DARG3=342
	$(RISCV-GCC) ./test-cases/main12-14.c f12.s -g -o test12-14-5 -DARG1=5362 -DARG2=2345 -DARG3=143
	$(RISCV-GCC) ./test-cases/main12-14.c f12.s -g -o test12-14-6 -DARG1=66242 -DARG2=-63636 -DARG3=63562
	$(RISCV-GCC) ./test-cases/main12-14.c f12.s -g -o test12-14-7 -DARG1=76426 -DARG2=24552 -DARG3=1543616
	$(RISCV-GCC) ./test-cases/main12-14.c f12.s -g -o test12-14-8 -DARG1=5425 -DARG2=342 -DARG3=72572
	$(RISCV-GCC) ./test-cases/main12-14.c f12.s -g -o test12-14-9 -DARG1=0 -DARG2=0 -DARG3=0
	
	$(RISCV-GCC) ./test-cases/main12-15.c f12.s -g -o test12-15-0 -DARG1=3 -DARG2=7 -DARG3=4
	$(RISCV-GCC) ./test-cases/main12-15.c f12.s -g -o test12-15-1 -DARG1=52 -DARG2=23 -DARG3=46
	$(RISCV-GCC) ./test-cases/main12-15.c f12.s -g -o test12-15-2 -DARG1=85 -DARG2=45 -DARG3=4
	$(RISCV-GCC) ./test-cases/main12-15.c f12.s -g -o test12-15-3 -DARG1=243 -DARG2=732 -DARG3=4946
	$(RISCV-GCC) ./test-cases/main12-15.c f12.s -g -o test12-15-4 -DARG1=542 -DARG2=636 -DARG3=342
	$(RISCV-GCC) ./test-cases/main12-15.c f12.s -g -o test12-15-5 -DARG1=5362 -DARG2=2345 -DARG3=143
	$(RISCV-GCC) ./test-cases/main12-15.c f12.s -g -o test12-15-6 -DARG1=66242 -DARG2=-63636 -DARG3=63562
	$(RISCV-GCC) ./test-cases/main12-15.c f12.s -g -o test12-15-7 -DARG1=76426 -DARG2=24552 -DARG3=1543616
	$(RISCV-GCC) ./test-cases/main12-15.c f12.s -g -o test12-15-8 -DARG1=5425 -DARG2=342 -DARG3=72572
	$(RISCV-GCC) ./test-cases/main12-15.c f12.s -g -o test12-15-9 -DARG1=0 -DARG2=0 -DARG3=0
	
	$(RISCV-GCC) ./test-cases/main12-16.c f12.s -g -o test12-16-0 -DARG1=3 -DARG2=7 -DARG3=4
	$(RISCV-GCC) ./test-cases/main12-16.c f12.s -g -o test12-16-1 -DARG1=52 -DARG2=23 -DARG3=46
	$(RISCV-GCC) ./test-cases/main12-16.c f12.s -g -o test12-16-2 -DARG1=85 -DARG2=45 -DARG3=4
	$(RISCV-GCC) ./test-cases/main12-16.c f12.s -g -o test12-16-3 -DARG1=243 -DARG2=732 -DARG3=4946
	$(RISCV-GCC) ./test-cases/main12-16.c f12.s -g -o test12-16-4 -DARG1=542 -DARG2=636 -DARG3=342
	$(RISCV-GCC) ./test-cases/main12-16.c f12.s -g -o test12-16-5 -DARG1=5362 -DARG2=2345 -DARG3=143
	$(RISCV-GCC) ./test-cases/main12-16.c f12.s -g -o test12-16-6 -DARG1=66242 -DARG2=-63636 -DARG3=63562
	$(RISCV-GCC) ./test-cases/main12-16.c f12.s -g -o test12-16-7 -DARG1=76426 -DARG2=24552 -DARG3=1543616
	$(RISCV-GCC) ./test-cases/main12-16.c f12.s -g -o test12-16-8 -DARG1=5425 -DARG2=342 -DARG3=72572
	$(RISCV-GCC) ./test-cases/main12-16.c f12.s -g -o test12-16-9 -DARG1=0 -DARG2=0 -DARG3=0
	
	
all-tests: test1 test2 test3 test4 test5 test6 test7 test8 test9 test10 test11 test12
	
clean:
	rm -f f*.ll f*.s

clean-all:
	rm -f f*.ll f*.s test?-?-? test?-??-? test??-?-? test??-??-? gdb_output/gdb_output_test*

clean-output:
	rm -f gdb_output/gdb_output_test*
	
clean-results:
	rm -f test_results.txt unbalanced_test_results.txt

