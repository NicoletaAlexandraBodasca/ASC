
;3. Sa se afiseze data curenta si ziua curenta din saptamana (in litere).

assume cs:code,ds:data

data segment
	z db ?
	zz db ?
	l db ?
	ll db ?
	dpuncte db ':$'
	a db  ?
	b db ?
	c db ?
	d db ?
	;linie_noua db 10,13,'$'
	ziua db ?
	day db ?
	luna db ?
	an dw ?
	ziua0 db 'Sunday ','$'
	ziua1 db 'Monday ','$'
	ziua2 db 'Tuesday ','$'
	ziua3 db 'Wednesday ','$'
	ziua4 db 'Thursday ','$'
	ziua5 db 'Friday ','$'
	ziua6 db 'Saturday ','$'

data ends

code segment
start:
	mov ax,data
	mov ds,ax
	
	mov ah,2Ah
	int 21h  ;dl=day,
			;dh=month
			;cx=year
			;al=day of the week
	
	mov ziua,al
	mov day,dl
	mov luna,dh
	mov an,cx
	
	
		
	cmp al,0
	je afiseazaDum
	cmp al,1
	je afiseazaLuni
	cmp al,2
	je afiseazaMarti
	cmp al,3
	je afiseazaMie
	cmp al,4
	je afiseazaJoi
	cmp al,5
	je afiseazaVin
	cmp al,6
	je afiseazaSam
	
	afiseazaDum:
		mov ah,09h
		mov dx,offset ziua0
		int 21h
		jmp gata
		
	
	
	afiseazaLuni:
		mov ah,09h
		mov dx,offset ziua1
		int 21h
		jmp gata
		
	
	
	afiseazaMarti:
		mov ah,09h
		mov dx,offset ziua2
		int 21h
		jmp gata
		
	
	
	afiseazaMie:
		mov ah,09h
		mov dx,offset ziua3
		int 21h
		jmp gata
	
	
	afiseazaJoi:
		mov ah,09h
		mov dx,offset ziua4
		int 21h
		jmp gata
	

	afiseazaVin:
		mov ah,09h
		mov dx,offset ziua5
		int 21h
		jmp gata
		

	
	afiseazaSam:
		mov ah,09h
		mov dx,offset ziua6
		int 21h
		jmp gata
		
	
	gata:
	
	
;	mov ah,09h 
;	mov dx, offset dpuncte
;	int 21h    ;afisare doua puncte
	
	
	mov al,day	
	;mov al,dl
	mov ah,0 ;ax=ziua
	mov bl,10
	div bl    ;al-cat, ah-rest
	
	mov dl,al  ;dl=cat
	add dl,'0'  ;transform in caracter ASCII
	mov z,dl    ;z-prima cifra din ziua
	
	mov dl, ah  ;dl-a doua cifra din zi
	add dl,'0'   ;transform in caracter ASCII
	mov zz, dl   ; zz-a doua cifra din ziua

	mov dl,z
	mov ah,02h
	int 21h    ;afisare prima cifra din zi
	
	mov ah,02h
	mov dl,zz
	int 21h   ;afisare a doua cifra din zi 
	
	
	mov al,luna
	;mov al,dh ;dl=luna
	mov ah,0   ;dx=luna
	mov bl,10
	div bl   ;al-cat,ah-rest
	
	mov dl,al
	add dl,'0'
	mov l,dl  ;l-prima cifra din luna
	
	
	mov dl,ah
	add dl,'0'
	mov ll,dl  ;ll-a doua cifra din luna
	
	
	
	mov ah,09h 
	mov dx, offset dpuncte
	int 21h    ;afisare doua puncte
	
	
	mov ah,02h
	mov dl,l
	int 21h   ;afisare prima cifra din luna 
	
	mov ah,02h
	mov dl,ll
	int 21h    ;afisare a doua cifra din luna 
	
	
	
	mov ah,09h 
	mov dx, offset dpuncte
	int 21h    ;afisare doua puncte
	
	

	
	mov ax,an
	;mov dx,ax
	mov bl,10
	div bl  ; al-cat, ah-rest
	mov a, ah  ;a=9
	;shr dx,1
	mov ah,0
	div bl
	mov b, ah  ;b=1
	;shr dx,1
	mov ah,0
	div bl
	mov c,ah ; c=0
	;shr dx,1
	;mov ax,0
	mov d,al  ;d=2
	
	
	
	mov ah,02h
	mov dl,d
	add dl,'0'
	int 21h
	
	mov ah,02h
	mov dl,c
	add dl,'0'
	int 21h
	
	mov ah,02h
	mov dl,b
	add dl,'0'
	int 21h
	
	mov ah,02h
	mov dl,a
	add dl,'0'
	int 21h
	
	

	
	
	
	mov ax, 4c00h
	int 21h
	code ends

	end start
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	