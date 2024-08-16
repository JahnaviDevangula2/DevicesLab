LCD_data equ P2    ;LCD Data port
LCD_rs   equ P0.0  ;LCD Register Select
LCD_rw   equ P0.1  ;LCD Read/Write
LCD_en   equ P0.2  ;LCD Enable
ORG 0H
LJMP MAIN
ORG 030H
MAIN:
call start
HERE: SJMP HERE
ORG 130H
start:

LOOP_0:
 mov P2,#00h
      mov P1,#00h
	  acall delay
	  acall delay
	  acall lcd_init      
	  acall delay
	  acall delay
	  acall delay
	  mov a,#82h		 
	  acall lcd_command	
	  acall delay
	  mov   dptr,#string_1   
	  acall lcd_sendstring	   
	  acall delay
	  mov a,#0C3h		  
	  acall lcd_command
	  acall delay
	  mov   dptr,#string_2
	  acall lcd_sendstring
MOV P1,#0FFH;
call delay_1s

LOOP_2:
mov P2,#00h
      mov P1,#00h
	 
      	  acall delay
	
	  acall delay
	
	  acall lcd_init    
	  acall delay
	  acall delay
	  acall delay
	  mov a,#81h		 
	  acall lcd_command	 
	  acall delay
	  mov   dptr,#string_3   
	  acall lcd_sendstring	   
	  acall delay
	  mov a,#0C3h		  
	  acall lcd_command
	  acall delay
	  mov   dptr,#string_2
	  acall lcd_sendstring

mov p1,#8fh;
call delay_2s
mov a,p1;
anl a,#0fh;
mov 61h,a;
swap a;
mov 30h,a; 

LOOP_3:

mov p1,#4fh;
call delay_2s
mov a,p1;
anl a,#0fh;
mov 62h,a;
add a,30h;
mov 30h,a;

LOOP_4:

mov p1,#2fh;
call delay_2s
mov a,p1;
anl a,#0fh;
mov 63h,a;
swap a;
mov 31h,a;
LOOP_5:
mov p1,#1fh;
call delay_2s
mov a,p1;
anl a,#0fh;
mov 64h,a;
add a,31h;
mov 31h,a;
LOOP_6:

mov r0,61h
call ASCII
mov 70h,r0
mov r0,62h
call ASCII
mov 71h,r0
mov r0,63h
call ASCII
mov 72h,r0
mov r0,64h
call ASCII
mov 73h,r0

mov P2,#00h
mov P1,#00h

      acall delay
	  acall delay
	  acall lcd_init      	
	  acall delay
	  acall delay
	  acall delay
	  mov a,#80h		 
	  acall lcd_command	 
	  acall delay
	  mov   dptr,#string_4   
	  acall lcd_sendstring	   
	  acall delay
mov a,#0C0h		  
	  acall lcd_command
	  acall delay
	  mov   dptr,#string_6
	  acall lcd_sendstring
mov a,#0C5h
acall lcd_command
MOV A,70h;
call lcd_senddata
mov a,#0C6h
acall lcd_command
MOV A,71h;
call lcd_senddata    
	   mov a,#0C9h		 
	  acall lcd_command
	  acall delay
	  mov   dptr,#string_7
	  acall lcd_sendstring
mov a,#0CEh
acall lcd_command
MOV A,72h;
call lcd_senddata
mov a,#0CFh
acall lcd_command
MOV A,73h;
call lcd_senddata 
mov p1,#0fh;
call delay_2s

LOOP_7:
mov a,30h;
mov b,31h;
mul ab;
mov 32h,a;
mov 33h,b;

mov a,33h;
anl a,#0f0h;
swap a;
mov 65h,a;
mov r0,65h
call ASCII
mov 74h,r0;

mov a,33h;
anl a,#0fh;
mov 66h,a;
mov r0,66h
call ASCII
mov 75h,r0;

mov a,32h;
anl a,#0f0h;
swap a;
mov 67h,a;
mov r0,67h
call ASCII
mov 76h,r0;

mov a,32h;
anl a,#0fh;
mov 68h,a;
mov r0,68h
call ASCII
mov 77h,r0;

acall lcd_init;
      mov a,#81h;
	  acall lcd_command;
	  acall delay;
	  mov dptr,#string_5
	  acall lcd_sendstring
	  clr A;
	  mov A,#89h;
	  acall lcd_command;
	  acall delay;
	  mov A,74h;
	  acall lcd_senddata
	  acall delay
	  mov a,#8ah;
	  acall lcd_command;
	  acall delay;
	  mov A,75h;
	  acall lcd_senddata
	  acall delay;
	  clr A;
	  mov A,#8bh;
	  acall lcd_command
	  acall delay;
	  mov A,76h
	  acall lcd_senddata
	  acall delay
	  mov a,#8ch;
	  acall lcd_command
	  acall delay
	  mov A,77h;
	  acall lcd_senddata
	  acall delay
      mov a,#0C1h		  
	  acall lcd_command
	  acall delay
	  mov dptr,#string_6
	  acall lcd_sendstring
	  acall delay;
	  clr A
	  mov A,#0c6h;
	  acall lcd_command
	  acall delay
	  mov A,70h;
	  acall lcd_senddata
	  acall delay
      mov A,#0c7h;
	  acall lcd_command
	  acall delay
	  mov A,71h;
	  acall lcd_senddata
	  acall delay
	  mov a,#0c9h
	  acall lcd_command
	  acall delay
	  mov dptr,#string_7
	  acall lcd_sendstring
	  clr A;
	  mov a,#0ceh;
	  acall lcd_command;
	  acall delay;
	  mov A,72h;
	  acall lcd_senddata
	  acall delay
	  mov a,#0cfh;
	  acall lcd_command
	  acall delay
	  mov A,73h;
	  acall lcd_senddata
	  acall delay
	  acall delay_1s;
	  acall delay_1s;
ret		
delay_2s:
push 00h
mov r0, #8
h5: acall delay_200ms
djnz r0, h5
pop 00h
ret
delay_1s:
push 00h
mov r0, #4
h4: acall delay_200ms
djnz r0, h4
pop 00h
ret
delay_200ms:
push 00h
mov r0,#0C8H
h3: acall delay_1ms
djnz r0, h3
pop 00h
ret
delay_1ms:
push 00h
mov r0, #4
h2: acall delay_250us
djnz r0, h2
pop 00h
ret
delay_250us:
push 00h
mov r0, #244
h1: djnz r0, h1
pop 00h
ret


;------------------------LCD Initialisation routine----------------------------------------------------
lcd_init:
         mov   LCD_data,#38H  ;Function set: 2 Line, 8-bit, 5x7 dots
         clr   LCD_rs         ;Selected command register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en
	     acall delay

         mov   LCD_data,#0CH  ;Display on, Curson off
         clr   LCD_rs         ;Selected instruction register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en
         
		 acall delay
         mov   LCD_data,#01H  ;Clear LCD
         clr   LCD_rs         ;Selected command register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en
         
		 acall delay

         mov   LCD_data,#06H  ;Entry mode, auto increment with no shift
         clr   LCD_rs         ;Selected command register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en

		 acall delay
         
         ret                  ;Return from routine

;-----------------------command sending routine-------------------------------------
 lcd_command:
         mov   LCD_data,A     ;Move the command to LCD port
         clr   LCD_rs         ;Selected command register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en
		 acall delay
    
         ret  
;-----------------------data sending routine-------------------------------------		     
 lcd_senddata:
         mov   LCD_data,A     ;Move the command to LCD port
         setb  LCD_rs         ;Selected data register
         clr   LCD_rw         ;We are writing
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en
         acall delay
		 acall delay
         ret                  ;Return from busy routine

;-----------------------text strings sending routine-------------------------------------
lcd_sendstring:
	push 0e0h
	lcd_sendstring_loop:
	 	 clr   a                 ;clear Accumulator for any previous data
	         movc  a,@a+dptr         ;load the first character in accumulator
	         jz    exit              ;go to exit if zero
	         acall lcd_senddata      ;send first char
	         inc   dptr              ;increment data pointer
	         sjmp  LCD_sendstring_loop    ;jump back to send the next character
exit:    pop 0e0h
         ret                     ;End of routine

;----------------------delay routine-----------------------------------------------------
delay:	 push 0
	 push 1
         mov r0,#1
loop2:	 mov r1,#255
	 loop1:	 djnz r1, loop1
	 djnz r0, loop2
	 pop 1
	 pop 0 
	 ret
FIRST4BITS:
CLR C;    //first4bits stores first 4bits from A to R0
RRC A;
CLR C;
RRC A;
CLR C;
RRC A;
CLR C;
RRC A;
MOV R0,A;
RET
ASCII:      //ascvalue converts the hex to ascvalue of R0
MOV A,R0;      //Get the data from R0
MOV R2,A;      //Store the content of A into R2
CLR C;         //Clear the Carry Flag
SUBB A,#0AH;   //Subtract 0AH from A
JC NUM ;       //When a carry is present, A is numeric
ADD A,#41H;    //   Add41H for Alphabet
SJMP STORE;    // Jump to store the value
NUM: MOV A,R2; //Copy R2 to A
ADD A,#30H;    // Add 30H with A to get ASCII
STORE: MOV R0,A; //Store A content to R0
RET
;------------- ROM text strings---------------------------------------------------------------
org 400h
string_1:
         DB   "Enter Inputs", 00H
string_2:
		 DB   "EE337-2022", 00H
string_3:
		 DB   "Reading Inputs", 00H
string_4:
		 DB   "Computing Result", 00H
string_5:
		 DB   "Result=", 00H
string_6:
DB   "Num1:", 00H
string_7:
DB   "Num2:", 00H
end