# YACC Program

How to compile

```
bison -d parser.y
flex lexer.l
gcc -o parser parser.tab.c lex.yy.c -ll
```