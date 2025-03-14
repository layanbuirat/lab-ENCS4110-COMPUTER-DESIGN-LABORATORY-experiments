    AREA AddGT, CODE, READONLY
    ENTRY

Start
    LDR R1, =NUM1        ; Load the base address of the array NUM1 into R1
    LDR R2, N            ; Load the size of the array into R2
    MOV R0, #0           ; Initialize the sum to 0

Loop
    LDR R3, [R1], #4     ; Load the next element from the array into R3, increment R1 by 4
    CMP R3, #5           ; Compare the element with 5
    BLE Skip             ; If the element is less than or equal to 5, skip adding
    ADD R0, R0, R3       ; Add the element to the sum in R0

Skip
    SUBS R2, R2, #1      ; Decrement the counter
    BGT Loop             ; If counter > 0, repeat the loop

Stop
    B Stop               ; Infinite loop to stop execution

    AREA Data, DATA, READWRITE
NUM1 DCD 3, -7, 2, -2, 10, 20, 30 ; Array of numbers
N    DCD 7                        ; Size of the array
    END