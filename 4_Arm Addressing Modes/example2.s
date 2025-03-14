    AREA Example2, CODE, READONLY
    ENTRY

Start
    LDR R2, [R0]         ; Load R2 with the word pointed to by R0 (Register Indirect Addressing)
    STR R2, [R3]         ; Store the word in R2 into the location pointed to by R3

Stop
    B Stop               ; Infinite loop to stop execution
    END