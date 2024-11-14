#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

enum TokenType {
    KEYWORD,
    OPERATOR,
    IDENTIFIER
};

struct Token {
    char *value;
    enum TokenType type;
};

int isKeyword(char buffer[]) {
    char keywords[32][10] = {
        "auto", "break", "case", "char", "const", "continue", "default",
        "if", "int", "long", "register", "return", "short", "signed", "sizeof",
        "static", "struct", "switch", "typedef", "union",
        "do", "double", "else", "enum", "extern", "float", "for", "goto",
        "unsigned", "void", "volatile", "while"
    };

    int i;
    for (i = 0; i < 32; ++i) {
        if (strcmp(keywords[i], buffer) == 0) {
            return 1; // It's a keyword
        }
    }
    return 0; // Not a keyword
}

struct Token getNextToken(FILE *fp) {
    char ch, buffer[15], operators[] = "+-*/%=";
    int i, j = 0;
    struct Token token;

    while ((ch = fgetc(fp)) != EOF) {
        if (ch == ' ' || ch == '\t' || ch == '\n') {
            if (j == 0) {
                continue; // Skip whitespace
            } else {
                buffer[j] = '\0'; // End of token
                j = 0;
                if (isKeyword(buffer) == 1) {
                    token.type = KEYWORD;
                } else if (strchr(operators, ch) != NULL) {
                    token.type = OPERATOR;
                } else {
                    token.type = IDENTIFIER;
                }
                token.value = strdup(buffer); // Return a dynamically allocated copy of the token
                return token;
            }
        } else if (strchr(operators, ch) != NULL) {
            buffer[j++] = ch;
            buffer[j] = '\0';
            token.type = OPERATOR;
            token.value = strdup(buffer); // Return a dynamically allocated copy of the token
            return token;
        } else if (isalnum(ch)) {
            buffer[j++] = ch;
        }
    }

    if (j > 0) {
        buffer[j] = '\0';
        token.type = IDENTIFIER;
        token.value = strdup(buffer); // Return the last token if any
        return token;
    }

    // No more tokens
    token.type = IDENTIFIER; // You can set this to a default type or customize as needed
    token.value = NULL;
    return token;
}

int main() {
    FILE *fp = fopen("input.txt", "r");

    if (fp == NULL) {
        printf("Error while opening the file\n");
        exit(1);
    }

    struct Token token;
    while ((token = getNextToken(fp)).value != NULL) {
        if (token.type == KEYWORD) {
            printf("Keyword: %s\n", token.value);
        } else if (token.type == OPERATOR) {
            printf("Operator: %s\n", token.value);
        } else if (token.type == IDENTIFIER) {
            printf("Identifier: %s\n", token.value);
        }
        free(token.value); // Free dynamically allocated memory for the token
    }

    fclose(fp);

    return 0;
}
