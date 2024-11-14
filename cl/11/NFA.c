#include <stdio.h>

#define MAX_TRANSITIONS 10
#define MAX_STATES 10

typedef struct Transition {
    int state;
    char symbol;
    int nextState;
} T;

void epsilonClosure(int state, T transitions[], int visited[], int not) {
    visited[state] = 1;
    printf("q%d, ",state);
    for(int i=0;i<not;i++) {
        if(transitions[i].state == state && transitions[i].symbol == 'e') {
            int nextState = transitions[i].nextState;
            if(visited[nextState] == 0) {
                epsilonClosure(nextState, transitions, visited, not);
            }
        }
    }
}



int main() {
    int nos;
    printf("Enter the no. of states: ");
    scanf("%d",&nos);

    T transitions[MAX_TRANSITIONS];

    int not;
    printf("Enter the no. of transitions: ");
    scanf("%d",&not);

    for(int i=0;i<not;i++) {
        printf("Enter the state, symbol and next state for transition %d: ",i+1);
        scanf("%d %c %d",&transitions[i].state,&transitions[i].symbol,&transitions[i].nextState);
    }

    for(int i=0;i<nos;i++) {
        int visited[MAX_STATES] = {0};

        printf("E-closure(q%d) = {", i);
        epsilonClosure(i, transitions, visited, nos);
        printf("}\n");

    }


}
