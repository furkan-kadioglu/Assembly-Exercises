    ; Mark this as application entry point
    ABSENTRY ROM_4000Start

    ; Include derivative-specific definitions
    INCLUDE 'derivative.inc'

    ; DATA
    ORG RAMStart            ; Put the following to RAM @ $400
val:
    DC.B 1                  ; Initially val = 1

    ; CODE
    ORG ROM_4000Start       ; Put the following to ROM @ $4000
    MOVB #%11111111, DDRA   ; Load all ones to the LED/7SEG configuration
Loop:
    BRCLR val, #1, TurnOn   ; if val & 1 == 0 then TurnOn
    MOVB #0, PORTA          ; Turn off the LED/7SEG
    BRA Loop                ; Go to Loop
TurnOn:
    MOVB #1, PORTA          ; Turn on the LED/7SEG
    BRA Loop                ; Go to Loop

    ; INTERUPT VECTORS
    ORG Vreset              ; Put the following to the reset vector @ $FFFE
    DC.W ROM_4000Start      ; Put the memory adress of the entry point here