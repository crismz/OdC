.include "rectangle.s"

rectangles:
    mov x17,x30         // Guardo la dirección para volver    

    mov x9,x12

// Plataforma derecha abajo	
	cmp x12,x23				// Si x12 es mayor que x23, desaparece la plataforma (se destruyen)
	b.ge no_hacer_plat_1

    bl rectangle

// Plataforma izquierda abajo
	no_hacer_plat_1:
    sub x12,x12,1160

	cmp x12,x23
	b.ge no_hacer_plat_2

    bl rectangle

	no_hacer_plat_2:

// Plataforma izquierda arriba
    mov x3, 640			
	mov x4, 90
	mul x3, x3, x4
	add x3, x3, 90
	lsl x3,x3,2
	sub x12,x12,x3
    
	cmp x12,x23
	b.ge no_hacer_plat_3

    bl rectangle

	no_hacer_plat_3:
// Plataforma derecha arriba
	add x12,x12,1840

	cmp x12,x23
	b.ge no_hacer_plat_4
	bl rectangle

	no_hacer_plat_4:
// Plataforma centro
	mov x3, 640			
	mov x4, 90
	mul x3, x3, x4
	add x3, x3, 220
	lsl x3,x3,2
	sub x12,x12,x3

    bl rectangle



    mov x12,x9

    mov x30,x17 

    ret
