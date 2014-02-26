[BITS 16] ;Tell Assembler, its a 16 bit code
[ORG 0x7C00] ;Origin, tell assembler here will be the code in memory after 
              ;boot

MOV SI, HelloString
CALL PrintString 

JMP $

PrintCharacter: ; Procedure to print character

MOV AH, 0x0E ; TELL BIOS WE NEED TO PRINT ON SCREEN
MOV BH, 0x00 ; PAGE NUMBER
MOV BL, 0x07 ; TEXT ATTRIBUTE 0x07 LIGHTGREY

INT 0x10 ; CALL VIDEO INTERRUPT
RET ; RETURN TO CALLING PROCEDURE

PrintString: ; PRINT STRING ON SCREEN

next_character: ;FETCH CHARACTER FROM STRING

MOV AL, [SI] ; GET BYTE FROM STRING AND STORE IN AL REGISTER
INC SI ; INCREMENT SI POINTER
OR AL, AL ; CHECK IF VALUE IN AL IS ZERO
JZ exit_function ; IF END THEN RETURN
CALL PrintCharacter
JMP next_character

getc: ; read character into al

MOV ah, 1h

INT 21h

RET 

exit_function:
RET

; MAIN STRING

HelloString db 'Hello World', 0 


TIMES 510-($-$$) db 0 ; Fill the rest of the sector with 0
DW 0xAA55 ; Standard boot signature