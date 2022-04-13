## Phases of a compiler
1. Lexical Analysis
2. Syntax Analysis
3. Semantic Analysis
4. Intermediate Code Generation
5. Target Code Generation
6. Code Optimization
7. Symbol Table Management
8. Error handling and Recovery

### Lexical Analysis
See whether we have got some valid word or not (called token)

- It removes cosmetics like white spaces, comments etc
- It will also expand user-defined macros
- reports presence of foreign words
- may perform case conversion (idk)
- It generates a sequence of integers (tokens) to be passed to the syntax and latex phases

### Syntax analysis
Grammatical check

- Takes words/tokens from lexical analyzer
- works hand-in-hand with lexical analyzer
- check syntactic correctness
This can be thought like
there is an if else statement, then there should be else keyword
- constructs a parse tree
example x = y + z * r
then x can be written as operations on expressions
- Error messages for syntactically incorrect program.


### Semantic Analysis
Whether or not a variable has been defined

- Semantics of a prgram is dependent on the language
- A common check is for types of variables and expression
- Applicability of operator to operands
- Scope rules of the language are applied to data types - static scope and dynamic scope

### Intermediate Code Generation
- Optional towards target code generation
- Code corresponding to input source language program is generated in terms of some hypothetical machine instructions
- Helps to retarget the code form one processor to another
- Simple language supported by most of the contemporary processors
- Powerful enough to express programming language constructs

---------------
Source program
	|
various phases of compilers
	|
Intermediate code generations
	|
Intermediate code
          |
     /	        \
Code 	     Code generation	
generation   machine # 2
machine #1

### target code generation
- Uses template substitution from intermediate code
- Predefined target language templates are used to generate final code
- Machine instructions, addressing mode, CPU registers play vital roles
- Temporary varibales (user defined and compiler generated) are packed into CPU registers

