    AREA SubroutineExample, CODE, READONLY
    ENTRY

Start
    MOV R0, #5          ; Initialize R0 with 5
    MOV R1, #3          ; Initialize R1 with 3
    BL AddNumbers       ; Call subroutine AddNumbers
    B Stop              ; Stop execution after subroutine returns

AddNumbers
    ADD R0, R0, R1      ; Add R0 and R1, result in R0
    BX LR               ; Return to the caller

Stop
    B Stop              ; Infinite loop to stop execution
    END