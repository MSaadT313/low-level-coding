INCLUDE Irvine32.inc

.data
; 3x3 2D array
tableB BYTE 1,2,3
       BYTE 4,5,6
       BYTE 7,8,9
RowCount    EQU 3     
ColCount    EQU 3     
.code
main PROC
    cld                    

    xor eax, eax           
    xor esi, esi          

sum_rows:
    cmp esi, RowCount
    jge done_sum            ; exit when all rows processed

    mov ebx, esi            ; EBX = row index
    imul ebx, ColCount      ; EBX = rowIndex * ColCount
    add ebx, OFFSET tableB  ; EBX points to start of current row

    xor edi, edi            ; column index
sum_cols:
    cmp edi, ColCount
    jge next_row
    movzx edx, BYTE PTR [ebx + edi]  
    add eax, edx                     ; add to total sum
    inc edi
    jmp sum_cols

next_row:
    inc esi
    jmp sum_rows

done_sum:
    call WriteInt      
    call CrLf

    exit
main ENDP
END main
