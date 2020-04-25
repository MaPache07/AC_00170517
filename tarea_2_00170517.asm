;EJERCICIO 1.        
        org     100h

        mov ax, 0d
        add ax, 7d
        add ax, 0d
        add ax, 5d
        add ax, 1d
        add ax, 7d
        mov bx, 5d
        div bx

        cmp ax, 4d
        je notaCuatro

        int 20h

notaCuatro:  mov     cl, "M"
        mov     [200h], cl
        mov     cl, "e"
        mov     [201h], cl
        mov     cl, " "
        mov     [202h], cl
        mov     cl, "r"
        mov     [203h], cl
        mov     cl, "e"
        mov     [204h], cl
        mov     cl, "c"
        mov     [205h], cl
        mov     cl, "u"
        mov     [206h], cl
        mov     cl, "p"
        mov     [207h], cl
        mov     cl, "e"
        mov     [208h], cl
        mov     cl, "r"
        mov     [209h], cl
        mov     cl, "o"
        mov     [20Ah], cl
        int     20h

;EJERCICIO 2.
        mov si, 0d
        mov ax, 2d
        mov cx, 2d
flag1:  mul cx
        mov [si+210h], ax
        inc si
        cmp ax, 256d
        jb flag1

flag2:  mul cx
        inc si
        mov [si+210h], ax
        inc si
        cmp si, 14d 
        jb flag2
        int 20h

;EJERCICIO 3.
        mov ax, 0d
        mov si, 0d
        mov cx, 0d
        mov bx, 1d
        mov [si+220h], cx
        inc si
        mov [si+220h], bx
        inc si

fibo:   mov ax, bx
        add ax, cx
        mov [si+220h], ax
        inc si
        mov cx, bx
        mov bx, ax

        cmp si, 15d
        jb fibo

fibo2:  mov ax, bx
        add ax, cx
        inc si
        mov [si+220h], ax
        inc si
        mov cx, bx
        mov bx, ax

        cmp ax, 610d
        jb fibo2

        int 20h