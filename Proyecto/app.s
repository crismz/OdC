.include "animation.s"


.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
.equ BITS_PER_PIXEL,  	32
.equ SCREEN_PIXELS,		SCREEN_WIDTH * SCREEN_HEIGH
.equ BYTES_FRAMEBUFFER, 9830400			// Tamaño del framebuffer en bytes, (640*480)  * 32


.data
bufferSecundario: .skip BYTES_FRAMEBUFFER


.globl main

main:
	// X0 contiene la direccion base del framebuffer
 	mov x20, x0	// Save framebuffer base address to x20	
	//---------------- CODE HERE ------------------------------------

/*	Registros   x0 = Pixel
				x1,x2 = iteraciones
				x3 al x9 = Calculos auxiliares
				x10 al x11 = colores
				x12 = Dirección del rectángulo
				x13 = Dirección del triángulo
				x19 = Dirección del cubo
				x21 = Dirección framebuffer secundario
				x22 = Parametro para delay
				x23 = Parametro para detener rectángulos
				x27 = Movimiento de las figuras		 
				x15,x16,x17 = Para guardar bl 

 */


	// Probar cambiando la magnitud del delay para lograr que vaya a una velocidad media (Nosotros lo acomodamos segun como anda en nuestras compus)
	movz x22,0x0000,lsl 16
	movk x22,0x0001,lsl 00


	ldr x21, = bufferSecundario

	// Dirección en la que se va a hacer el cubo, se guarda el en el x19
	mov x3, SCREEN_WIDTH
    mov x4, 300
	mul x3, x3, x4
	add x3, x3, 290
	lsl x3,x3,2
	add x19,x3,x21

    // Dirección en la que se va a hacer el rectángulo, se guarda en x12
	mov x3, SCREEN_WIDTH			
	mov x4, 270
	mul x3, x3, x4
	add x3, x3, 420
	lsl x3,x3,2
	add x12,x3,x21

	// Para guardar altura del piso y donde va a desaparecer el rectángulo
	mov x3, SCREEN_WIDTH			
	mov x4, 330
	mul x3, x3, x4
	lsl x3,x3,2
	add x23,x3,x21

    // Dirección en la que se va a hacer el triángulo, se guarda en x13
    mov x3, SCREEN_WIDTH			
	mov x4, 330
	mul x3, x3, x4
	add x3, x3, 610
	lsl x3,x3,2
	add x13,x3,x21

	// Salto a primera plataforma

    // x27 para la duración  de los loop
    mov x27,15	
    bl mov_der
	mov x27,50
	bl salto_der
	mov x27,9
	bl bajada_der
	mov x27,15
	bl mov_der
	mov x27,50
	bl salto_der
	mov x27,9
	bl bajada_der
	mov x27,15
	bl mov_der
	mov x27,10
	bl mov_izq
	mov x27,60
	bl salto_izq
	mov x27, 30
	bl bajada_izq
	mov x27, 65
	bl mov_izq
	mov x27,10
	bl salto_izq
	mov x27,110
	bl bajada_izq
	mov x27,30
	bl mov_der
	mov x27,10
	bl salto_der
	mov x27,50
	bl bajada_der
	mov x27,31
	bl caer
	mov x27,10
	bl salto_der
	mov x27,50
	bl bajada_der
	mov x27,30
	bl caer	
	mov x27,30
	bl mov_izq
	mov x27,50
	bl salto_izq
	mov x27,9
	bl bajada_izq
	mov x27,40
	bl mov_izq_y_caida_plat
	mov x27,30
	bl salto_izq_y_caida_plat
	mov x27,50
	bl mov_izq_y_caida_plat
	mov x27,60
	bl salto_der_y_caida_plat
	mov x27,75
	bl bajada_der
	mov x27,8
	bl caer
	mov x27,320
	bl level_complete

	//---------------------------------------------------------------
	// Infinite Loop 

InfLoop: 
	b InfLoop
