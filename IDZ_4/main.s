	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	size
	.section	.rodata
	.align 4
	.type	size, @object
	.size	size, 4
size:
	.long	5000
	.text
	.globl	charEnd
	.type	charEnd, @function
charEnd:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	mov	eax, esi
	mov	BYTE PTR -12[rbp], al
	mov	rax, QWORD PTR -8[rbp]
	mov	edx, DWORD PTR 8[rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 12[rax]
	cmp	edx, eax
	jne	.L2
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 12[rax]
	lea	edx, 2[rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR 12[rax], edx
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 12[rax]
	movsx	rdx, eax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rsi, rdx
	mov	rdi, rax
	call	realloc@PLT
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR [rdx], rax
.L2:
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 8[rax]
	cdqe
	add	rdx, rax
	movzx	eax, BYTE PTR -12[rbp]
	mov	BYTE PTR [rdx], al
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 8[rax]
	lea	edx, 1[rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR 8[rax], edx
	nop
	leave
	ret
	.size	charEnd, .-charEnd
	.globl	newString
	.type	newString, @function
newString:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	QWORD PTR -40[rbp], rdi
	mov	edi, 16
	call	malloc@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	mov	DWORD PTR 12[rax], 1
	mov	rax, QWORD PTR -16[rbp]
	mov	DWORD PTR 8[rax], 0
	mov	rax, QWORD PTR -16[rbp]
	mov	eax, DWORD PTR 12[rax]
	cdqe
	mov	rdi, rax
	call	malloc@PLT
	mov	rdx, rax
	mov	rax, QWORD PTR -16[rbp]
	mov	QWORD PTR [rax], rdx
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	strlen@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	QWORD PTR -24[rbp], 0
	jmp	.L4
.L5:
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	edx, al
	mov	rax, QWORD PTR -16[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	charEnd
	add	QWORD PTR -24[rbp], 1
.L4:
	mov	rax, QWORD PTR -24[rbp]
	cmp	rax, QWORD PTR -8[rbp]
	jb	.L5
	mov	rax, QWORD PTR -16[rbp]
	leave
	ret
	.size	newString, .-newString
	.section	.rodata
.LC0:
	.string	""
	.text
	.globl	change
	.type	change, @function
change:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	lea	rax, .LC0[rip]
	mov	rdi, rax
	call	newString
	mov	QWORD PTR -8[rbp], rax
	mov	DWORD PTR -12[rbp], 0
	jmp	.L8
.L22:
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 97
	jne	.L9
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 48
	mov	rdi, rax
	call	charEnd
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 120
	mov	rdi, rax
	call	charEnd
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 54
	mov	rdi, rax
	call	charEnd
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 49
	mov	rdi, rax
	call	charEnd
	jmp	.L10
.L9:
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 101
	jne	.L11
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 48
	mov	rdi, rax
	call	charEnd
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 120
	mov	rdi, rax
	call	charEnd
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 54
	mov	rdi, rax
	call	charEnd
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 53
	mov	rdi, rax
	call	charEnd
	jmp	.L10
.L11:
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 105
	jne	.L12
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 48
	mov	rdi, rax
	call	charEnd
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 120
	mov	rdi, rax
	call	charEnd
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 54
	mov	rdi, rax
	call	charEnd
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 57
	mov	rdi, rax
	call	charEnd
	jmp	.L10
.L12:
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 111
	jne	.L13
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 48
	mov	rdi, rax
	call	charEnd
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 120
	mov	rdi, rax
	call	charEnd
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 54
	mov	rdi, rax
	call	charEnd
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 102
	mov	rdi, rax
	call	charEnd
	jmp	.L10
.L13:
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 117
	jne	.L14
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 48
	mov	rdi, rax
	call	charEnd
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 120
	mov	rdi, rax
	call	charEnd
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 55
	mov	rdi, rax
	call	charEnd
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 53
	mov	rdi, rax
	call	charEnd
	jmp	.L10
.L14:
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 121
	jne	.L15
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 48
	mov	rdi, rax
	call	charEnd
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 120
	mov	rdi, rax
	call	charEnd
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 55
	mov	rdi, rax
	call	charEnd
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 57
	mov	rdi, rax
	call	charEnd
	jmp	.L10
.L15:
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 65
	jne	.L16
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 48
	mov	rdi, rax
	call	charEnd
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 120
	mov	rdi, rax
	call	charEnd
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 52
	mov	rdi, rax
	call	charEnd
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 49
	mov	rdi, rax
	call	charEnd
	jmp	.L10
.L16:
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 69
	jne	.L17
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 48
	mov	rdi, rax
	call	charEnd
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 120
	mov	rdi, rax
	call	charEnd
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 52
	mov	rdi, rax
	call	charEnd
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 53
	mov	rdi, rax
	call	charEnd
	jmp	.L10
.L17:
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 73
	jne	.L18
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 48
	mov	rdi, rax
	call	charEnd
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 120
	mov	rdi, rax
	call	charEnd
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 52
	mov	rdi, rax
	call	charEnd
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 57
	mov	rdi, rax
	call	charEnd
	jmp	.L10
.L18:
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 79
	jne	.L19
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 48
	mov	rdi, rax
	call	charEnd
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 120
	mov	rdi, rax
	call	charEnd
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 52
	mov	rdi, rax
	call	charEnd
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 102
	mov	rdi, rax
	call	charEnd
	jmp	.L10
.L19:
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 85
	jne	.L20
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 48
	mov	rdi, rax
	call	charEnd
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 120
	mov	rdi, rax
	call	charEnd
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 53
	mov	rdi, rax
	call	charEnd
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 53
	mov	rdi, rax
	call	charEnd
	jmp	.L10
.L20:
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 89
	jne	.L21
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 48
	mov	rdi, rax
	call	charEnd
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 120
	mov	rdi, rax
	call	charEnd
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 53
	mov	rdi, rax
	call	charEnd
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 57
	mov	rdi, rax
	call	charEnd
	jmp	.L10
.L21:
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	edx, al
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	charEnd
.L10:
	add	DWORD PTR -12[rbp], 1
.L8:
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR 8[rax]
	cmp	DWORD PTR -12[rbp], eax
	jl	.L22
	mov	rax, QWORD PTR -8[rbp]
	leave
	ret
	.size	change, .-change
	.section	.rodata
	.align 8
.LC1:
	.string	"\320\237\320\265\321\200\320\262\321\213\320\271 \320\277\321\200\320\276\321\206\320\265\321\201\321\201 \320\275\320\265 \320\274\320\276\320\266\320\265\321\202 \321\201\321\207\320\270\321\202\320\260\321\202\321\214"
	.align 8
.LC2:
	.string	"\320\237\320\265\321\200\320\262\321\213\320\271 \320\277\321\200\320\276\321\206\320\265\321\201\321\201 \320\275\320\265 \320\274\320\276\320\266\320\265\321\202 \321\201\321\207\320\270\321\202\320\260\321\202\321\214 %s"
	.align 8
.LC3:
	.string	"\320\237\320\265\321\200\320\262\321\213\320\271 \320\277\321\200\320\276\321\206\320\265\321\201\321\201 \320\275\320\265 \320\274\320\276\320\266\320\265\321\202 \320\267\320\260\320\277\320\270\321\201\320\260\321\202\321\214 \320\262\321\201\320\265"
	.align 8
.LC4:
	.string	"\320\237\320\265\321\200\320\262\321\213\320\271 \320\277\321\200\320\276\321\206\320\265\321\201\321\201 \320\275\320\265 \320\274\320\276\320\266\320\265\321\202 \320\267\320\260\320\277\320\270\321\201\320\260\321\202\321\214"
	.align 8
.LC5:
	.string	"\320\237\320\265\321\200\320\262\321\213\320\271 \320\277\321\200\320\276\321\206\320\265\321\201\321\201 \320\275\320\265 \320\274\320\276\320\266\320\265\321\202 \320\267\320\260\320\272\321\200\321\213\321\202\321\214 %s\n"
	.text
	.globl	firstProcess
	.type	firstProcess, @function
firstProcess:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	QWORD PTR -40[rbp], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR [rax]
	shr	eax, 31
	movzx	eax, al
	mov	edi, eax
	call	close@PLT
	test	eax, eax
	je	.L25
	lea	rax, .LC1[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	jmp	.L26
.L25:
	mov	rax, QWORD PTR -32[rbp]
	mov	esi, 0
	mov	rdi, rax
	mov	eax, 0
	call	open@PLT
	mov	DWORD PTR -12[rbp], eax
	cmp	DWORD PTR -12[rbp], 0
	jns	.L28
	mov	rax, QWORD PTR -32[rbp]
	mov	rsi, rax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L26
.L29:
	mov	rax, QWORD PTR -24[rbp]
	add	rax, 4
	mov	eax, DWORD PTR [rax]
	mov	rdx, QWORD PTR -8[rbp]
	mov	rcx, QWORD PTR -40[rbp]
	mov	rsi, rcx
	mov	edi, eax
	call	write@PLT
	mov	rdx, QWORD PTR -8[rbp]
	cmp	rax, rdx
	je	.L28
	lea	rax, .LC3[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	jmp	.L26
.L28:
	mov	eax, 5000
	movsx	rdx, eax
	mov	rcx, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR -12[rbp]
	mov	rsi, rcx
	mov	edi, eax
	call	read@PLT
	mov	QWORD PTR -8[rbp], rax
	cmp	QWORD PTR -8[rbp], 0
	jne	.L29
	mov	rax, QWORD PTR -24[rbp]
	add	rax, 4
	mov	eax, DWORD PTR [rax]
	mov	edi, eax
	call	close@PLT
	test	eax, eax
	jns	.L30
	lea	rax, .LC4[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	jmp	.L26
.L30:
	mov	eax, DWORD PTR -12[rbp]
	mov	edi, eax
	call	close@PLT
	test	eax, eax
	jns	.L31
	mov	rax, QWORD PTR -32[rbp]
	mov	rsi, rax
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L26
.L31:
	mov	eax, 1
.L26:
	leave
	ret
	.size	firstProcess, .-firstProcess
	.section	.rodata
	.align 8
.LC6:
	.string	"\320\222\321\202\320\276\321\200\320\276\320\271 \320\277\320\276\320\264\320\277\321\200\320\276\321\206\320\265\321\201\321\201 \320\275\320\265 \320\274\320\276\320\266\320\265\321\202 \321\201\321\207\320\270\321\202\320\260\321\202\321\214"
	.align 8
.LC7:
	.string	"\320\222\321\202\320\276\321\200\320\276\320\271 \320\277\320\276\320\264\320\277\321\200\320\276\321\206\320\265\321\201\321\201 \320\275\320\265 \320\274\320\276\320\266\320\265\321\202 \320\267\320\260\320\277\320\270\321\201\320\260\321\202\321\214 \320\262\321\201\320\265"
	.align 8
.LC8:
	.string	"\320\222\321\202\320\276\321\200\320\276\320\271 \320\277\320\276\320\264\320\277\321\200\320\276\321\206\320\265\321\201\321\201 \320\275\320\265 \320\274\320\276\320\266\320\265\321\202 \320\267\320\260\320\277\320\270\321\201\320\260\321\202\321\214"
	.text
	.globl	secondProcessChild
	.type	secondProcessChild, @function
secondProcessChild:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	mov	QWORD PTR -16[rbp], rsi
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	shr	eax, 31
	movzx	eax, al
	mov	edi, eax
	call	close@PLT
	test	eax, eax
	je	.L33
	lea	rax, .LC6[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	jmp	.L34
.L33:
	mov	rax, QWORD PTR -16[rbp]
	mov	eax, DWORD PTR 8[rax]
	movsx	rdx, eax
	mov	rax, QWORD PTR -16[rbp]
	mov	rcx, QWORD PTR [rax]
	mov	rax, QWORD PTR -8[rbp]
	add	rax, 4
	mov	eax, DWORD PTR [rax]
	mov	rsi, rcx
	mov	edi, eax
	call	write@PLT
	mov	rdx, QWORD PTR -16[rbp]
	mov	edx, DWORD PTR 8[rdx]
	movsx	rdx, edx
	cmp	rax, rdx
	je	.L35
	lea	rax, .LC7[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	jmp	.L34
.L35:
	mov	rax, QWORD PTR -8[rbp]
	add	rax, 4
	mov	eax, DWORD PTR [rax]
	mov	edi, eax
	call	close@PLT
	test	eax, eax
	jns	.L36
	lea	rax, .LC8[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	jmp	.L34
.L36:
	mov	eax, 1
.L34:
	leave
	ret
	.size	secondProcessChild, .-secondProcessChild
	.section	.rodata
	.align 8
.LC9:
	.string	"\320\242\321\200\320\265\321\202\320\270\320\271 \320\277\321\200\320\276\321\206\320\265\321\201\321\201 \320\275\320\265 \320\274\320\276\320\266\320\265\321\202 \320\267\320\260\320\272\321\200\321\213\321\202\321\214"
	.align 8
.LC10:
	.string	"\320\242\321\200\320\265\321\202\320\270\320\271 \320\277\321\200\320\276\321\206\320\265\321\201\321\201 \320\275\320\265 \320\274\320\276\320\266\320\265\321\202 \320\276\321\202\320\272\321\200\321\213\321\202\321\214 \321\204\320\260\320\271\320\273 %s \320\264\320\273\321\217 \320\267\320\260\320\277\320\270\321\201\320\270"
	.align 8
.LC11:
	.string	"\320\242\321\200\320\265\321\202\320\270\320\271 \320\277\321\200\320\276\321\206\320\265\321\201\321\201 \320\275\320\265 \320\274\320\276\320\266\320\265\321\202 \320\267\320\260\320\277\320\270\321\201\320\260\321\202\321\214 \320\262\321\201\320\265"
	.text
	.globl	thirdProcess
	.type	thirdProcess, @function
thirdProcess:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	QWORD PTR -40[rbp], rdx
	mov	rax, QWORD PTR -24[rbp]
	add	rax, 4
	mov	eax, DWORD PTR [rax]
	mov	edi, eax
	call	close@PLT
	test	eax, eax
	jns	.L38
	lea	rax, .LC9[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	jmp	.L39
.L38:
	mov	rax, QWORD PTR -32[rbp]
	mov	edx, 438
	mov	esi, 577
	mov	rdi, rax
	mov	eax, 0
	call	open@PLT
	mov	DWORD PTR -12[rbp], eax
	cmp	DWORD PTR -12[rbp], 0
	jns	.L41
	mov	rax, QWORD PTR -32[rbp]
	mov	rsi, rax
	lea	rax, .LC10[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L39
.L42:
	mov	rdx, QWORD PTR -8[rbp]
	mov	rcx, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR -12[rbp]
	mov	rsi, rcx
	mov	edi, eax
	call	write@PLT
	mov	rdx, QWORD PTR -8[rbp]
	cmp	rax, rdx
	je	.L41
	lea	rax, .LC11[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	jmp	.L39
.L41:
	mov	eax, 5000
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR [rax]
	mov	rcx, QWORD PTR -40[rbp]
	mov	rsi, rcx
	mov	edi, eax
	call	read@PLT
	mov	QWORD PTR -8[rbp], rax
	cmp	QWORD PTR -8[rbp], 0
	jne	.L42
	mov	eax, 1
.L39:
	leave
	ret
	.size	thirdProcess, .-thirdProcess
	.section	.rodata
	.align 8
.LC12:
	.string	"\320\222\321\202\320\276\321\200\320\276\320\271 \320\277\321\200\320\276\321\206\320\265\321\201\321\201 \320\275\320\265 \320\274\320\276\320\266\320\265\321\202 \320\267\320\260\320\277\320\270\321\201\320\260\321\202\321\214"
	.align 8
.LC13:
	.string	"\320\222\321\202\320\276\321\200\320\276\320\271 \320\277\321\200\320\276\321\206\320\265\321\201\321\201 \320\275\320\265 \320\274\320\276\320\266\320\265\321\202 \321\201\321\207\320\270\321\202\320\260\321\202\321\214"
	.align 8
.LC14:
	.string	"\320\235\320\265 \320\277\320\276\320\273\321\203\321\207\320\270\320\273\320\276\321\201\321\214 \321\200\320\260\320\267\320\264\320\265\320\273\320\270\321\202\321\214"
	.align 8
.LC15:
	.string	"\320\222\321\213\321\205\320\276\320\264\320\270\320\274 \320\270\320\267 \320\262\321\202\320\276\321\200\320\276\320\263\320\276 \320\277\320\276\320\264\320\277\321\200\320\276\321\206\320\265\321\201\321\201\320\260 "
	.align 8
.LC16:
	.string	"\320\222\321\213\321\205\320\276\320\264\320\270\320\274 \320\270\320\267 \321\202\321\200\320\265\321\202\321\214\320\265\320\263\320\276"
	.text
	.globl	secondProcess
	.type	secondProcess, @function
secondProcess:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 64
	mov	QWORD PTR -40[rbp], rdi
	mov	QWORD PTR -48[rbp], rsi
	mov	QWORD PTR -56[rbp], rdx
	mov	rax, QWORD PTR -40[rbp]
	add	rax, 4
	mov	eax, DWORD PTR [rax]
	mov	edi, eax
	call	close@PLT
	test	eax, eax
	jns	.L44
	lea	rax, .LC12[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	jmp	.L45
.L44:
	lea	rax, .LC0[rip]
	mov	rdi, rax
	call	newString
	mov	QWORD PTR -24[rbp], rax
	jmp	.L46
.L49:
	mov	DWORD PTR -32[rbp], 0
	jmp	.L47
.L48:
	mov	eax, DWORD PTR -32[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -56[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	edx, al
	mov	rax, QWORD PTR -24[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	charEnd
	add	DWORD PTR -32[rbp], 1
.L47:
	mov	eax, DWORD PTR -32[rbp]
	cdqe
	cmp	QWORD PTR -16[rbp], rax
	ja	.L48
.L46:
	mov	eax, 5000
	movsx	rdx, eax
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR [rax]
	mov	rcx, QWORD PTR -56[rbp]
	mov	rsi, rcx
	mov	edi, eax
	call	read@PLT
	mov	QWORD PTR -16[rbp], rax
	cmp	QWORD PTR -16[rbp], 0
	jne	.L49
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	change
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR [rax]
	mov	edi, eax
	call	close@PLT
	test	eax, eax
	jns	.L50
	lea	rax, .LC13[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	jmp	.L45
.L50:
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	pipe@PLT
	call	fork@PLT
	mov	DWORD PTR -28[rbp], eax
	cmp	DWORD PTR -28[rbp], 0
	jns	.L51
	lea	rax, .LC14[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	jmp	.L45
.L51:
	cmp	DWORD PTR -28[rbp], 0
	jle	.L52
	mov	rdx, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR -40[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	secondProcessChild
	test	eax, eax
	jne	.L53
	mov	eax, 0
	jmp	.L45
.L53:
	lea	rax, .LC15[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 1
	jmp	.L45
.L52:
	mov	rdx, QWORD PTR -56[rbp]
	mov	rcx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -40[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	thirdProcess
	test	eax, eax
	jne	.L54
	mov	eax, 0
	jmp	.L45
.L54:
	lea	rax, .LC16[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 1
.L45:
	leave
	ret
	.size	secondProcess, .-secondProcess
	.section	.rodata
	.align 8
.LC17:
	.string	"\320\222\321\213\321\205\320\276\320\264\320\270\320\274 \320\270\320\267 \320\277\320\265\321\200\320\262\320\276\320\263\320\276"
	.align 8
.LC18:
	.string	"\320\222\321\213\321\205\320\276\320\264\320\270\320\274 \320\270\320\267 \320\262\321\202\320\276\321\200\320\276\320\263\320\276"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 88
	mov	DWORD PTR -116[rbp], edi
	mov	QWORD PTR -128[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -56[rbp], rax
	xor	eax, eax
	mov	rax, rsp
	mov	rbx, rax
	mov	edi, 0
	call	umask@PLT
	mov	rax, QWORD PTR -128[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR -128[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	QWORD PTR -88[rbp], rax
	mov	eax, 5000
	cdqe
	sub	rax, 1
	mov	QWORD PTR -80[rbp], rax
	mov	eax, 5000
	cdqe
	mov	r14, rax
	mov	r15d, 0
	mov	eax, 5000
	cdqe
	mov	r12, rax
	mov	r13d, 0
	mov	eax, 5000
	cdqe
	mov	edx, 16
	sub	rdx, 1
	add	rax, rdx
	mov	esi, 16
	mov	edx, 0
	div	rsi
	imul	rax, rax, 16
	mov	rcx, rax
	and	rcx, -4096
	mov	rdx, rsp
	sub	rdx, rcx
.L56:
	cmp	rsp, rdx
	je	.L57
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L56
.L57:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L58
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L58:
	mov	rax, rsp
	add	rax, 0
	mov	QWORD PTR -72[rbp], rax
	lea	rax, -64[rbp]
	mov	rdi, rax
	call	pipe@PLT
	call	fork@PLT
	mov	DWORD PTR -100[rbp], eax
	cmp	DWORD PTR -100[rbp], 0
	jns	.L59
	lea	rax, .LC14[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	edi, -1
	call	exit@PLT
.L59:
	cmp	DWORD PTR -100[rbp], 0
	jle	.L60
	mov	rdx, QWORD PTR -72[rbp]
	mov	rcx, QWORD PTR -96[rbp]
	lea	rax, -64[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	firstProcess
	test	eax, eax
	jne	.L61
	mov	edi, -1
	call	exit@PLT
.L61:
	lea	rax, .LC17[rip]
	mov	rdi, rax
	call	puts@PLT
	jmp	.L62
.L60:
	mov	rdx, QWORD PTR -72[rbp]
	mov	rcx, QWORD PTR -88[rbp]
	lea	rax, -64[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	secondProcess
	test	eax, eax
	jne	.L63
	mov	edi, -1
	call	exit@PLT
.L63:
	lea	rax, .LC18[rip]
	mov	rdi, rax
	call	puts@PLT
.L62:
	mov	eax, 0
	mov	rsp, rbx
	mov	rdx, QWORD PTR -56[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L65
	call	__stack_chk_fail@PLT
.L65:
	lea	rsp, -40[rbp]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
