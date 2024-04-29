# RUST COMPILER

## ABOUT

> This project built for a class group assignment for compiler design 4th year 1st semester.
> for rust programming language using `YACC` AND `BISON`.

## HOW TO RUN THIS PROJECT

> first install `bison` and `yacc` depending on your operating system
>
> Then run the following commads

- Running This command will result in `y.tab.c` & `y.tab.h`

```sh
yacc -dy parser.y
```

- Running This command will result in `lex.yy.c`

```
lex scanner.l
```

- Running This command will result in `a.out` in ubuntu or `a.exe` on windows

```
cc lex.yy.c y.tab.c
```

- Then run tha executable file with an input `rust.rs`

```
./a.out rust.rs
```

### SYMBOL TABLE

<img src="/rust compiler symbol table.png" />
