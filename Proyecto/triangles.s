.include "triangle.s"

triangles:
    mov x17,x30         // Guardo la dirección para volver

	movz x10, 0x20, lsl 16      // Color triángulo
	movk x10, 0xB597, lsl 00

    movz x11, 0xFF, lsl 16
	movk x11, 0xFFFF, lsl 00
 


    mov x8,x13
    mov x6,3
loop_triangles_der:
    bl triangle
    sub x13,x13,240

    sub x6,x6,1
    cbnz x6,loop_triangles_der

    mov x6,3
    sub x13,x13,1600
loop_triangles_izq:
    bl triangle
    add x13,x13,240

    sub x6,x6,1
    cbnz x6,loop_triangles_izq


    mov x13,x8
    mov x30,x17
    ret
