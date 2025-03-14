    AREA Example4, CODE, READONLY
    ENTRY

Start
    LDR R0, [R1, #4]!    ; Load R0 with the word at R1 + 4, then update R1 to R1 + 4 (Pre-indexed)

Stop
    B Stop               ; Infinite loop to stop execution
    END