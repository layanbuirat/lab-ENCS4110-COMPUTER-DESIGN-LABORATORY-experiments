    AREA ProcExample, CODE, READONLY
    ENTRY

Start
    MOV R0, #10         ; Initialize R0 with 10
    MOV R1, #20         ; Initialize R1 with 20
    BL AddNumbers       ; Call subroutine AddNumbers
    B Stop              ; Stop execution after subroutine returns

AddNumbers PROC
    ADD R0, R0, R1      ; Add R0 and R1, result in R0
    BX LR               ; Return to the caller
    ENDP

Stop
    B Stop              ; Infinite loop to stop execution
    END