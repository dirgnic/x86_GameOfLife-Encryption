

# x86_GameOfLife-Encryption

## Introduction
This assembly program is written in x86 architecture using AT&T syntax. It demonstrates the implementation of operations related to matrix manipulations and binary string handling, leveraging system calls and file I/O operations. The program is designed for a Computer Systems Architecture lab to demonstrate knowledge of assembly language, matrix operations, and memory management.

## Files
1. **in.txt**: The input file that contains matrix dimensions and data required for the operations.
2. **out.txt**: The output file where the results of matrix operations are stored.
3. **main.asm**: The assembly source code that implements the main functionality of the program.

## Data Structures
- **Matrix**: A matrix is stored in memory in a linear fashion. The program supports operations on multiple matrices, such as copying, setting elements, and performing binary operations on the matrix contents.
- **Binary Vectors**: The binary vectors extracted from strings are stored and manipulated in the program to demonstrate XOR operations and conversions between different formats.

## Key Features
### Matrix Operations
- The program reads two matrix dimensions, `m` and `n`, from the input.
- It populates a matrix using input values and performs several operations on it based on conditions. The second script performs encription and decription based on keys.
- The program also supports incrementing the matrix dimensions and manipulating matrix elements in different scenarios.
  
### String Handling and XOR Operations
- The program reads a string from user input, converts it into its binary representation, and performs XOR operations on the binary data with the matrix elements.
- Hexadecimal strings are also supported, which are converted to binary for further processing.
  
### File Input/Output
- The program reads initial matrix dimensions and matrix data from the `in.txt` file and writes the final matrix and results to the `out.txt` file.

## How It Works
1. **Matrix Initialization**: 
   - The matrix is initialized based on the dimensions `m` and `n` provided by the user.
   - The input matrices are populated using the values read from the `in.txt` file.
   
2. **Binary String Manipulation**: 
   - After initializing the matrices, the program reads a binary string, converts it to binary or hexadecimal, and performs XOR operations with matrix data.
   
3. **Matrix Updating**: 
   - The program repeatedly updates the matrix contents based on XOR results and predefined rules for incrementing/decrementing matrix elements.
   
4. **File Writing**: 
   - The resulting matrix is printed to `out.txt`.

## Instructions to Run
1. Assemble the program using `as` or any assembler for the x86 architecture.
   ```bash
   as -o main.o main.s
   ```
2. Link the object file to create an executable:
   ```bash
   ld -o main main.o
   ```
3. Ensure `in.txt` is in the same directory as the executable with valid matrix data.
4. Run the program:
   ```bash
   ./main
   ```
5. Check `out.txt` for the program's output.

## Input Format
- The input file (`in.txt`) must follow a specific format:
  1. First, the matrix dimensions `m` and `n`.
  2. Then, the number of matrix elements to be read.
  3. Subsequent lines contain matrix data.

Example `in.txt`:
```
3 3
4
1 2
2 3
3 1
```

## Output
The output will be stored in `out.txt`, containing the final state of the matrix after performing the required operations.

