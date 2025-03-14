    AREA MinMax, CODE, READONLY
    ENTRY

Start
    LDR R1, =NUM1        ; Load the base address of the array NUM1 into R1
    LDR R2, N            ; Load the size of the array into R2
    LDR R3, [R1]         ; Load the first element into R3 (initial max)
    MOV R4, R3           ; Copy the first element into R4 (initial min)
    ADD R1, R1, #4       ; Move to the next element

Loop
    LDR R5, [R1], #4     ; Load the next element into R5, increment R1 by 4
    CMP R5, R3           ; Compare the element with the current max
    MOVGT R3, R5         ; If the element is greater, update the max
    CMP R5, R4           ; Compare the element with the current min
    MOVLT R4, R5         ; If the element is less, update the min
    SUBS R2, R2, #1      ; Decrement the counter
    BGT Loop             ; If counter > 0, repeat the loop

Stop
    B Stop               ; Infinite loop to stop execution

    AREA Data, DATA, READWRITE
NUM1 DCD 3, -7, 2, -2, 10, 20, 30, 15, 32, 8, 64, 66 ; Array of numbers
N    DCD 12                        ; Size of the array
    END