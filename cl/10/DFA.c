#include <stdio.h>
#include <string.h>

typedef struct {
    int nos, noi, nof;
    int delta[10][10];
    int final[10];
    char inputSymbols[10];
} DFA;

int getSymbolIndex(char ch, DFA d) {
    for (int i = 0; i < d.noi; i++)
        if (ch == d.inputSymbols[i])
            return i;
    return -1;
}

int isFinalState(int state, DFA d) {
    for (int i = 0; i < d.nof; i++)
        if (state == d.final[i])
            return 1;
    return 0;
}

int main() {
    DFA d;
    printf("Enter no of states, final states, and input symbols: ");
    scanf("%d %d %d", &d.nos, &d.nof, &d.noi);

    printf("Enter input symbols: ");
    for (int i = 0; i < d.noi; i++)
        scanf(" %c", &d.inputSymbols[i]);

    printf("Enter final states: ");
    for (int i = 0; i < d.nof; i++)
        scanf("%d", &d.final[i]);

    printf("Enter transition table:\n");
    for (int i = 0; i < d.nos; i++)
        for (int j = 0; j < d.noi; j++) {
            printf("δ(q%d, %c) = ", i, d.inputSymbols[j]);
            scanf("%d", &d.delta[i][j]);
        }

    // Print transition table
    printf("\nTransition Table:\n");
    for (int i = 0; i < d.noi; i++)
        printf("\t%c", d.inputSymbols[i]);
    printf("\n");
    for (int i = 0; i < d.nos; i++) {
        printf("q%d", i);
        for (int j = 0; j < d.noi; j++)
            printf("\t%d", d.delta[i][j]);
        printf("\n");
    }

    // DFA String Validation
    char string[20];
    while (1) {
        printf("\nEnter a string: ");
        scanf("%s", string);

        int state = 0, valid = 1;
        for (int i = 0; i < strlen(string); i++) {
            int idx = getSymbolIndex(string[i], d);
            if (idx == -1) {
                valid = 0;
                break;
            }
            state = d.delta[state][idx];
        }
        if (valid && isFinalState(state, d))
            printf("%s is accepted.\n", string);
        else
            printf("%s is not accepted.\n", string);
    }
    return 0;
}

