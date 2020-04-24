        org     100h

        ;Ejercicio 1
        ;carné 00046317 -> 4+6+3+1+7
        mov     ax, 0000h
        add     ax, 4d
        add     ax, 6d
        add     ax, 3d
        add     ax, 1d
        add     ax, 7d
        mov     cl, 5d
        div     cl

        ;El resultado del promedio es 4 -> "Me recupero"
        mov     cl, "M"
        mov     [200h], cl
        mov     cl, "e"
        mov     [201h], cl
        mov     [204h], cl
        mov     [208h], cl
        mov     cl, " "
        mov     [202h], cl
        mov     cl, "r"
        mov     [203h], cl
        mov     [209h], cl
        mov     cl, "c"
        mov     [205h], cl
        mov     cl, "u"
        mov     [206h], cl
        mov     cl, "p"
        mov     [207h], cl
        mov     cl, "o"
        mov     [20Ah], cl

        ;Ejercicio 2
        mov     ax, 0000h
        mov     al, 1d
        mov     bx, 210h
        mov     cl, 2d
est:    mul     cl
        mov     [bx], al
        add     bx, 1h
        cmp     bx, 216h
        jb      est

        ;Ejercicio 3
        mov     al, 1d
        mov     [220h], al  ; F0 = 1
        mov     [221h], al  ; F1 = 1
        mov     bx, 222h
fibo:   sub     bx, 2h
        mov     al, [bx]
        add     bx, 1h
        add     al, [bx]
        add     bx, 1h
        mov     [bx], al
        add     bx, 1h
        cmp     bx, 22Ch
        jb      fibo

        int 10h