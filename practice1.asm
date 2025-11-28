INCLUDE Irvine32.inc

.data
string1 BYTE "ASSEMBLY", 0
target  BYTE 'E'
msg1    BYTE "Character Found", 0
msg2    BYTE "Character not Found", 0

.code
main PROC
    cld                     ; Scan forward

    mov edi, OFFSET string1 ; EDI points to string
    mov al, target          ; AL = character to find
    mov ecx, SIZEOF string1 ; ECX = count of bytes to scan

    repnz scasb             ; Scan for AL in string1

    jz Found                ; ZF=1 means found

    mov edx, OFFSET msg2    ; Not found
    call WriteString
    jmp last

Found:
    mov edx, OFFSET msg1    ; Found
    call WriteString

last:
    exit
main ENDP
END main
