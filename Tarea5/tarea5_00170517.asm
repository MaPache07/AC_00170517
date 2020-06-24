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

        mov 	si, 100d ;Columna(X)
        mov 	di, 160d ;Fila(Y)
        call 	hlinea1
        mov 	si, 100d ;Columna(X)
        mov 	di, 50d ;Fila(Y)
        call 	hlinea2
        mov 	si, 120d ;Columna(X)
        mov 	di, 70d ;Fila(Y)
        call 	hlinea3
        mov 	si, 120d ;Columna(X)
        mov 	di, 90d ;Fila(Y)
        call 	hlinea4
        mov 	si, 120d ;Columna(X)
        mov 	di, 110d ;Fila(Y)
        call 	hlinea5
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

hlinea1:mov 	cx, 0d
        add 	cx, si
        mov	    dx, di
        call 	pixel
        inc 	si
        cmp 	si, 120d
        jne 	hlinea1
        ret

hlinea2:mov 	cx, 0d
        add 	cx, si
        mov	    dx, di
        call 	pixel
        inc 	si
        cmp 	si, 160d
        jne 	hlinea2
        ret

hlinea3:mov 	cx, 0d
        add 	cx, si
        mov	    dx, di
        call 	pixel
        inc 	si
        cmp 	si, 140d
        jne 	hlinea3
        ret

hlinea4:mov 	cx, 0d
        add 	cx, si
        mov	    dx, di
        call 	pixel
        inc 	si
        cmp 	si, 140d
        jne 	hlinea4
        ret

hlinea5:mov 	cx, 0d
        add 	cx, si
        mov	    dx, di
        call 	pixel
        inc 	si
        cmp 	si, 160d
        jne 	hlinea5
        ret