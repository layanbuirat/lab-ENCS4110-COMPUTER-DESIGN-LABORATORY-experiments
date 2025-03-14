    AREA Example3, CODE, READONLY
    ENTRY

Start
    LDR R0, [R1, #20]    ; Load R0 with the word at the address R1 + 20 (Offset Addressing)

Stop
    B Stop               ; Infinite loop to stop execution
    END