triangle:
	mov x1,30		// Altura del triangulo

	movz x4,1		// Contador para que termine, que va a restar al x0

loop_triangle_start:
    mov x0,x13       // Se guarda en x0 el inicio del triangulo para luego ser modificado
    sub x5,x4,1       // Guardo en x5 para hacer la linea del triangulo en x4 altura, se le resta uno para comenzar de cero
    
    
    
    cbz x5,no_multiply
    
    loop_multiply:
    add x0,x0,2556
    str x11,[x0]    // Hace borde izquierdo
    sub x5,x5,1
    cbnz x5,loop_multiply

    no_multiply:
    
	mov x2,x4		// Contador para el tamaño de la linea
    lsl x2,x2,1
    sub x2,x2,1

    mov x7,x0       // Termina guardando una dirección que va a servir para el borde de abajo

loop_triangle:		// Loop para que pinte fila por fila el triangulo
	str x10,[x0]
	add x0,x0,4
	sub x2,x2,1
	cbnz x2,loop_triangle	

    
	
	add x4,x4,1	        // Se suma uno al contador
	sub x1,x1,1	        // Pasa a la proxima fila


	cbnz x1,loop_triangle_start


// Borde de diagonal derecha
    mov x0,x13
    mov x2,30
loop_diag:
    str x11,[x0]
    add x0,x0,2564
    sub x2,x2,1
    cbnz x2,loop_diag

// Borde de abajo
    mov x2,59
loop_borde_abajo:
    str x11,[x7]
    add x7,x7,4
    sub x2,x2,1
    cbnz x2,loop_borde_abajo

    ret
