org 	100h

section .text

        call    texto
        mov     dx, msg
        call    w_strng

        xor 	si, si 	;lo mimso que: mov si, 0000h
lupi:	call 	kb
        mov     cl, 30h
        sub     al, cl
        mov	[300h+si], al
        inc 	si
        cmp 	si, 5h
        je	mostrar
        jmp 	lupi
        int     20h

texto:	mov 	ah, 00h
        mov	al, 03h
        int 	10h
        ret

mostrar:call    texto
        call    nota
        call 	w_strng
        call    res
        call 	kb	; solo detenemos la ejecución
        int 	20h

kb: 	mov     ah, 1h
        int 	21h
        ret

nota:   mov     al, [300h]
        add     al, [301h]
        add     al, [302h]
        add     al, [303h]
        add     al, [304h]
        mov     cl, 5h
        mov     [310h], al
        mov     [311h], cl
        div     cl
        mov     [312h], al
        ret

res:    cmp     al, 1d
        je      phrase1
        cmp     al, 2d
        je      phrase2
        cmp     al, 3d
        je      phrase3
        cmp     al, 4d
        je      phrase4
        cmp     al, 5d
        je      phrase5
        cmp     al, 6d
        je      phrase6
        cmp     al, 7d
        je      phrase7
        cmp     al, 8d
        je      phrase8
        cmp     al, 9d
        je      phrase9
        cmp     al, 10d
        je      phrase10
        ret

phrase1:mov     dx, msg1
        call    w_strng
        int     20h

phrase2:mov     dx, msg2
        call    w_strng
        int     20h

phrase3:mov     dx, msg3
        call    w_strng
        int     20h

phrase4:mov     dx, msg4
        call    w_strng
        int     20h

phrase5:mov     dx, msg5
        call    w_strng
        int     20h

phrase6:mov     dx, msg6
        call    w_strng
        int     20h

phrase7:mov     dx, msg7
        call    w_strng
        int     20h

phrase8:mov     dx, msg8
        call    w_strng
        int     20h

phrase9:mov     dx, msg9
        call    w_strng
        int     20h

phrase10:mov     dx, msg10
        call    w_strng
        int     20h

w_strng:mov	ah, 09h
	int 	21h
	ret

section .data
msg 	db 	"Ingrese los ultimos 5 digitos de su carnet.  $"
;len 	equ	 $-msg
msg1    db      "Solo necesito el 0$"
;len1    equ     $-msg1
msg2    db      "Aun se pasa$"
;len2    equ     $-msg2
msg3    db      "Hay salud$"
;len3    equ     $-msg3
msg4    db      "Me recupero$"
;len4    equ     $-msg4
msg5    db      "En el segundo$"
;len5    equ     $-msg5
msg6    db      "Peor es nada$"
;len6    equ     $-msg6
msg7    db      "Muy bien$"
;len7    equ     $-msg7
msg8    db      "Colocho$"
;len8    equ     $-msg8
msg9    db      "Siempre me esfuerzo$"
;len9    equ     $-msg9
msg10   db      "Perfecto solo Dios$"
;len10   equ     $-msg10