INCLUDE Irvine32.inc

.data
string1 BYTE "PROGRAMMING",0
target BYTE 'P'
msg1 BYTE "Character ",0
msg2 BYTE " occurs ",0
msg3 BYTE " times. ",0

.code
main PROC
    cld                             ; clear direction flag
    mov esi, OFFSET string1         ; source
    mov ecx, LENGTHOF string1         ; number of bytes to copy
    mov ebx, 0                      ;count = 0
    CHECK:
    lodsb 
    cmp al,target
    je Found
    loop CHECK
    jmp last
    Found:
    inc ebx
    dec ecx
    jmp CHECK
    last:
    mov edx, OFFSET msg1
    call WriteString
    mov al, target
    call Writechar
    mov edx, OFFSET msg2
    call Writestring
    mov eax, ebx
    call writedec
    mov edx, OFFSET msg3
    call Writestring

    exit
main ENDP
END main
