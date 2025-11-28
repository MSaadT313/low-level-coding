INCLUDE Irvine32.inc

.data
string1 BYTE "ASSEMBLY",0
msg1 BYTE "Reversed String: ",0

.code
main PROC
    cld                     ; clear direction flag

    INVOKE Str_length, ADDR string1
    mov ecx, eax           ; ECX = string length
    shr ecx, 1              ; half length for swapping

    mov esi, OFFSET string1 ; start pointer
    mov edi, esi
    add edi, eax            ; point to null terminator
    dec edi                 ; move to last character

swap_loop:
    mov al, [esi]           ; AL = *start
    mov bl, [edi]           ; BL = *end
    mov [esi], bl           ; *start = *end
    mov [edi], al           ; *end = AL
    inc esi
    dec edi
    loop swap_loop

    mov edx, OFFSET msg1
    call WriteString
    mov edx, OFFSET string1
    call WriteString
    call CrLf

    exit
main ENDP
END main
