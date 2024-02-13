
.data 
m: .space 4
n: .space 4
p: .space 4
n1: .space 4 
m1: .space 4
lineIndex: .space 4
colIndex: .space 4
matrix: .space 1600
matrix1: .space 1600
k: .space 4
x: .space 4
y: .space 4
formatScanf: .asciz "%d"
formatPrintf: .asciz "%d "
endl: .asciz "\n"
in_filename:    .asciz "in.txt"
out_filename:   .asciz "out.txt"
format_read:    .asciz "%d"
format_write:    .asciz "%d "
format_newline: .asciz "\n"
in_pointer: .space 4
out_pointer: .space 4
r: .asciz "r"
w: .asciz "w"
.text
.global main
main:
pushl %eax
pushl $r
pushl $in_filename
call fopen
addl $8, %esp
movl %eax, in_pointer 
popl %eax
pushl $m   
pushl $format_read 
pushl in_pointer 
call fscanf
addl $12, %esp
pushl $n   
pushl $format_read 
pushl in_pointer 
call fscanf
addl $12, %esp
pushl %eax
movl n, %eax
movl %eax, n1
movl m, %eax
movl %eax, m1
popl %eax
inc n1
inc m1
addl $2, n
addl $2, m
pushl $p  
pushl $format_read 
pushl in_pointer 
call fscanf
addl $12, %esp
mov $matrix, %edi
mov $matrix1, %esi
xor %ecx, %ecx
for_p:
 cmp p, %ecx
 je et_stari #modif sa mearga la modif stari
 push %ecx
 pushl $x   
 pushl $format_read 
 pushl in_pointer 
 call fscanf
 addl $12, %esp
 pop %ecx
 push %ecx
 pushl $y   
 pushl $format_read 
 pushl in_pointer 
 call fscanf
 addl $12, %esp
 pop %ecx
 inc x
 inc y
 movl x, %eax
 mull n
 addl y, %eax
 movl $1, (%edi, %eax, 4)
 inc %ecx
 jmp for_p
et_stari:
pushl $k   
pushl $format_read 
pushl in_pointer 
call fscanf
addl $12, %esp

 pushl in_pointer  
 call fclose
 addl $4, %esp
xor %ecx, %ecx
for:
 cmp k, %ecx
 je et_afis_matr
 pushl %ecx
et_clean_matr2: 
movl $0, lineIndex
for_lin: 
 movl lineIndex, %ebx
 cmp m,  %ebx
 je et_check_rules
 
 movl $0, colIndex
 for_cols:
   movl colIndex, %edx
   cmp n, %edx
   je cont_for_lin
   movl lineIndex, %eax
   mull n
   addl colIndex, %eax
   movl $0, (%esi, %eax, 4)
   inc colIndex
   jmp for_cols
 cont_for_lin:
 inc lineIndex
 jmp for_lin
et_check_rules:
movl $1, lineIndex
for_lines:
 movl lineIndex, %ebx
 cmp m1,  %ebx
 je et_next
 movl $1, colIndex
 for_columns:
   movl colIndex, %edx
   cmp n1, %edx
   je cont_for_lines
   
   
   xor %ecx, %ecx
   
   movl lineIndex, %eax
   mull n
   addl colIndex, %eax 
   sub $1, %eax
   addl (%edi, %eax, 4), %ecx 
   
   movl lineIndex, %eax
   mull n
   addl colIndex, %eax 
   inc %eax
   addl (%edi, %eax, 4), %ecx 
  
   movl lineIndex, %eax
   sub $1, %eax
   mull n
   addl colIndex, %eax 
   sub $1, %eax
   addl (%edi, %eax, 4), %ecx 
   movl lineIndex, %eax
   sub $1, %eax
   mull n
   addl colIndex, %eax
   addl (%edi, %eax, 4), %ecx
   
   movl lineIndex, %eax
   sub $1, %eax
   mull n
   addl colIndex, %eax
   add $1, %eax
   addl (%edi, %eax, 4), %ecx 
   movl lineIndex, %eax
   add $1, %eax
   mull n
   addl colIndex, %eax
   add $1, %eax
   addl (%edi, %eax, 4), %ecx 
   movl lineIndex, %eax
   add $1, %eax
   mull n
   addl colIndex, %eax
   addl (%edi, %eax, 4), %ecx 
   
   movl lineIndex, %eax
   add $1, %eax
   mull n
   addl colIndex, %eax
   sub $1, %eax
   addl (%edi, %eax, 4), %ecx 
   
   
   xor %ebx, %ebx 
   movl lineIndex, %eax
   mull n
   add colIndex, %eax
   movl (%edi, %eax, 4), %ebx
   
   cmp $1, %ebx
   jne comp_neg
   
   comp_poz:
   
     cmp $2, %ecx
     jl op1
     cmp $2, %ecx
     je op2
     cmp $3, %ecx
     je op2
     cmp $3, %ecx
     jg op1
   
   comp_neg:
   
     cmp $3, %ecx
     je op2
     cmp $3, %ecx
     jne op1
   
   
   op1:
   movl lineIndex, %eax
   mull n
   addl colIndex, %eax
   movl $0, (%esi, %eax, 4)
   jmp continue
   
   op2:
   movl lineIndex, %eax
   mull n
   addl colIndex, %eax
   movl $1, (%esi, %eax, 4)
   jmp continue
   continue:
   inc colIndex
   jmp for_columns
 cont_for_lines:
 inc lineIndex
 jmp for_lines
et_next:
movl $1, lineIndex 
for_lin1:
 movl lineIndex, %ebx
 cmp m1,  %ebx
 je et_out
 
 movl $1, colIndex 
 for_cols1:
   movl colIndex, %edx
   cmp n1, %edx
   je cont_for_l1
      
   movl lineIndex, %eax
   mull n
   addl colIndex, %eax
   
   movl (%esi, %eax, 4), %ebx
   movl %ebx, (%edi, %eax, 4)
   
   inc colIndex
   jmp for_cols1
 cont_for_l1:
 inc lineIndex
 jmp for_lin1

 
 et_out:
 popl %ecx
 
 inc %ecx
 jmp for



et_afis_matr:
pushl %eax
pushl $w
pushl $out_filename  
call fopen
addl $8, %esp
movl %eax, out_pointer 
popl %eax
 movl $1, lineIndex
 
 for_linesPrint: 
  mov lineIndex, %ecx
  cmp m1, %ecx
  je et_exit
  movl $1, colIndex
  
  for_columsPrint:
   mov colIndex, %ecx
   cmp n1, %ecx
   je cont_for_linesPrint
   
   movl lineIndex, %eax
   mull n
   add colIndex, %eax
   
   movl (%edi, %eax, 4), %ebx
    pushl %ebx    
    pushl $format_write  
    pushl out_pointer
    call fprintf
    addl $12, %esp
   
   inc colIndex 
   jmp for_columsPrint
   cont_for_linesPrint:
    pushl $format_newline  
    pushl out_pointer  
    call fprintf
    addl $8, %esp
    inc lineIndex
    jmp for_linesPrint
    
et_exit:
 pushl $format_newline  
 pushl out_pointer  
 call fprintf
 addl $8, %esp
 pushl $0   
 call fflush
 addl $4, %esp
    
 pushl out_pointer 
 call fclose
 addl $4, %esp
  movl $1, %eax
  movl $0, %ebx
  int $0x80
