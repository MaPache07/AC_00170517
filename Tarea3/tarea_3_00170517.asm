	org 	100h

section .text

	call 	texto	
	call 	cursor
	call 	phrase
	call	kbwait

	int 	20h

texto:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

cursor: mov	ah, 01h
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

m_cursr:mov 	ah, 02h
	mov 	dx, di 
	mov 	dh, 5d
	mov 	bh, 0h
	int 	10h
	ret

phrase:	mov 	di, 4d
lupi1:	mov 	cl, [msg1+di-4d]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len1
	jb	lupi1
	ret


section .data
msg1	db 	"Coronavirus, Coronavirus"
len1 	equ	$-msg1+4d
msg2	db 	"Lavense las manos"
len2    equ $-msg2
msg3	db 	"Aganlo seguido"
len3    equ $-msg3