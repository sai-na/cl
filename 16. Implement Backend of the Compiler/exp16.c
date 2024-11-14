#include<stdio.h>

#include<string.h>

void main() {
        char icode[10][30], str[20], opr[10];
        int i = 0;
        printf("\nEnter the set of intermediate code(Type exit to terminate)\n");
        do {
                scanf("%s", icode[i]);
        }
        while (strcmp(icode[i++], "exit") != 0);
        printf("\nTarget code generation");
        printf("\n*******************");
        i = 0;
        do {
                strcpy(str, icode[i]);
                switch (str[3]) {
                case '+':
                        strcpy(opr, "ADD");
                        break;
                case '-':
                        strcpy(opr, "SUB");
                        break;
                case '*':
                        strcpy(opr, "MUL");
                        break;
                case '/':
                        strcpy(opr, "DIV");
                        break;
                }
                printf("\n\tMOV %c, R%d", str[2], i);
                printf("\n\t%s %c, R%d", opr, str[4], i);
                printf("\n\tMOV R%d, %c", i, str[0]);
        } while (strcmp(icode[++i], "exit") != 0);
        
        printf("\n");
}




// Enter the set of intermediate code(terminated by 
// exit):
//  x=a+b
//  y=x-c
//  z=y*d
//  p=z/e
//  exit
//  Target code generation
//  *****************************
//  Mov a , R0
//  ADD b,R0
//  Mov R0,x
//  Mov x , R1
//  SUB c,R1
//  Mov R1,y
//  Mov y , R2
//  MUL d,R2
//  Mov R2,z
//  Mov z , R3
//  DIV e,R3
//  Mov R3,p