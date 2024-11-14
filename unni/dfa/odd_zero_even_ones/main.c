#include <stdio.h>

// DFA states
typedef enum {
    Q0,  // Initial state
    Q1,  // Odd number of zeros
    Q2,  // Even number of ones
    Q3   // Odd number of zeros and even number of ones
} State;

// DFA transition function
State transition(State current, char input) {
    switch (current) {
        case Q0:
            return (input == '0') ? Q3 : Q1;
        case Q1:
            return (input == '0') ? Q2 : Q0;
        case Q2:
            return (input == '1') ? Q3 : Q1;
        case Q3:
            return (input == '1') ? Q2 : Q0;
        default:
            return Q0; // Default to the initial state
    }
}

// DFA main function
int main() {
    State current_state = Q0;
    char input_string[100];

    printf("Enter the input string (0s and 1s): ");
    scanf("%s", input_string);

    for (int i = 0; input_string[i] != '\0'; ++i) {
        current_state = transition(current_state, input_string[i]);
    }

    // Check the final state
    if (current_state == Q3) {
        printf("Accepted: Odd number of zeros and even number of ones\n");
    } else {
        printf("Rejected: Not satisfying the conditions\n");
    }

    return 0;
}
