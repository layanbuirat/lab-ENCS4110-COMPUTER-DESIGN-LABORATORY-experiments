    AREA LED_Flash, CODE, READONLY
    ENTRY

; Define register addresses
SYSCTL_RCGCGPIO_R   EQU  0x400FE608  ; GPIO Run Mode Clock Gating Control
GPIO_PORTF_DIR_R    EQU  0x40025400  ; GPIO Port F Direction
GPIO_PORTF_DEN_R    EQU  0x4002551C  ; GPIO Port F Digital Enable
GPIO_PORTF_DATA_R   EQU  0x400253FC  ; GPIO Port F Data
DELAY               EQU  200000      ; Delay counter value

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

    ; Set PF3 (Green LED) as output
    LDR R1, =GPIO_PORTF_DIR_R
    LDR R0, [R1]
    ORR R0, R0, #0x08  ; Set bit 3 to configure PF3 as output
    STR R0, [R1]

    ; Enable digital function for PF3
    LDR R1, =GPIO_PORTF_DEN_R
    LDR R0, [R1]
    ORR R0, R0, #0x08  ; Set bit 3 to enable digital function
    STR R0, [R1]

LED_flash
    ; Turn on PF3 (Green LED)
    LDR R1, =GPIO_PORTF_DATA_R
    LDR R0, [R1]
    ORR R0, R0, #0x08  ; Set bit 3 to turn on LED
    STR R0, [R1]
    ;1. GPIO Configuration and LED Flashing
    ; Delay loop
    LDR R5, =DELAY
delay1
    SUBS R5, R5, #1
    BNE delay1

    ; Turn off PF3 (Green LED)
    LDR R1, =GPIO_PORTF_DATA_R
    LDR R0, [R1]
    AND R0, R0, #0xF7  ; Clear bit 3 to turn off LED
    STR R0, [R1]

    ; Delay loop
    LDR R5, =DELAY
delay2
    SUBS R5, R5, #1
    BNE delay2

    B LED_flash        ; Repeat the loop

    END