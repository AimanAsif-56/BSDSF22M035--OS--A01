// File: src/main.c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../include/mystrfunctions.h"
#include "../include/myfilefunctions.h"

int main() {
    printf("--- Testing String Functions ---\n");
    char a[100]="Hello", b[100]="World";
    printf("mystrlen('%s') = %d\n", a, mystrlen(a));
    mystrcpy(a,b);
    printf("After mystrcpy: %s\n", a);
    mystrncpy(a,"OpenAI",4);
    printf("After mystrncpy: %s\n", a);
    mystrcat(a," Rocks!");
    printf("After mystrcat: %s\n", a);

    printf("\n--- Testing File Functions ---\n");
    FILE* f=fopen("test.txt","w");
    fprintf(f,"This is a test\nSecond line test\nAnother one\n");
    fclose(f);

    f=fopen("test.txt","r");
    int lines,words,chars;
    wordCount(f,&lines,&words,&chars);
    printf("Lines=%d, Words=%d, Chars=%d\n",lines,words,chars);

    char** matches;
    int m=mygrep(f,"test",&matches);
    printf("Found %d matches:\n",m);
    for(int i=0;i<m;i++) {
        printf("%s",matches[i]);
        free(matches[i]);
    }
    free(matches);
    fclose(f);

    return 0;
}
