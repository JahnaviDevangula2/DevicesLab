ORG 0H
LJMP MAIN
ORG 100H
MAIN:
CALL HEXA_TO_ASCII
HERE: SJMP HERE
ORG 130H
HEXA_TO_ASCII:     
MOV A,30H;
CALL FIRST_FOUR_BITS
CALL ASCII
MOV 60H,R0;
MOV A,30H;
SWAP A;
CALL FIRST_FOUR_BITS
CALL ASCII
MOV 61H,R0;
RET
FIRST_FOUR_BITS:
CLR C;    
RRC A;
CLR C;
RRC A;
CLR C;
RRC A;
CLR C;
RRC A;
MOV R0,A;
RET
ASCII:      
MOV A,R0;      
MOV R2,A;      
CLR C;         
SUBB A,#0AH;   
JC NUM ;       
ADD A,#41H;    
SJMP STORE;    
NUM: MOV A,R2; 
ADD A,#30H;    
STORE: MOV R0,A; 
RET
END