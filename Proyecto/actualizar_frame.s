.equ SCREEN_PIXELS_div_2_menos_1, 153599
screen_pixels_div_2_menos_1: .dword SCREEN_PIXELS_div_2_menos_1 

actualizar_framebuffer:
    ldr x2, screen_pixels_div_2_menos_1          // Iteraciones de loop

loop_actualizarframebuffer:
    cmp x2,0
    b.lt end_loop_actualizarframebuffer
    ldr x0,[x21,x2,lsl #3]                       // Copia los colores de a 2
    str x0,[x20,x2,lsl #3]
    sub x2,x2,1
    b loop_actualizarframebuffer

    end_loop_actualizarframebuffer:
    ret
