#include <stdio.h>

// DFA states
typedef enum {
    Q0,  // Initial state
    Q1,  // State after reading '1'
    Q2,  // State after reading '11'
    Q3,  // State after reading '110' (Accepting state)
    Q4   // Dead state
} State;

// DFA transition function
State transition(State current, char input) {
    switch (current) {
        case Q0:
            return (input == '1') ? Q1 : Q0;
        case Q1:
            return (input == '1') ? Q2 : (input == '0' ? Q4 : Q0);
        case Q2:
            return (input == '0') ? Q3 : (input == '1' ? Q2 : Q4);
        case Q3:
            return Q4; // Dead state - stay in dead state regardless of input
        case Q4:
            return Q4; // Dead state - stay in dead state regardless of input
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
        printf("Accepted: String ends with '110'\n");
    } else {
        printf("Rejected: String does not end with '110'\n");
    }

    return 0;
}
