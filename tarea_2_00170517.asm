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