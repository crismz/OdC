crearDelay:
	mov x9,x22
loop_crearDelay:
    subs x9, x9, 1
    b.ne loop_crearDelay


    ret
