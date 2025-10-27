# 🔤 Practical 3: Count Number of Words Starting with 'A'

**By:** Suhani Gahukar (PRN: 22070521084)  
**Course:** Compiler Construction Lab (T7478)  
**Department:** Computer Science, Symbiosis Institute of Technology  

---

## 🎯 Aim:

To write a **LEX program** that reads a given text and counts the number of **words that start with the letter 'A'** or 'a'.

---

## 📚 Theory:

In compiler design, lexical analysis is the phase where the source code is divided into tokens using pattern recognition. **LEX** (Lexical Analyzer Generator) helps automate this phase by generating C code that recognizes patterns using **regular expressions**.

### 🔹 Key Concepts:

- **Words**: A word is a sequence of characters grouped together, usually separated by whitespace or punctuation.
- **Pattern Matching**: In this practical, we use LEX to match words that **start with 'A' or 'a'**.
- **Regular Expressions**: The pattern `[aA][a-zA-Z]*` matches any word that starts with 'A' or 'a' followed by any alphabet characters.

### 🔹 Sample Rule in LEX:
```lex
[aA][a-zA-Z]*    { count++; }
```

This rule increments the count whenever a word starting with 'A' or 'a' is detected.

---

## ✅ Conclusion:

- Successfully implemented a LEX program to count all words beginning with the letter **'A'** or **'a'**.
- Understood how regular expressions are used for pattern recognition in lexical analysis.
- Practiced developing simple lexical analyzers for token-based word analysis.

---
