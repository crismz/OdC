.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
.equ BITS_PER_PIXEL,  	32

.equ AMARILLO_1,        0xFF
.equ AMARILLO_2,        0xCC33
.equ CELESTE_1,         0x33
.equ CELESTE_2,         0xFFFF
.equ NEGRO_1,           0x0000


cube:
    movz x11, NEGRO_1,lsl 0         // Color para bordes

    

// Forma del cubo

	movz x10, AMARILLO_1,lsl 16         // Color del cubo
	movk x10, AMARILLO_2,lsl 0

    mov x0,x19
    mov x2,60			// Altura del cubo
loop_cubo_1:
	mov x1,60           // Anchura del cubo
loop_cubo_2:
	stur w10,[x0]       // Pinta el pixel de amarrillo
	add x0,x0,4         // Pasa al siguiente pixel
	sub x1,x1,1         // Se resta el contador de fila
	cbnz x1,loop_cubo_2 // Se repite hasta pintar los  pixeles de la fila
	sub x2,x2,1         // Se resta el contador de columna
	
	mov x3,580         
	lsl x3,x3,2
	add x0,x0,x3       // Se mueve el x0 a la fila de abajo
	cbnz x2,loop_cubo_1 // Se repite hasta pintar todo el cubo

// Bordes del cubo  
    // Borde superior

    mov x0,x19          // Dirección donde se va a hacer el borde superior
    movz x3,60         // Largo del borde

loop_borde_fila_cubo_sup:      // Loop para hacer el borde

    stur w11,[x0]
    add x0,x0,4
    sub x3,x3,1
    cbnz x3,loop_borde_fila_cubo_sup

    // Borde inferior

    movz x3,60         // Largo del borde
        
    mov x0,x19          // Dirección donde se va hacer el borde inferior
    mov x1,640
    mov x2,60
    mul x1,x1,x2
    lsl x1,x1,2
    add x0,x1,x19
    
loop_borde_fila_cubo_inf:      // Loop para hacer el borde

    stur w11,[x0]
    add x0,x0,4
    sub x3,x3,1
    cbnz x3,loop_borde_fila_cubo_inf

    // Borde izquierdo

    movz x3,60         // Largo del borde
    mov x0,x19          // Dirección donde se va hacer el borde izquierdo
    
loop_borde_fila_cubo_izq:      // Loop para hacer el borde

    stur w11,[x0]
    mov x1,640
    lsl x1,x1,2
    add x0,x0,x1
    sub x3,x3,1
    cbnz x3,loop_borde_fila_cubo_izq

    // Borde derecho

    movz x3,60         // Largo del borde

    mov x0,x19          // Dirección donde se va hacer el borde izquierdo
    mov x1,60
    lsl x1,x1,2
    add x0,x0,x1


loop_borde_fila_cubo_der:      // Loop para hacer el borde

    stur w11,[x0]
    mov x1,640
    lsl x1,x1,2
    add x0,x0,x1
    sub x3,x3,1
    cbnz x3,loop_borde_fila_cubo_der

// Ojos

    movz x4,2               // Contador para ojos
    
    movz x10, CELESTE_1,lsl 16  
	movk x10, CELESTE_2, lsl 0  // Color

ojos:   
    sub x4,x4,1           // Se resta contador de ojos

    // Dirección en la que se va a hacer el ojo
	mov x0,x19
    mov x1,640
    mov x2,10
    mul x1,x1,x2
    add x1,x1,10
    lsl x1,x1,2
    add x0,x1,x19

	mov x2,15			// Altura del ojo
loop_ojo_1:
	mov x1,15           // Anchura del ojo
loop_ojo_2:
	stur w10,[x0]       // Pinta el pixel de celeste
	add x0,x0,4         // Pasa al siguiente pixel
	sub x1,x1,1         
	cbnz x1,loop_ojo_2  // Se repite hasta pintar los  pixeles de la fila
	sub x2,x2,1
	
	mov x1,625
	lsl x1,x1,2
	add x0,x0,x1       // Se mueve el x0 a la fila de abajo
	cbnz x2,loop_ojo_1  // Se repite hasta pintar todo el ojo

// Bordes del ojo  
    // Borde superior

    mov x0,x19          // Dirección donde se va a hacer el borde superior
    mov x1,640
    mov x2,10
    mul x1,x1,x2
    add x1,x1,10
    lsl x1,x1,2
    add x0,x1,x19          
    movz x3,15         // Largo del borde

loop_borde_fila_ojo_sup:      // Loop para hacer el borde

    stur w11,[x0]
    add x0,x0,4
    sub x3,x3,1
    cbnz x3,loop_borde_fila_ojo_sup

    // Borde inferior

    movz x3,16        // Largo del borde
        
    mov x0,x19          // Dirección donde se va a hacer el borde inferior
    mov x1,640
    mov x2,25
    mul x1,x1,x2
    add x1,x1,10
    lsl x1,x1,2
    add x0,x1,x19

     
    
loop_borde_fila_ojo_inf:      // Loop para hacer el borde

    stur w11,[x0]
    add x0,x0,4
    sub x3,x3,1
    cbnz x3,loop_borde_fila_ojo_inf

    // Borde izquierdo

    movz x3,15         // Largo del borde

    mov x0,x19          // Dirección donde se va a hacer el borde izquierdo
    mov x1,640
    mov x2,10
    mul x1,x1,x2
    add x1,x1,10
    lsl x1,x1,2
    add x0,x1,x19     

loop_borde_fila_ojo_izq:      // Loop para hacer el borde

    stur w11,[x0]
    mov x1,640
    lsl x1,x1,2
    add x0,x0,x1
    sub x3,x3,1
    cbnz x3,loop_borde_fila_ojo_izq

    // Borde derecho

    movz x3,15         // Largo del borde

    mov x0,x19          // Dirección donde se va a hacer el borde derecho
    mov x1,640
    mov x2,10
    mul x1,x1,x2
    add x1,x1,25
    lsl x1,x1,2
    add x0,x1,x19   

loop_borde_fila_ojo_der:      // Loop para hacer el borde

    stur w11,[x0]
    mov x1,640
    lsl x1,x1,2
    add x0,x0,x1
    sub x3,x3,1
    cbnz x3,loop_borde_fila_ojo_der


// Segundo ojo
    add x19,x19,100      // Se mueve para hacer el segundo ojo
    cbnz x4,ojos       // Hace el segundo ojo
    sub x19,x19,200     // Se resta para volver al valor original de x0

// Boca

    // Dirección en la que se va a hacer la boca
    mov x0,x19         
    mov x1,640
    mov x2,40
    mul x1,x1,x2
    add x1,x1,10
    lsl x1,x1,2
    add x0,x1,x19

    mov x2,8            // Altura de la boca
loop_boca_1:
    mov x1,40           // Anchura de la boca
loop_boca_2:
    stur w10,[x0]       // Pinta el pixel de celeste
    add x0,x0,4         // Pasa al siguiente pixel
    sub x1,x1,1          
    cbnz x1,loop_boca_2 // Se repite hasta pintar los pixeles de la fila
    sub x2,x2,1

    mov x3,600
    lsl x3,x3,2
    add x0,x0,x3       // Se mueve el x0 a la fila de abajo
    cbnz x2,loop_boca_1 // Se repite hasta pintar toda la boca

// Bordes de la boca
    // Borde superior

    mov x0,x19          // Dirección en donde se va a hacer el borde superior          
    mov x1,640
    mov x2,40
    mul x1,x1,x2
    add x1,x1,10
    lsl x1,x1,2
    add x0,x1,x19 

    movz x3,40              // Largo del borde

loop_borde_fila_boca_sup:      // Loop para hacer el borde

    stur w11,[x0]
    add x0,x0,4
    sub x3,x3,1
    cbnz x3,loop_borde_fila_boca_sup

    // Borde inferior

    movz x3,40         // Largo del borde
        
    mov x0,x19          // Dirección en donde se va a hacer el borde inferior          
    mov x1,640
    mov x2,48
    mul x1,x1,x2
    add x1,x1,10
    lsl x1,x1,2
    add x0,x1,x19     
    
loop_borde_fila_boca_inf:      // Loop para hacer el borde

    stur w11,[x0]
    add x0,x0,4
    sub x3,x3,1
    cbnz x3,loop_borde_fila_boca_inf

    // Borde izquierdo

    movz x3,8         // Largo del borde

    mov x0,x19          // Dirección en donde se va a hacer el borde izquierdo          
    mov x1,640
    mov x2,40
    mul x1,x1,x2
    add x1,x1,10
    lsl x1,x1,2
    add x0,x1,x19     

loop_borde_fila_boca_izq:      // Loop para hacer el borde

    stur w11,[x0]
    mov x1,640
    lsl x1,x1,2
    add x0,x0,x1
    sub x3,x3,1
    cbnz x3,loop_borde_fila_boca_izq

    // Borde derecho

    movz x3,9         // Largo del borde

    mov x0,x19          // Dirección donde se va a hacer el borde derecho
    mov x1,640
    mov x2,40
    mul x1,x1,x2
    add x1,x1,50
    lsl x1,x1,2
    add x0,x1,x19   

loop_borde_fila_boca_der:      // Loop para hacer el borde

    stur w11,[x0]
    mov x1,640
    lsl x1,x1,2
    add x0,x0,x1
    sub x3,x3,1
    cbnz x3,loop_borde_fila_boca_der


    ret                  // return 
