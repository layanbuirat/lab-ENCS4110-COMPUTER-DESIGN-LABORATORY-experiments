    AREA StringLength, CODE, READONLY
    ENTRY

Start
    LDR R0, =string1     ; Load the address of the string into R0
    MOV R1, #0           ; Initialize the counter to 0

Loop
    LDRB R2, [R0], #1    ; Load the next character into R2, increment R0 by 1
    CBZ R2, Done         ; If the character is null (0), exit the loop
    ADD R1, R1, #1       ; Increment the counter
    B Loop               ; Repeat the loop

Done
    B Done               ; Infinite loop to stop execution

    AREA Data, DATA, READONLY
string1 DCB "Hello world!",0 ; Null-terminated string
    END