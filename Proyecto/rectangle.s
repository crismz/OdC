rectangle:
    movz x10, 0x00, lsl 16		// color
	movk x10, 0x2AD4, lsl 00

    movz x11,0xFF, lsl 16       // color blanco
    movk x11, 0xFFFF, lsl 00    

    mov x5,x12
    mov x0,x5
	mov x2, 30       			// altura del rectangulo  
loop_rec_1:
	mov x1, 80                //  anchura del rectangulo
    sub x10,x10,4
    
loop_rec_2:
	stur w10,[x0]			// Colocar el color
	add x0,x0,4				// pasa al siguiente pixel
	sub x1,x1,1				
	cbnz x1,loop_rec_2		// pinta una parte de la fila
	sub x2,x2,1				// pasa a la siguiente fila
	
    add x5,x5,2560			// Siguiente fila
    mov x0,x5
	cbnz x2,loop_rec_1		// repite el proceso

// Bordes
    // Borde superior
    
    mov x0,x12

    movz x3,80                 // Largo del borde

loop_borde_rec_sup:      // Loop para hacer el borde

    stur w11,[x0]
    add x0,x0,4
    sub x3,x3,1
    cbnz x3,loop_borde_rec_sup

    // Borde inferior

    mov x8, 640	
	mov x7, 30
	mul x8, x8, x7
	lsl x8,x8,2
	add x0,x8,x12


    movz x3,80         // Largo del borde                        
    
loop_borde_rec_inf:      // Loop para hacer el borde

    stur w11,[x0]
    add x0,x0,4
    sub x3,x3,1
    cbnz x3,loop_borde_rec_inf

    // Borde izquierdo

    mov x0,x12

    movz x3,30          // Largo del borde

loop_borde_rec_izq:      // Loop para hacer el borde

    stur w11,[x0]
    add x0,x0,2560
    sub x3,x3,1
    cbnz x3,loop_borde_rec_izq


    // Borde derecho

    add x0,x12,320

    movz x3,31         // Largo del borde

loop_borde_rec_der:      // Loop para hacer el borde

    stur w11,[x0]
    add x0,x0,2560
    sub x3,x3,1
    cbnz x3,loop_borde_rec_der

    ret
