.include "character.s"
.include "rectangles.s"
.include "triangles.s"
.include "delay.s"
.include "background.s"
.include "actualizar_frame.s"

mov_der:           // Loop movimiento derecha cubo

    mov x16,x30

loop_mov_der:
    bl background
    bl cube
    add x19,x19,4
    bl rectangles
    bl triangles
    
    bl actualizar_framebuffer
    bl crearDelay 

    sub x27,x27,1
    cbnz x27, loop_mov_der

    mov x30,x16
    ret

mov_izq:           // Loop movimiento izquierda cubo

    mov x16,x30

loop_mov_izq:
    bl background
    bl cube
    sub x19,x19,4
    bl rectangles
    bl triangles

    bl actualizar_framebuffer
    bl crearDelay 
    
    sub x27,x27,1
    cbnz x27, loop_mov_izq

    mov x30,x16
    ret


salto_der:      //// Loop salto a derecha
    mov x16,x30

loop_salto_der:           
    bl background
    bl cube
    sub x19,x19,2560
    bl cube
    sub x19,x19,2556
    bl rectangles
    bl triangles

    bl actualizar_framebuffer
    bl crearDelay 
    
    sub x27,x27,1
    cbnz x27, loop_salto_der

    mov x30,x16
    ret

salto_izq:      //// Loop salto a izquierda
    mov x16,x30

loop_salto_izq:           
    bl background
    bl cube
    sub x19,x19,2560
    bl cube
    sub x19,x19,2564
    bl rectangles
    bl triangles

    bl actualizar_framebuffer
    bl crearDelay 
    
    sub x27,x27,1
    cbnz x27, loop_salto_izq

    mov x30,x16
    ret



bajada_der:     //  Loop caida a la derecha
    mov x16,x30

loop_baj_der:           
    bl background
    bl cube
    add x19,x19,2560
    bl cube
    add x19,x19,4
    bl cube
    add x19,x19,4
    bl rectangles
    bl triangles

    bl actualizar_framebuffer
    bl crearDelay 
    
    sub x27,x27,1
    cbnz x27, loop_baj_der

    mov x30,x16
    ret


bajada_izq:     //  Loop caida a la izquierda
    mov x16,x30

loop_baj_izq:           
    bl background
    bl cube
    add x19,x19,2560
    bl cube
    sub x19,x19,4
    bl cube
    sub x19,x19,4
    bl rectangles
    bl triangles

    bl actualizar_framebuffer
    bl crearDelay 
    
    sub x27,x27,1
    cbnz x27, loop_baj_izq

    mov x30,x16
    ret

caer:           // Loop de caída en vertical
   mov x16,x30

loop_caida:           
    bl background
    bl cube
    add x19,x19,2560
    bl cube
    add x19,x19,2560
    bl rectangles
    bl triangles

    bl actualizar_framebuffer
    bl crearDelay 
    
    sub x27,x27,1
    cbnz x27, loop_caida

    mov x30,x16
    ret


mov_izq_y_caida_plat:           // Loop movimiento izquierda cubo y caida de plataformas

    mov x16,x30

loop_mov_izq_caida_plat:
    bl background
    bl cube
    sub x19,x19,4
    add x19,x19,2560
    bl rectangles
    add x12,x12,2560
    bl triangles

    bl actualizar_framebuffer
    bl crearDelay 
    
    sub x27,x27,1
    cbnz x27, loop_mov_izq_caida_plat

    mov x30,x16
    ret

salto_der_y_caida_plat:      //// Loop salto a derecha y caidas de plataforma
    mov x16,x30

loop_salto_der_caida_plat:           
    bl background
    bl cube
    sub x19,x19,2560
    bl cube
    sub x19,x19,2556
    bl rectangles
    add x12,x12,2560
    bl triangles

    bl actualizar_framebuffer
    bl crearDelay 
    
    sub x27,x27,1
    cbnz x27, loop_salto_der_caida_plat

    mov x30,x16
    ret


salto_izq_y_caida_plat:         // Loop salto a izquierda y caida de plataformas
    mov x16,x30

loop_salto_izq_caida_plat:
    bl background
    bl cube
    sub x19,x19,2560
    bl cube
    sub x19,x19,2564
    bl rectangles
    add x12,x12,2560
    bl triangles

    bl actualizar_framebuffer
    bl crearDelay 
    
    sub x27,x27,1
    cbnz x27, loop_salto_izq_caida_plat

    mov x30,x16
    ret


bajada_izq_y_caida_plat:     //  Loop caida a la izquierda y caida de plataformas
    mov x16,x30

loop_baj_izq_caida_plat:           
    bl background
    bl cube
    add x19,x19,2560
    bl cube
    sub x19,x19,4
    bl cube
    sub x19,x19,4
    bl rectangles
    add x12,x12,2560
    bl triangles

    bl actualizar_framebuffer
    bl crearDelay 
    
    sub x27,x27,1
    cbnz x27, loop_baj_izq_caida_plat

    mov x30,x16
    ret

level_complete:        // Loop para terminar nivel (Se van la plataforma con el cubo)
    mov x16,x30

    mov x3, 640	    // Dirección de rectangulo que queda
	mov x4, 180
	mul x3, x3, x4
	add x3, x3, 140
	lsl x3,x3,2
	sub x12,x12,x3                   

loop_complete:
    bl background
    bl cube
    sub x19,x19,2560
    bl cube
    bl rectangle
    sub x12,x12,2560
    bl triangles

    bl actualizar_framebuffer
    bl crearDelay 
    
    sub x27,x27,1
    cbnz x27, loop_complete

    mov x30,x16
    ret
