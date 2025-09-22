// File: src/myfilefunctions.c
#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "../include/myfilefunctions.h"

/* Count lines, words and characters in file. Return 0 on success. */
int wordCount(FILE* file, int* lines, int* words, int* chars) {
    if (!file || !lines || !words || !chars) return -1;
    rewind(file);
    int c, l=0, w=0, ch=0, inword=0;
    while ((c=fgetc(file))!=EOF) {
        ch++;
        if (c=='\n') l++;
        if (isspace(c)) { if (inword) { w++; inword=0; } }
        else inword=1;
    }
    if (inword) w++;
    *lines=l; *words=w; *chars=ch;
    rewind(file);
    return 0;
}

/* Search lines containing search_str and return an array of matched lines.
   Caller must free each string and the matches array. Returns count or -1. */
int mygrep(FILE* fp, const char* search_str, char*** matches) {
    if (!fp || !search_str || !matches) return -1;
    rewind(fp);
    size_t cap=5, count=0;
    char **arr=malloc(cap*sizeof(char*));
    char line[256];
    while (fgets(line,sizeof(line),fp)) {
        if (strstr(line,search_str)) {
            if (count>=cap) {
                cap*=2;
                arr=realloc(arr,cap*sizeof(char*));
            }
            arr[count]=strdup(line);
            count++;
        }
    }
    *matches=arr;
    rewind(fp);
    return count;
}
