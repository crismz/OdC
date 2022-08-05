.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
.equ BITS_PER_PIXEL,  	32
.include "makebr.s"

.globl make_background

background:
	mov x17, x30
	mov x0, x21
	movz x11, 0x44, lsl 16		    // Color for backgroudn
	movk x11, 0x1bbf, lsl 00

    movz x10, 0x32, lsl 16		    // Color for cubes
	movk x10, 0x1591, lsl 00
    
	mov x2, 360
B2:                        
	mov x1, SCREEN_WIDTH
B1:
	
    str w11,[x0]

	add x0,x0,4	 
	sub x1,x1,1	  
	cbnz x1, B1	   
	sub x2,x2,1	  
	cbnz x2, B2	  
	
	// x26 -> x 
	// x18 -> y 
	// x7 -> width
	// x14 -> height 

	mov x26, 0                     
	mov x18, 10
	mov x7, 170
	mov x14, 170
	bl rectangle_fondo

	mov x26, 30
	mov x18, 190
	mov x7, 140
	mov x14, 140

	bl rectangle_fondo

	mov x26, 0
	mov x18, 190
	mov x7, 20
	mov x14, 140

	bl rectangle_fondo

	mov x26, 180
	mov x18, 10
	mov x7, 210
	mov x14, 40

	bl rectangle_fondo

	mov x26, 180
	mov x18, 60
	mov x7, 150
	mov x14, 150

	bl rectangle_fondo

	mov x26, 340
	mov x18, 60
	mov x7, 50
	mov x14, 50

	bl rectangle_fondo

	mov x26, 340
	mov x18, 120
	mov x7, 50
	mov x14, 50

	bl rectangle_fondo

	mov x26, 340
	mov x18, 180
	mov x7, 210
	mov x14, 180

	bl rectangle_fondo

	mov x26, 180
	mov x18, 220
	mov x7, 150
	mov x14, 140

	bl rectangle_fondo

	mov x26, 400
	mov x18, 10
	mov x7, 150
	mov x14, 160

	bl rectangle_fondo

	mov x26, 560
	mov x18, 10
	mov x7, 120
	mov x14, 140

	bl rectangle_fondo

	mov x26, 560
	mov x18, 10
	mov x7, 80
	mov x14, 80

	bl rectangle_fondo

	mov x26, 560
	mov x18, 250
	mov x7, 80
	mov x14, 100

	bl rectangle_fondo

	mov x26, 560
	mov x18, 250
	mov x7, 80
	mov x14, 100

	bl rectangle_fondo

	mov x26, 0
	mov x18, 340
	mov x7, 170
	mov x14, 20

	bl rectangle_fondo

	mov x26, 560
	mov x18, 160
	mov x7, 80
	mov x14, 80

	bl rectangle_fondo

	mov x0, SCREEN_WIDTH
	mov x8, 360 
	mul x8, x8, x0
	lsl x8, x8, 2
	add x8, x8, x21
	
	mov x0, x8
	mov x30, x17

// Draws floor 
make_floor:
    
	mov x2, 360
    movz x10, 0x26, lsl 16          // Set color
    movk x10, 0x0299, lsl 00 

F2:                               
    mov x1, SCREEN_WIDTH            // Set x1 to width
    sub x10, x10, 1					// Fade effect
F1:
	
    stur w10, [x0]
    add x0, x0, 4
	sub x1, x1, 1	  
    cbnz x1, F1	      
    
    sub x2,x2,1	  
    cbnz x2, F2	 

	movz x10, 0x26, lsl 16           // Set color for cubes
    movk x10, 0x0299, lsl 00 


// Floor rectangles
	mov x26, 0
	mov x18, 370
	mov x7, 170
	mov x14, 170

	bl rectangle_fondo

	mov x26, 180
	mov x18, 370
	mov x7, 170
	mov x14, 170

	bl rectangle_fondo

	mov x26, 360
	mov x18, 370
	mov x7, 170
	mov x14, 170

	bl rectangle_fondo

	mov x26, 540
	mov x18, 370
	mov x7, 170
	mov x14, 170

	bl rectangle_fondo

	mov x30, x17

	ret
	