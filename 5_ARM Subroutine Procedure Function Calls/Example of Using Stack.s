    AREA StackExample, CODE, READONLY
    ENTRY

Start
    MOV R0, #0x75       ; Initialize R0 with 0x75
    MOV R3, #5          ; Initialize R3 with 5
    PUSH {R0, R3}       ; Push R0 and R3 onto the stack
    MOV R0, #6          ; Change R0 to 6
    MOV R3, #7          ; Change R3 to 7
    POP {R0, R3}        ; Pop R0 and R3 from the stack (R0 = 0x75, R3 = 5)

Stop
    B Stop              ; Infinite loop to stop execution
    END