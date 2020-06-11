org 	100h

section .text

	mov 	dx, msg
	call 	w_strng

	xor 	si, si 	;lo mimso que: mov si, 0000h
lupi:	call 	kb
	cmp 	al, "$"
	je	avgprev
        sub     al, 30h
	mov	[300h+si], al ; CS:0300h en adelante
	inc 	si
	jmp 	lupi

avgprev:mov     bx, 0000h
        mov     ax, 0000h
avg:    add     al, [300h+bx]
        inc     bx
        cmp     bx, 05h
        jb      avg
        mov     [310h], al
        mov     [320h], bl
        mov     cl, bl
        div     cl
        mov     [330h], al

mostrar:mov 	dx, nl
	call	w_strng
	cmp     al, 0Ah
        je      txta
        cmp     al, 09h
        je      txtb
        cmp     al, 08h
        je      txtc
        cmp     al, 07h
        je      txtd
        cmp     al, 06h
        je      txte
        cmp     al, 05h
        je      txtf
        cmp     al, 04h
        je      txtg
        cmp     al, 03h
        je      txth
        cmp     al, 02h
        je      txti
        cmp     al, 01h
        je      txtj
txta:	mov 	dx, msga
        jmp     comm
txtb:	mov 	dx, msgb
        jmp     comm
txtc:	mov 	dx, msgc
        jmp     comm
txtd:	mov 	dx, msgd
        jmp     comm
txte:	mov 	dx, msge
        jmp     comm
txtf:	mov 	dx, msgf
        jmp     comm
txtg:	mov 	dx, msgg
        jmp     comm
txth:	mov 	dx, msgh
        jmp     comm
txti:	mov 	dx, msgi
        jmp     comm
txtj:	mov 	dx, msgj
        jmp     comm
	
comm:   call 	w_strng
	call 	kb	; solo detenemos la ejecución
	int 	20h


texto:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

kb: 	mov	ah, 1h
	int 	21h
	ret

w_strng:mov	ah, 09h
	int 	21h
	ret

section .data

msg 	db 	"Ingrese los ultimos 5 digitos de su carne: $"
msga 	db 	"Perfecto solo Dios$"
msgb 	db 	"Siempre me esfuerzo$"
msgc 	db 	"Colocho$"
msgd 	db 	"Muy bien$"
msge 	db 	"Peor es nada$"
msgf 	db 	"En el segundo$"
msgg 	db 	"Me recupero$"
msgh 	db 	"Hay salud$"
msgi 	db 	"Aun se pasa$"
msgj 	db 	"Solo necesito el 0$"
nl	db 	0xA, 0xD, "$"