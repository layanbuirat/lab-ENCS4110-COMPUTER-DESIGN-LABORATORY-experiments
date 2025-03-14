    AREA Example6, CODE, READONLY
    ENTRY

Start
    LDR R0, [PC, #24]    ; Load R0 with the word at the address PC + 24 (PC Relative Addressing)

Stop
    B Stop               ; Infinite loop to stop execution
    END