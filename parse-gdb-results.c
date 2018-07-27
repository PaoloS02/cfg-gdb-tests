#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <ctype.h>

#define OUTPUT_FILE "test_results.txt"

enum test_instances{
	TEST1 = 2,
	TEST2 = 2,
	TEST3 = 2,
	TEST4 = 2,
	TEST5 = 2,
	TEST6 = 2,
	TEST7 = 2,
	TEST8 = 4,
	TEST9 = 4,
	TEST10 = 4,
	TEST11 = 8,
	TEST12 = 16,
};

//int inst_num[12] = {2,2,2,2,2,2,2,4,4,4,8,16};
int inst_num[12] = 
{
	TEST1,
	TEST2,
	TEST3,
	TEST4,
	TEST5,
	TEST6,
	TEST7,
	TEST8,
	TEST9,
	TEST10,
	TEST11,
	TEST12
};


bool check_line(char *line) {
	int i = 0;
	for(i=0; i<strlen(line)-1; i++){
		if(isalpha(line[i])){
			return false;
		}
	}
	return true;
}

void parse_test(int test, int inst, FILE* fout) {
	FILE* fin;
	char line[100];
	//char tail[5] = {".text\0"};
	char filename[50];
	sprintf(filename, "./gdb_output/gdb_output_test%d-%d.txt", test, inst);
	//char *filename = strcat("gdb_output_test", )
	fin = fopen(filename, "r");
	int couple = 0;
	int cycles[2];
	
	fprintf(fout, "test%d-%d:\t", test, inst);
	while(fgets(line, sizeof(line), fin) != NULL) {
		if(check_line(line) && line[0] != '\n'){
		//if(atoi(line) != 0 && strlen(line) < 10){
			cycles[couple] = atoi(line);
			if(couple == 0){
				couple = 1;
			}else if(couple == 1) {
				couple = 0;
				fprintf(fout, "%d ", cycles[1]-cycles[0]);
			}
		}
	}
	fprintf(fout, "\n");
	fclose(fin);
}


int main() {
	int test = 1;
	int inst = 0;
	//enum test_instances 
	FILE* fout = fopen(OUTPUT_FILE,"a");
	
	for(test = 1; test <= 12; test++) {
		for(inst = 0; inst < inst_num[test-1]; inst++) {
			/*if(test == 1 && inst == 1)
				fout = fopen(OUTPUT_FILE,"w");
			else
				fout = fopen(OUTPUT_FILE,"a");
			*/	
			parse_test(test, inst+1, fout);
		}
		fprintf(fout, "\n\n");
	}
	
	fclose(fout);
	
	return 0;
}
