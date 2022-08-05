.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
.equ BITS_PER_PIXEL,  	32

.globl rectangle_f

rectangle_fondo:
	mov x3, SCREEN_WIDTH	    // Calculates initial position 		
	mov x4, x18					
	mul x3, x3, x4
	add x3, x3, x26
	lsl x3, x3, 2
	add x6, x3, x21              

    mov x5, x6			
    mov x0, x6					
	mov x2, x14       			// Height of the square
L1:
	mov x1, x7                  // Width of the square
L2:
	stur w10,[x0]			    // Set color

    add x0,x0,4				   
	sub x1,x1,1				
	cbnz x1,L2		            
	sub x2,x2,1				    
	
    add x5,x5,2560			   
    mov x0,x5
	cbnz x2, L1	                 
    
    ret
    
