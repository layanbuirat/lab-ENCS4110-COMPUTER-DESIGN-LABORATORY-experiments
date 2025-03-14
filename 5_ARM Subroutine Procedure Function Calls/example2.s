    AREA StackExample, CODE, READONLY
    ENTRY

Start
    MOV R0, #10         ; Initialize R0 with 10
    MOV R1, #20         ; Initialize R1 with 20
    BL PushToStack      ; Call subroutine PushToStack
    B Stop              ; Stop execution after subroutine returns

PushToStack
    PUSH {R0, R1, LR}   ; Push R0, R1, and LR onto the stack
    POP {R0, R1, PC}    ; Pop R0, R1, and PC from the stack (return to caller)

Stop
    B Stop              ; Infinite loop to stop execution
    END