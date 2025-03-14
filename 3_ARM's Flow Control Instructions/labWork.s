    AREA RESET, DATA, READONLY
    EXPORT __Vectors
__Vectors
    DCD 0x20001000  ; Stack pointer
    DCD Reset_Handler  ; Reset handler

    AREA MYDATA, DATA, READONLY
    ; Define the string "ARM Assembly language" with a null terminator
    STRING DCB "ARM Assembly language", 0

    AREA MYCODE, CODE, READONLY
    EXPORT Reset_Handler
Reset_Handler
    ; Initialize registers
    LDR R1, =STRING  ; Load the address of the string into R1
    MOV R2, #0       ; Initialize vowel counter (R2) to 0
    MOV R3, #0       ; Initialize non-vowel counter (R3) to 0

    ; Loop through the string
Loop
    LDRB R0, [R1], #1  ; Load the next character from the string into R0, increment R1
    CMP R0, #0         ; Check if the character is null (end of string)
    BEQ Done           ; If null, exit the loop

    ; Check if the character is a vowel (A, E, I, O, U, a, e, i, o, u)
    CMP R0, #'A'
    BEQ IsVowel
    CMP R0, #'E'
    BEQ IsVowel
    CMP R0, #'I'
    BEQ IsVowel
    CMP R0, #'O'
    BEQ IsVowel
    CMP R0, #'U'
    BEQ IsVowel
    CMP R0, #'a'
    BEQ IsVowel
    CMP R0, #'e'
    BEQ IsVowel
    CMP R0, #'i'
    BEQ IsVowel
    CMP R0, #'o'
    BEQ IsVowel
    CMP R0, #'u'
    BEQ IsVowel

    ; If not a vowel, increment the non-vowel counter
    ADD R3, R3, #1
    B Loop

IsVowel
    ; If a vowel, increment the vowel counter
    ADD R2, R2, #1
    B Loop

Done
    ; Infinite loop to stop execution
    B Done

    END