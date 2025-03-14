    AREA Factorial, CODE, READONLY
    ENTRY

Start
    MOV R1, #5          ; Initialize R1 with the number to calculate factorial (e.g., 5)
    BL CalculateFactorial ; Call subroutine CalculateFactorial
    B Stop              ; Stop execution after subroutine returns

CalculateFactorial
    PUSH {R1, LR}       ; Push R1 and LR onto the stack
    CMP R1, #1          ; Check if R1 is 1 (base case)
    BLE BaseCase        ; If R1 <= 1, jump to BaseCase
    SUB R1, R1, #1      ; Decrement R1
    BL CalculateFactorial ; Recursive call
    POP {R1, LR}        ; Pop R1 and LR from the stack
    MUL R0, R0, R1      ; Multiply R0 by R1 (factorial calculation)
    BX LR               ; Return to the caller

BaseCase
    MOV R0, #1          ; Base case: factorial of 1 is 1
    POP {R1, LR}        ; Pop R1 and LR from the stack
    BX LR               ; Return to the caller

Stop
    B Stop              ; Infinite loop to stop execution
    END