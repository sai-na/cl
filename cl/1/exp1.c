#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

// Function to check if a word is a keyword
int isKeyword(char *word) {
    char *keywords[] = {"auto","break","case","char","const","continue","default",
                        "do","double","else","enum","extern","float","for","goto",
                        "if","int","long","register","return","short","signed",
                        "sizeof","static","struct","switch","typedef","union",
                        "unsigned","void","volatile","while"};
    for (int i = 0; i < 32; i++) {
        if (strcmp(keywords[i], word) == 0) return 1;
    }
    return 0;
}

int main() {
    char ch, buffer[20];
    int j = 0;
    FILE *fp = fopen("exp1.txt", "r");
    
    if (!fp) {
        printf("Error opening file\n");
        return 1;
    }

    // Read file character by character
    while ((ch = fgetc(fp)) != EOF) {
        // Check if character is an operator
        if (strchr("+-*/%=", ch)) {
            printf("%c is operator\n", ch);
        }
        // Build a word (identifier/keyword)
        else if (isalnum(ch)) {
            buffer[j++] = ch;
        } 
        // Check the word when space or newline is encountered
        else if ((ch == ' ' || ch == '\n') && j != 0) {
            buffer[j] = '\0'; // Null-terminate the string
            j = 0; // Reset buffer index
            if (isKeyword(buffer)) {
                printf("%s is keyword\n", buffer);
            } else {
                printf("%s is identifier\n", buffer);
            }
        }
    }
    
    fclose(fp);
    return 0;
}

