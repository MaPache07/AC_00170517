	    org 	100h
section .text

	    call 	texto	
	    call 	cursor
	    call 	phrase
	    call	kbwait

	    int 	20h

texto:	mov 	ah, 00h
	    mov	    al, 03h
	    int 	10h
	    ret

cursor: mov	    ah, 01h
	    mov 	ch, 00000000b
	    mov 	cl, 00001110b
	    int 	10h
	    ret

w_char:	mov 	ah, 09h
	    mov 	al, cl
	    mov 	bh, 0h
	    mov 	bl, 00001111b
	    mov 	cx, 1h
	    int 	10h
	    ret

kbwait: mov 	ax, 0000h
	    int 	16h
	    ret

cursr1: mov 	ah, 02h
	    mov 	dx, di 
	    mov 	dh, 4d
	    mov 	bh, 0h
	    int 	10h
	    ret

cursr2: mov 	ah, 02h
	    mov 	dx, di 
	    mov 	dh, 12d
	    mov 	bh, 0h
	    int 	10h
	    ret

cursr3: mov 	ah, 02h
	    mov 	dx, di 
	    mov 	dh, 20d
	    mov 	bh, 0h
	    int 	10h
	    ret

phrase:	mov 	di, 4d
lupi1:	mov 	cl, [msg1+di-4d]
	    call    cursr1
	    call 	w_char
	    inc	    di
	    cmp 	di, len1
	    jb	    lupi1
        mov 	di, 34d
lupi2:	mov 	cl, [msg2+di-34d]
	    call    cursr2
	    call 	w_char
	    inc	    di
	    cmp 	di, len2
	    jb	    lupi2
        mov 	di, 12d
lupi3:	mov 	cl, [msg3+di-12d]
	    call    cursr3
	    call 	w_char
	    inc	    di
	    cmp 	di, len3
	    jb	    lupi3
	    ret


section .data
msg1	db 	"Nunca sabes lo que tienes"
len1 	equ	$-msg1+4d
msg2	db 	"Hasta que limpias tu cuarto"
len2    equ $-msg2+34d
msg3	db 	"Pd. Estaba izi"
len3    equ $-msg3+12d