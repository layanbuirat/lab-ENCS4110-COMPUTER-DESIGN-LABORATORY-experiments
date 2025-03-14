    AREA CountVowels, CODE, READONLY
    ENTRY

Start
    LDR R0, =String     ; Load the address of the string into R0
    MOV R2, #0          ; Initialize vowel counter (R2) to 0
    MOV R3, #0          ; Initialize non-vowel counter (R3) to 0

Loop
    LDRB R1, [R0], #1   ; Load the next character into R1, increment R0
    CMP R1, #0          ; Check if the character is null (end of string)
    BEQ Done            ; If null, exit the loop
    BL CheckVowel       ; Call subroutine to check if the character is a vowel
    B Loop              ; Repeat the loop

CheckVowel
    CMP R1, #'A'        ; Check if the character is 'A'
    BEQ IsVowel
    CMP R1, #'E'        ; Check if the character is 'E'
    BEQ IsVowel
    CMP R1, #'I'        ; Check if the character is 'I'
    BEQ IsVowel
    CMP R1, #'O'        ; Check if the character is 'O'
    BEQ IsVowel
    CMP R1, #'U'        ; Check if the character is 'U'
    BEQ IsVowel
    CMP R1, #'a'        ; Check if the character is 'a'
    BEQ IsVowel
    CMP R1, #'e'        ; Check if the character is 'e'
    BEQ IsVowel
    CMP R1, #'i'        ; Check if the character is 'i'
    BEQ IsVowel
    CMP R1, #'o'        ; Check if the character is 'o'
    BEQ IsVowel
    CMP R1, #'u'        ; Check if the character is 'u'
    BEQ IsVowel

    ; If not a vowel, increment the non-vowel counter
    ADD R3, R3, #1
    BX LR               ; Return to the caller

IsVowel
    ; If a vowel, increment the vowel counter
    ADD R2, R2, #1
    BX LR               ; Return to the caller

Done
    B Done              ; Infinite loop to stop execution

    AREA Data, DATA, READONLY
String DCB "ARM assembly language is important to learn!",0 ; Null-terminated string
    END