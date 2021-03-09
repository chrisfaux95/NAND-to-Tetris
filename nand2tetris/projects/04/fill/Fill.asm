// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
//SCREEN = 16384
//KEYBOARD = 24576

//INITIALIZING SCREEN INDEX
    @SCREEN
    D=A
    @index
    M=D-1

(LOOP)
// CHECK IF KEYBOARD IS PRESSED
// THEN SPLIT LOOP
    @KBD
    D=M
    @BLACK
    D;JNE
    @WHITE
    0;JMP


(BLACK)
    //CHECK IF AT MAX INDEX
    @index
    D=M
    @KBD
    D=D-A
    @LOOP
    D;JGE

    //BLACK CURRENT PIXEL
    @index
    A=M
    M=-1

    //NEXT POSITION
    @index
    M=M+1

    //LOOP AGAIN
    @LOOP
    0;JMP

(WHITE)
    //CHECK IF AT MIN INDEX
    @index
    D=M
    @SCREEN
    D=D-A
    D=D+1
    @LOOP
    D;JLE

    //WHITE CURRENT PIXEL
    @index
    A=M
    M=0
    
    //PREV POS
    @index
    M=M-1

    //LOOP AGAIN
    @LOOP
    0;JMP
