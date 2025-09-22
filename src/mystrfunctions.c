// File: src/mystrfunctions.c
#include "../include/mystrfunctions.h"

/* Return length of string (not counting null) */
int mystrlen(const char* s) {
    int i = 0;
    if (!s) return 0;
    while (s[i] != '\0') i++;
    return i;
}

/* Copy src to dest, ensure null-terminated. Return number of chars copied. */
int mystrcpy(char* dest, const char* src) {
    if (!dest || !src) return -1;
    int i = 0;
    while (src[i] != '\0') {
        dest[i] = src[i];
        i++;
    }
    dest[i] = '\0';
    return i;
}

/* Copy up to n characters from src to dest, ensure null-terminated. Return chars copied. */
int mystrncpy(char* dest, const char* src, int n) {
    if (!dest || !src || n <= 0) return -1;
    int i = 0;
    while (i < n && src[i] != '\0') {
        dest[i] = src[i];
        i++;
    }
    dest[i] = '\0';
    return i;
}

/* Append src to the end of dest. Return new total length. */
int mystrcat(char* dest, const char* src) {
    if (!dest || !src) return -1;
    int d = mystrlen(dest);
    int i = 0;
    while (src[i] != '\0') {
        dest[d + i] = src[i];
        i++;
    }
    dest[d + i] = '\0';
    return d + i;
}
