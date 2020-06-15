org 	100h

section .text

        call    texto
        call    phrase

        xor 	si, si 	;lo mimso que: mov si, 0000h
lupi:	call 	kb
        cmp 	al, "$"
        je	mostrar
        mov	[300h+si], al ; CS:0300h en adelante
        inc 	si
        jmp 	lupi
        int     20h

texto:	mov 	ah, 00h
        mov	al, 03h
        int 	10h
        ret

mostrar:call    texto
        call    nota
        call 	w_strng

        call 	kb	; solo detenemos la ejecución
        int 	20h

kb: 	mov     ah, 7h
        int 	21h
        ret

nota:   mov     cx, [303h]
        add     cx, [304h]
        add     cx, [305h]
        add     cx, [306h]
        mov     ch, 0h
        add     cx, [307h]
        mov     ax, 5h
        mov     [254h], ax
        mov     [250h], cx
        div     cx
        mov     [252h], ax

w_strng:mov     ah, 13h
        mov     al, 01h
        mov     bh, 00h
        mov     bl, 00001111b
        mov     cx, si
        mov     dl, 0h
        mov     dh, 0h
        push    cs
        pop     es
        mov     bp, 300h
        int     10h
        ret

w_char:	mov 	ah, 09h
        mov 	al, cl
        mov 	bh, 0h
        mov 	bl, 00001111b
        mov 	cx, 1h
        int 	10h
        ret

cursr:  mov 	ah, 02h
        mov 	dx, di 
        mov 	dh, 0d
        mov 	bh, 0h
        int 	10h
        ret

phrase:	mov 	di, 0d
lupis:	mov 	cl, [msg+di]
        call    cursr
        call 	w_char
        inc	di
        cmp 	di, len
        jb	lupis
        ret

section .data
msg 	db 	"Ingrese su numero de carnet (presione $ para ingresar).  "
len 	equ	 $-msg
msg1    db      "Solo necesito el 0"
len1    equ     $-msg1
msg2    db      "Aun se pasa"
len2    equ     $-msg2
msg3    db      "Hay salud"
len3    equ     $-msg3
msg4    db      "Me recupero"
len4    equ     $-msg4
msg5    db      "En el segundo"
len5    equ     $-msg5
msg6    db      "Peor es nada"
len6    equ     $-msg6
msg7    db      "Muy bien"
len7    equ     $-msg7
msg8    db      "Colocho"
len8    equ     $-msg8
msg9    db      "Siempre me esfuerzo"
len9    equ     $-msg9
msg10   db      "Perfecto solo Dios"
len10   equ     $-msg10