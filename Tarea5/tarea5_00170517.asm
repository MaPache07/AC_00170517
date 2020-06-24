        org 	100h

        xor     si, si
        xor     di, di
        call    grafico
        mov 	si, 100d ;Columna(X)
	    mov 	di, 50d ;Fila(Y)
	    call 	vlinea1
        mov	    si, 120d 
        mov 	di, 110d
        call 	vlinea2
        mov	    si, 120d 
        mov 	di, 70d
        call 	vlinea3
        mov	    si, 140d 
        mov 	di, 70d
        call    vlinea4
        mov	    si, 160d 
        mov 	di, 50d
        call    vlinea5
        call    kb
        int     20h

grafico:mov	    ah, 00h
	    mov	    al, 13h
	    int 	10h
	    ret

pixel:	mov	    ah, 0Ch
	    mov	    al, 1010b
	    int 	10h
	    ret

kb: 	mov	ah, 00h
	    int 	16h
	    ret

vlinea1:mov 	cx, si ;Columna
	    mov	    dx, 0d ;Fila
        add 	dx, di
        call 	pixel
        inc 	di
        cmp 	di, 160d
        jne 	vlinea1
        ret

vlinea2:mov 	cx, si
        mov	    dx, 0d
        add 	dx, di
        call 	pixel
        inc 	di
        cmp 	di, 160d
        jne 	vlinea2
        ret

vlinea3:mov 	cx, si
        mov	    dx, 0d
        add 	dx, di
        call 	pixel
        inc 	di
        cmp 	di, 90d
        jne 	vlinea3
        ret

vlinea4:mov 	cx, si
        mov	    dx, 0d
        add 	dx, di
        call 	pixel
        inc 	di
        cmp 	di, 90d
        jne 	vlinea4
        ret
    
vlinea5:mov 	cx, si
        mov	    dx, 0d
        add 	dx, di
        call 	pixel
        inc 	di
        cmp 	di, 110d
        jne 	vlinea5
        ret