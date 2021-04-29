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

(OUTERLOOP)
    // Checking whether keyboard is active or not
    @KBD 
    D=M
    @value
    M=-1
    @SLATE
    D;JNE
    @value
    M=0

    // If any key is pressed paint the entire screen black
(SLATE)
    @SCREEN
    D=A
    @addr
    M=D     // Move i to begining of SCREEN register

(INNERLOOP)
    @value
    D=M
    @addr
    A=M
    M=D   // coloring the whole section black

    @addr
    M=M+1

    D=M
    @KBD
    D=D-A
    @INNERLOOP
    D;JLT

    @OUTERLOOP
    0;JMP

