; Exercise 1: Modify Assembly Code to Flash Blue LED
    AREA LED_Flash_Blue, CODE, READONLY
    ENTRY

; Define register addresses
SYSCTL_RCGCGPIO_R   EQU  0x400FE608  ; GPIO Run Mode Clock Gating Control
GPIO_PORTF_DIR_R    EQU  0x40025400  ; GPIO Port F Direction
GPIO_PORTF_DEN_R    EQU  0x4002551C  ; GPIO Port F Digital Enable
GPIO_PORTF_DATA_R   EQU  0x400253FC  ; GPIO Port F Data
DELAY               EQU  2000000     ; Increased delay value

    EXPORT __main
__main
    ; Enable clock for GPIO Port F
    LDR R1, =SYSCTL_RCGCGPIO_R
    LDR R0, [R1]
    ORR R0, R0, #0x20  ; Set bit 5 to enable Port F
    STR R0, [R1]
    NOP                ; Wait for clock to stabilize
    NOP
    NOP

    ; Set PF2 (Blue LED) as output
    LDR R1, =GPIO_PORTF_DIR_R
    LDR R0, [R1]
    ORR R0, R0, #0x04  ; Set bit 2 to configure PF2 as output
    STR R0, [R1]

    ; Enable digital function for PF2
    LDR R1, =GPIO_PORTF_DEN_R
    LDR R0, [R1]
    ORR R0, R0, #0x04  ; Set bit 2 to enable digital function
    STR R0, [R1]

LED_flash
    ; Turn on PF2 (Blue LED)
    LDR R1, =GPIO_PORTF_DATA_R
    LDR R0, [R1]
    ORR R0, R0, #0x04  ; Set bit 2 to turn on LED
    STR R0, [R1]

    ; Delay loop
    LDR R5, =DELAY
delay1
    SUBS R5, R5, #1
    BNE delay1

    ; Turn off PF2 (Blue LED)
    LDR R1, =GPIO_PORTF_DATA_R
    LDR R0, [R1]
    AND R0, R0, #0xFB  ; Clear bit 2 to turn off LED
    STR R0, [R1]

    ; Delay loop
    LDR R5, =DELAY
delay2
    SUBS R5, R5, #1
    BNE delay2

    B LED_flash        ; Repeat the loop

    END