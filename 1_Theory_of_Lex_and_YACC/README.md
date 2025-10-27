# Practical 1: Introduction to LEX and YACC

**By:** Suhani Gahukar (PRN: 22070521084)  
**Course:** Compiler Construction Lab (T7478)  
**Department:** Computer Science, Symbiosis Institute of Technology  

---

## Aim
To study and write a theoretical assignment explaining the **structure, purpose**, and **working** of **LEX** and **YACC** compilers.

---

## Theory

### 🔹 LEX (Lexical Analyzer Generator)
- LEX is a tool used to generate **lexical analyzers**, also known as **scanners** or **tokenizers**.  
- It reads **input patterns** (tokens like keywords, identifiers, etc.) using **regular expressions** and converts them into **C code**.  
- These patterns are then matched against the input stream to produce **tokens** for the parser.

---

### 🔹 YACC (Yet Another Compiler Compiler)
- YACC is a **parser generator** that takes a **grammar specification** for a language (usually written in **BNF format**) and produces source code for the **parser**.  
- It typically works alongside LEX — where **LEX handles the tokenizing** and **YACC handles the syntax analysis**.

---

### 🔹 LEX and YACC Integration
Together, LEX and YACC form a **compiler construction pipeline**:
- LEX → breaks down input into tokens.
- YACC → arranges these tokens as per defined grammar rules.

###🔹 Structure of a LEX Program:
```c
%{
  // C declarations
%}
%%
  // Rules
%%
  // C main function

###🔹 Structure of a LEX Program:
```c
%{
  // C declarations and header files
%}
%token IDENTIFIER NUMBER
%%
  // Grammar rules
%%
  // C code

### 🔹 Conclusion:
- Gained an understanding of how LEX and YACC automate the process of lexical and syntax analysis in compiler design.
- Understood how to define tokens and grammar rules, and how they interact during compilation.
- Learned that combining LEX and YACC simplifies the development of interpreters and compilers.

### 🖼️ Screenshots

#### 🔹 Code
![Code Screenshot](home\suhami\CC\1_Theory_of_Lex_and_YACC\Screenshots\main.png)

#### 🔹 Output
![Output Screenshot](home\suhami\CC\1_Theory_of_Lex_and_YACC\Screenshots\output.png)
