
.data 
m: .space 4
n: .space 4
p: .space 4
o: .space 4
n1: .space 4 
m1: .space 4
dim: .long 30 
lineIndex: .space 4
colIndex: .space 4
matrix: .space 1600 
matrix1: .space 1600
k: .space 4
x: .space 4
y: .space 4
formatScanf: .asciz "%d"
formatString: .asciz "%s"
formatPrintf: .asciz "%d"
endl: .asciz "\n"
string: .space 32 
stringHex:    .space 32 
mBin: .space 400 
i: .space 4
j: .space 4 
count: .space 4 
cat: .space 4 
res: .space 4 
lenStr: .space 4
lenStrH: .space 4
lenBin: .space 4
mesajFin: .space 30 
lungMesajFin: .space 4 
    
.text
.global main 
main:
push $m 
push $formatScanf
call scanf
add $8, %esp
push $n 
push $formatScanf
call scanf
add $8, %esp
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
push %eax
movl n, %eax
mull m
movl %eax, dim
popl %eax
push $p
push $formatScanf
call scanf
add $8, %esp
lea matrix, %edi
lea matrix1, %esi
xor %ecx, %ecx
for_p:
 cmp p, %ecx
 je et_stari 
 push %ecx
 push $x
 push $formatScanf
 call scanf
 add $8, %esp
 pop %ecx
 push %ecx
 push $y
 push $formatScanf
 call scanf
 add $8, %esp
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
push $k
push $formatScanf
call scanf
add $8, %esp
 push $o
 push $formatScanf
 call scanf
 add $8, %esp
pushl %eax
pushl %ebx
pushl %ecx
pushl %edx
    movl $0, lenStr 
     citire_str:
             push $string
 push $formatString
 call scanf
 add $8, %esp
                
popl %edx
popl %ecx
popl %ebx
popl %eax
xor %ecx, %ecx
for:
 cmp k, %ecx
 je et_sir
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
 # 
 et_out:
 popl %ecx
 
 inc %ecx
 jmp for
et_sir:
 movl $0, lineIndex
et_cerinta2_verif:
pushl %ecx
movl $100000, %ecx  
pauza_for0:
    pause            
    loop pauza_for0
popl %ecx
  movl o, %ecx
  cmp $1, %ecx
  je case1
  movl o, %ecx
  cmp $0, %ecx
  je case0
  case0: 
          
            xor %eax, %eax
            xor %ebx, %ebx
            xor %edx, %edx
            xor %ecx, %ecx
            movl $0, lenStr 
        dupa_citire_str:
         
           
            xor %ecx, %ecx          
            lea string, %edi  
        
        end_input:
            movb (%edi, %ecx, 1), %al
            cmp $0xa, %al           
            je next_aloc          
            cmp $0, %al           
            je next_aloc          
            inc %ecx                
            jmp end_input
            
        next_aloc:
            
            movl %ecx, lenStr 
            lea string, %edi  
            lea mBin, %esi 
            xor %ecx, %ecx
            movl $0, lenBin 
        print_loop:
            push %ecx
            movb (%edi, %ecx, 1), %al    
            cmp $0, %al                 
            je next                    
            cmp $0xa, %al          
            je next         
          
            movzb %al, %eax   
            
            movl $0, i
            make_vector:
              movl i, %ebx
              cmp $8, %ebx
              je cont
              
              cont_op:
              push %eax
              
              and $1, %eax     
            
            
              movl lenBin, %ebx
              addl $7, %ebx
              subl i, %ebx    
              
            
              movl %eax, (%esi, %ebx, 4);
              
              pop %eax
              shr $1, %eax    
              inc i
              jmp make_vector
            
        cont:
            
            pop %ecx
            inc %ecx                     
            addl $8, lenBin
            jmp print_loop              
            
        next: 
        
          jmp make_xor 
        
        make_xor: 
        lea mBin, %esi 
        lea matrix, %edi  
        movl lenBin, %ebx 
        cmp %ebx, dim
        jl caseSmall
        caseEqBig:
        movl $0, i
        for_c1:
            movl i, %ecx
            cmp lenBin, %ecx
            je cont_xor 
            pushl %ecx
            pushl %eax
            push %ebx
            movl (%edi, %ecx, 4), %eax 
            movl (%esi, %ecx, 4), %ebx 
            XOR %eax, %ebx
            movl %ebx, (%esi, %ecx, 4)
            popl %ebx
            popl %eax
            popl %ecx
            inc i
            jmp for_c1
        caseSmall:
        pushl %eax
        pushl %edx
        xor %edx, %edx
        movl lenBin, %eax
        divl dim
        movl %eax, cat
        movl %edx, res
        popl %edx
        popl %eax
        movl $0, count
        for_count2:
            movl count, %ecx
            cmp cat, %ecx
            je rest2
            movl $0, i
            for_c2:
                movl i, %ecx
                cmp dim, %ecx
                je cont_for_count2
                pushl %ecx
                pushl %eax
                pushl %ebx
                pushl %edx
                
                movl count, %eax 
                mull dim 
                movl %eax, %edx 
                addl i, %edx 
                movl i, %ecx
                movl (%edi, %ecx, 4), %eax 
                movl (%esi, %edx, 4), %ebx 
                XOR %eax, %ebx
                movl %ebx, (%esi, %edx, 4)
                popl %edx
                popl %ebx
                popl %eax
                popl %ecx
                inc i
                jmp for_c2
            cont_for_count2:
            inc count
            jmp for_count2
        rest2:
          movl $0, i
          for_rest2:
                movl i, %ecx
                cmp res, %ecx
                je cont_xor
                pushl %ecx
                pushl %eax
                pushl %ebx
                pushl %edx
                
                movl cat, %eax
                mull dim
                movl %eax, %edx 
                addl i, %edx 
                movl i, %ecx
                movl (%edi, %ecx, 4), %eax 
                movl (%esi, %edx, 4), %ebx 
                XOR %eax, %ebx
                movl %ebx, (%esi, %edx, 4)
                popl %edx
                popl %ebx
                popl %eax
                popl %ecx
                inc i
                jmp for_rest2
        cont_xor:
          
       
              jmp make_message
        make_message:
        lea mBin, %esi 
        lea mesajFin, %edi  
        movl $2, lungMesajFin
        pushl %ebx
        xor %ebx, %ebx
        movl  $48, (%edi, %ebx, 1)
        incl %ebx
        movl  $120, (%edi, %ebx, 1)
        popl %ebx
        
        movl $0, i
        for_make_fin:
            movl i, %ecx
            cmp lenBin, %ecx
            jge print_make_fin
            
            xor %eax, %eax
            xor %edx, %edx
            
            pushl %ebx
            movl i, %ebx
            movl %ebx, j
            popl %ebx
            for_every_ch:
              pushl %ecx
              pushl %eax
              movl i, %eax
              addl $4, %eax
              movl j, %ecx
              cmp %eax, %ecx
              jge cont_for_make_fin
              movl %edx, %eax
              pushl %ebx
              movl $2, %ebx
              mull %ebx
              popl %ebx
              movl %eax, %edx
              addl (%esi, %ecx, 4), %edx
              popl %eax
              popl %ecx
              incl j
              jmp for_every_ch
              
          cont_for_make_fin:
          pushl %ebx
          movl lungMesajFin, %ebx 
          cmp $10, %edx
          jge lit_mare
          numar:
          addl $48, %edx 
          jmp cont_cu_decifare
          lit_mare:
          addl $55, %edx 
          cont_cu_decifare:
          movl %edx, (%edi, %ebx, 1)
          incl lungMesajFin
          addl $4, i
          popl %ebx
          jmp for_make_fin
        print_make_fin:
   
            movl lungMesajFin, %ebx 
            movl $0, (%edi, %ebx, 1)
            inc lungMesajFin 
            
            movl $4, %eax           
            movl $1, %ebx           
            lea mesajFin, %ecx        
            movl lungMesajFin, %edx         
            int $0x80               
            jmp et_exit
  case1: 
            xor %eax, %eax
            xor %ebx, %ebx
            xor %edx, %edx
            xor %ecx, %ecx
            movl $0, lenStrH 
        dupa_HEXcitire_str:
        
            
            xor %ecx, %ecx          
            lea string, %edi  
        
        HEXend_input:
            movb (%edi, %ecx, 1), %al
            cmp $0xa, %al           
            je HEXnext_aloc          
            cmp $0, %al           
            je HEXnext_aloc          
            inc %ecx               
            jmp HEXend_input
            
        HEXnext_aloc:
            
            movl %ecx, lenStrH 
            lea string, %edi  
            lea mBin, %esi 
            xor %ecx, %ecx
            addl $2, %ecx 
            movl $0, lenBin 
        HEXprint_loop:
            push %ecx
            movb (%edi, %ecx, 1), %al    
            
            cmp $0, %al                 
            je HEXnext                     
            cmp $0xa, %al          
            je HEXnext          
        
            movzb %al, %eax   
            
            movl $0, i
            HEXmake_vector:
            movl i, %ebx
            cmp $4, %ebx
            je HEXcont
            
            movl %eax, %edx 
            shr $6, %edx 
            and $1, %edx 
            cmp $1, %edx
            jne HEXcont_op
            subl $55, %eax 
            
            HEXcont_op:
            push %eax
            
            and $1, %eax     
            
            
            movl lenBin, %ebx
            addl $3, %ebx
            subl i, %ebx    
            
            
            movl %eax, (%esi, %ebx, 4);
            
            pop %eax
            shr $1, %eax    
            inc i
            jmp HEXmake_vector
            
        HEXcont:
            
            pop %ecx
            inc %ecx                      
            addl $4, lenBin
            jmp HEXprint_loop               
            
        HEXnext:
       
        jmp HEXmake_xor 
        
        HEXmake_xor: 
        lea mBin, %esi 
        lea matrix, %edi  
      
        movl lenBin, %ebx 
        cmp %ebx, dim
        jl HEXcaseSmall
        HEXcaseEqBig:
        movl $0, i
        HEXfor_c1:
            movl i, %ecx
            cmp lenBin, %ecx
            je HEXcont_xor 
            pushl %ecx
            pushl %eax
            push %ebx
            movl (%edi, %ecx, 4), %eax 
            movl (%esi, %ecx, 4), %ebx 
            XOR %eax, %ebx
            movl %ebx, (%esi, %ecx, 4)
            popl %ebx
            popl %eax
            popl %ecx
            inc i
            jmp HEXfor_c1
        HEXcaseSmall:
        pushl %eax
        pushl %edx
        xor %edx, %edx
        movl lenBin, %eax
        divl dim
        movl %eax, cat
        movl %edx, res
        popl %edx
        popl %eax
        movl $0, count
        HEXfor_count2:
            movl count, %ecx
            cmp cat, %ecx
            je HEXrest2
            movl $0, i
            HEXfor_c2:
                movl i, %ecx
                cmp dim, %ecx
                je HEXcont_for_count2
                pushl %ecx
                pushl %eax
                pushl %ebx
                pushl %edx
                
        
                movl count, %eax 
                mull dim 
                movl %eax, %edx 
                addl i, %edx 
                movl i, %ecx
                movl (%edi, %ecx, 4), %eax 
                movl (%esi, %edx, 4), %ebx 
                XOR %eax, %ebx
                movl %ebx, (%esi, %edx, 4)
                
         
                popl %edx
                popl %ebx
                popl %eax
                popl %ecx
                inc i
                jmp HEXfor_c2
            HEXcont_for_count2:
            inc count
            jmp HEXfor_count2
        HEXrest2:
        movl $0, i
        HEXfor_rest2:
                movl i, %ecx
                cmp res, %ecx
                je HEXcont_xor
                pushl %ecx
                pushl %eax
                pushl %ebx
                pushl %edx
                
                movl cat, %eax
                mull dim
                movl %eax, %edx 
                addl i, %edx 
                movl i, %ecx
                movl (%edi, %ecx, 4), %eax 
                movl (%esi, %edx, 4), %ebx 
                XOR %eax, %ebx
                movl %ebx, (%esi, %edx, 4)
              
                popl %edx
                popl %ebx
                popl %eax
                popl %ecx
                inc i
                jmp HEXfor_rest2
        
        HEXcont_xor:
     
            jmp HEXmake_message
        
        HEXmake_message:
            lea mBin, %esi 
            lea mesajFin, %edi  
            movl $0, lungMesajFin
        
        
        movl $0, i
        HEXfor_make_fin:
            movl i, %ecx
            cmp lenBin, %ecx
            jge HEXprint_make_fin
            
            xor %eax, %eax
            xor %edx, %edx 
            
            pushl %ebx
            movl i, %ebx
            movl %ebx, j
            popl %ebx
            HEXfor_every_ch:
            pushl %ecx
            pushl %eax
            movl i, %eax
            addl $8, %eax
            movl j, %ecx
            cmp %eax, %ecx
            jge HEXcont_for_make_fin
            movl %edx, %eax
            pushl %ebx
            movl $2, %ebx
            mull %ebx
            popl %ebx
            movl %eax, %edx
            addl (%esi, %ecx, 4), %edx
            
            popl %eax
            popl %ecx
            incl j
            jmp HEXfor_every_ch
            
        HEXcont_for_make_fin:
        pushl %ebx
        movl lungMesajFin, %ebx 
        movl %edx, (%edi, %ebx, 1)
        incl lungMesajFin
        addl $8, i
        popl %ebx
        jmp HEXfor_make_fin
        HEXprint_make_fin:
     
            movl lungMesajFin, %ebx 
            movl $0, (%edi, %ebx, 1)
            inc lungMesajFin
            movl $4, %eax           
            movl $1, %ebx          
            lea mesajFin, %ecx       
            movl lungMesajFin, %edx         
            int $0x80             
        exit:
                
                    jmp et_exit
et_exit:

pushl $0
 call fflush
 addl $4, %esp
  movl $1, %eax
  movl $0, %ebx
  int $0x80
