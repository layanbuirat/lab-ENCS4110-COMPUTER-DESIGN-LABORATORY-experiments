    AREA RESET, DATA, READONLY
    EXPORT __Vectors
__Vectors
    DCD 0x20001000  ; Stack pointer
    DCD Reset_Handler  ; Reset handler

    AREA MYCODE, CODE, READONLY
    EXPORT Reset_Handler
Reset_Handler
    ; Initialize R0 with Celsius temperature (22)
    MOV R0, #22

    ; Initialize R1 with Fahrenheit temperature (70)
    MOV R1, #70

    ; Convert Celsius to Fahrenheit
    ; F = (C * 9/5) + 32
    MOV R2, #9        ; R2 = 9
    MUL R2, R0, R2    ; R2 = C * 9
    MOV R3, #5        ; R3 = 5
    SDIV R2, R2, R3   ; R2 = (C * 9) / 5
    ADD R2, R2, #32   ; R2 = (C * 9/5) + 32 (Fahrenheit)

    ; Convert Fahrenheit to Celsius
    ; C = (F - 32) * 5/9
    SUB R3, R1, #32   ; R3 = F - 32
    MOV R4, #5        ; R4 = 5
    MUL R3, R3, R4    ; R3 = (F - 32) * 5
    MOV R4, #9        ; R4 = 9
    SDIV R3, R3, R4   ; R3 = (F - 32) * 5 / 9 (Celsius)

    ; Infinite loop to stop execution
STOP
    B STOP

    END