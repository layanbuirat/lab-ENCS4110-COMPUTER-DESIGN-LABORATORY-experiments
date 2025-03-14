    AREA Example5, CODE, READONLY
    ENTRY

Start
    LDR R0, [R1], #4     ; Load R0 with the word at R1, then update R1 to R1 + 4 (Post-indexed)

Stop
    B Stop               ; Infinite loop to stop execution
    END