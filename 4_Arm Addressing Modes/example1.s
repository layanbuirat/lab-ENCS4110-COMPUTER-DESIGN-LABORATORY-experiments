    AREA Example1, CODE, READONLY
    ENTRY

Start
    MOV R0, #15          ; Move the value 15 into R0 (Literal/Immediate Addressing)
    ADD R1, R2, #12      ; Add 12 to the value in R2 and store the result in R1
    MOV R1, #0xFF        ; Move the hexadecimal value 0xFF into R1
    CMP R0, #6400        ; Compare R0 with 6400, update N, Z, C, and V flags
    CMPGT SP, R7, LSL #2 ; Compare SP with R7 shifted left by 2, update flags if greater than

Stop
    B Stop               ; Infinite loop to stop execution
    END