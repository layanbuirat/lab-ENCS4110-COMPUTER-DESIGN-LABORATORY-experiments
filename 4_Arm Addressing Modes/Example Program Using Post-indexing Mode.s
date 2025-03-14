    AREA PostIndexExample, CODE, READONLY
    ENTRY

Start
    LDR R1, N            ; Load the size of the array into R1
    LDR R2, POINTER      ; Load the base address of the array into R2
    MOV R0, #0           ; Initialize the sum to 0

Loop
    LDR R3, [R2], #4     ; Load the next element from the array into R3, increment R2 by 4
    ADD R0, R0, R3       ; Add the element to the sum in R0
    SUBS R1, R1, #1      ; Decrement the counter
    BGT Loop             ; If counter > 0, repeat the loop

Stop
    B Stop               ; Infinite loop to stop execution

    AREA Data, DATA, READWRITE
N    DCD 5               ; Size of the array
NUM1 DCD 3, -7, 2, -2, 10 ; Array of numbers
POINTER DCD NUM1         ; Pointer to the array
    END