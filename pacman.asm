		.DATA
numghosts 		.FILL #2
		.DATA
numdots 		.FILL #92
		.DATA
timer_speed 		.FILL #500
		.DATA
zero 		.FILL #255
		.FILL #195
		.FILL #195
		.FILL #195
		.FILL #195
		.FILL #195
		.FILL #195
		.FILL #255
		.DATA
one 		.FILL #24
		.FILL #24
		.FILL #24
		.FILL #24
		.FILL #24
		.FILL #24
		.FILL #24
		.FILL #24
		.DATA
two 		.FILL #255
		.FILL #255
		.FILL #7
		.FILL #255
		.FILL #255
		.FILL #224
		.FILL #255
		.FILL #255
		.DATA
three 		.FILL #255
		.FILL #255
		.FILL #7
		.FILL #255
		.FILL #255
		.FILL #7
		.FILL #255
		.FILL #255
		.DATA
four 		.FILL #195
		.FILL #195
		.FILL #195
		.FILL #255
		.FILL #3
		.FILL #3
		.FILL #3
		.FILL #3
		.DATA
five 		.FILL #255
		.FILL #255
		.FILL #224
		.FILL #255
		.FILL #255
		.FILL #7
		.FILL #255
		.FILL #255
		.DATA
six 		.FILL #255
		.FILL #255
		.FILL #224
		.FILL #255
		.FILL #255
		.FILL #231
		.FILL #255
		.FILL #255
		.DATA
seven 		.FILL #255
		.FILL #255
		.FILL #7
		.FILL #7
		.FILL #7
		.FILL #7
		.FILL #7
		.FILL #7
		.DATA
eight 		.FILL #255
		.FILL #255
		.FILL #231
		.FILL #255
		.FILL #255
		.FILL #231
		.FILL #255
		.FILL #255
		.DATA
nine 		.FILL #255
		.FILL #255
		.FILL #231
		.FILL #255
		.FILL #255
		.FILL #7
		.FILL #255
		.FILL #255
		.DATA
ghost 		.FILL #60
		.FILL #126
		.FILL #255
		.FILL #219
		.FILL #255
		.FILL #255
		.FILL #231
		.FILL #165
;;;;;;;;;;;;;;;;;;;;;;;;;;;;draw_score;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
draw_score
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-2	;; allocate stack space for local variables
	;; function body
	LEA R7, score_middle
	LDR R7, R7, #0
	SLL R7, R7, #3
	LEA R3, zero
	ADD R7, R7, R3
	STR R7, R5, #-2
	LEA R7, score_right
	LDR R7, R7, #0
	SLL R7, R7, #3
	LEA R3, zero
	ADD R7, R7, R3
	STR R7, R5, #-1
	LEA R7, score_middle
	LDR R7, R7, #0
	CONST R3, #0
	CMP R7, R3
	BRnp L2_pacman
	LEA R7, score_right
	LDR R7, R7, #0
	CONST R3, #0
	CMP R7, R3
	BRnp L4_pacman
	LEA R7, zero
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #255
	HICONST R7, #255
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #56
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #60
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L4_pacman
	LEA R7, prev_score_right
	LDR R7, R7, #0
	LEA R3, score_right
	LDR R3, R3, #0
	CMP R7, R3
	BRz L3_pacman
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #8
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #56
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #60
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_rect
	ADD R6, R6, #5	;; free space for arguments
	LDR R7, R5, #-1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #255
	HICONST R7, #255
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #56
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #60
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	JMP L3_pacman
L2_pacman
	LEA R7, score_left
	LDR R7, R7, #0
	CONST R3, #0
	CMP R7, R3
	BRnp L8_pacman
	LEA R7, prev_score_middle
	LDR R7, R7, #0
	CONST R3, #0
	CMP R7, R3
	BRnp L10_pacman
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #8
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #56
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #60
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_rect
	ADD R6, R6, #5	;; free space for arguments
L10_pacman
	LEA R7, prev_score_middle
	LDR R7, R7, #0
	LEA R3, score_middle
	LDR R3, R3, #0
	CMP R7, R3
	BRz L12_pacman
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #8
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #56
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #55
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_rect
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #8
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #56
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #64
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_rect
	ADD R6, R6, #5	;; free space for arguments
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #255
	HICONST R7, #255
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #56
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #55
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LDR R7, R5, #-1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #255
	HICONST R7, #255
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #56
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #64
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	JMP L13_pacman
L12_pacman
	LEA R7, prev_score_right
	LDR R7, R7, #0
	LEA R3, score_right
	LDR R3, R3, #0
	CMP R7, R3
	BRz L14_pacman
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #8
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #56
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #64
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_rect
	ADD R6, R6, #5	;; free space for arguments
	LDR R7, R5, #-1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #255
	HICONST R7, #255
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #56
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #64
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L14_pacman
L13_pacman
L8_pacman
L3_pacman
	LEA R7, prev_score_left
	LEA R3, score_left
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, prev_score_middle
	LEA R3, score_middle
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, prev_score_right
	LEA R3, score_right
	LDR R3, R3, #0
	STR R3, R7, #0
L1_pacman
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;endl;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
endl
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
	LEA R7, L17_pacman
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
L16_pacman
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;printnum;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
printnum
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
	LEA R7, score
	LDR R7, R7, #0
	CONST R3, #10
	LEA R2, score_right
	MOD R1, R7, R3
	STR R1, R2, #0
	LEA R2, score_middle
	DIV R1, R7, R3
	STR R1, R2, #0
	LDR R1, R2, #0
	MOD R3, R1, R3
	STR R3, R2, #0
	LEA R3, score_left
	CONST R2, #100
	DIV R7, R7, R2
	STR R7, R3, #0
	LDR R7, R3, #0
	CONST R3, #48
	ADD R7, R7, R3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_putc
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #1	;; free space for arguments
	LEA R7, score_middle
	LDR R7, R7, #0
	CONST R3, #48
	ADD R7, R7, R3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_putc
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #1	;; free space for arguments
	LEA R7, score_right
	LDR R7, R7, #0
	CONST R3, #48
	ADD R7, R7, R3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_putc
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #1	;; free space for arguments
	JSR endl
	ADD R6, R6, #0	;; free space for arguments
L18_pacman
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;rand16;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
rand16
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
	LEA R7, i
	CONST R3, #0
	STR R3, R7, #0
L20_pacman
	JSR lc4_random
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	LEA R3, random
	STR R7, R3, #0
L21_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #7
	CMP R7, R3
	BRn L20_pacman
	LEA R7, random
	LDR R7, R7, #0
L19_pacman
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

		.DATA
pacmanrt 		.FILL #31
		.FILL #62
		.FILL #124
		.FILL #120
		.FILL #120
		.FILL #124
		.FILL #62
		.FILL #31
		.DATA
pacmanlt 		.FILL #248
		.FILL #124
		.FILL #62
		.FILL #30
		.FILL #30
		.FILL #62
		.FILL #124
		.FILL #248
		.DATA
pacmanup 		.FILL #129
		.FILL #195
		.FILL #231
		.FILL #255
		.FILL #255
		.FILL #126
		.FILL #60
		.FILL #0
		.DATA
pacmandown 		.FILL #0
		.FILL #60
		.FILL #126
		.FILL #255
		.FILL #255
		.FILL #231
		.FILL #195
		.FILL #129
;;;;;;;;;;;;;;;;;;;;;;;;;;;;draw_line;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
draw_line
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
	LDR R7, R5, #7
	CONST R3, #0
	CMP R7, R3
	BRz L25_pacman
	LDR R7, R5, #6
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_vline
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, i
	LDR R3, R5, #3
	STR R3, R7, #0
	JMP L30_pacman
L27_pacman
	LDR R7, R5, #4
	LEA R3, i
	LDR R3, R3, #0
	SLL R3, R3, #7
	LEA R2, validspace
	ADD R3, R3, R2
	ADD R7, R7, R3
	CONST R3, #1
	STR R3, R7, #0
L28_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L30_pacman
	LEA R7, i
	LDR R7, R7, #0
	LDR R3, R5, #3
	LDR R2, R5, #5
	ADD R3, R3, R2
	CMP R7, R3
	BRn L27_pacman
	JMP L26_pacman
L25_pacman
	LDR R7, R5, #6
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_hline
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, i
	LDR R3, R5, #4
	STR R3, R7, #0
	JMP L34_pacman
L31_pacman
	LEA R7, i
	LDR R7, R7, #0
	LDR R3, R5, #3
	SLL R3, R3, #7
	LEA R2, validspace
	ADD R3, R3, R2
	ADD R7, R7, R3
	CONST R3, #1
	STR R3, R7, #0
L32_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L34_pacman
	LEA R7, i
	LDR R7, R7, #0
	LDR R3, R5, #4
	LDR R2, R5, #5
	ADD R3, R3, R2
	CMP R7, R3
	BRn L31_pacman
L26_pacman
L24_pacman
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;draw_grid;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
draw_grid
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R3, #117
	HICONST R3, #12
	ADD R6, R6, #-1
	STR R3, R6, #0
	CONST R3, #128
	ADD R6, R6, #-1
	STR R3, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R3, #117
	HICONST R3, #12
	ADD R6, R6, #-1
	STR R3, R6, #0
	CONST R3, #128
	ADD R6, R6, #-1
	STR R3, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R3, #117
	HICONST R3, #12
	ADD R6, R6, #-1
	STR R3, R6, #0
	CONST R3, #128
	ADD R6, R6, #-1
	STR R3, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #123
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R3, #117
	HICONST R3, #12
	ADD R6, R6, #-1
	STR R3, R6, #0
	CONST R3, #128
	ADD R6, R6, #-1
	STR R3, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #122
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #47
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #3
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #46
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #3
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #78
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #47
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #2
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #46
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #2
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #78
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R3, #117
	HICONST R3, #12
	ADD R6, R6, #-1
	STR R3, R6, #0
	CONST R3, #47
	ADD R6, R6, #-1
	STR R3, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R3, #117
	HICONST R3, #12
	ADD R6, R6, #-1
	STR R3, R6, #0
	CONST R3, #46
	ADD R6, R6, #-1
	STR R3, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #78
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #47
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #46
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #78
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #47
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #46
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #78
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #47
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #124
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #46
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #124
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #78
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #47
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #125
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #46
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #125
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #78
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #47
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #126
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #46
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #126
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #78
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #120
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #2
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R3, #14
	ADD R6, R6, #-1
	STR R3, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #10
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #14
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #14
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #21
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #10
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #25
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #18
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #37
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #10
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #37
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #18
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #37
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #21
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #10
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #54
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R3, #102
	ADD R6, R6, #-1
	STR R3, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #10
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #102
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #102
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #21
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #10
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #113
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #18
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #74
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #10
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #74
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #18
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #74
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #21
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #10
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #91
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #14
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #31
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #6
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #14
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #31
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #14
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #36
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #6
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #25
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #31
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #102
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #31
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #6
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #102
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #31
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #102
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #36
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #6
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #113
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #31
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #20
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #64
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #2
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #45
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #2
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #44
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #78
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #10
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #98
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #120
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #121
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #45
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #123
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #2
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #44
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #123
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #78
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #10
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #114
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #98
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R3, #117
	HICONST R3, #12
	ADD R6, R6, #-1
	STR R3, R6, #0
	CONST R3, #28
	ADD R6, R6, #-1
	STR R3, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #55
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #10
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #27
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #46
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R3, #117
	HICONST R3, #12
	ADD R6, R6, #-1
	STR R3, R6, #0
	CONST R3, #28
	ADD R6, R6, #-1
	STR R3, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #46
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #23
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #40
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #33
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #13
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #40
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #43
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #13
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #75
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #43
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #10
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #64
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #31
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #28
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #50
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #31
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R3, #117
	HICONST R3, #12
	ADD R6, R6, #-1
	STR R3, R6, #0
	CONST R3, #28
	ADD R6, R6, #-1
	STR R3, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #68
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #10
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #27
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #68
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R3, #117
	HICONST R3, #12
	ADD R6, R6, #-1
	STR R3, R6, #0
	CONST R3, #28
	ADD R6, R6, #-1
	STR R3, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #78
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #10
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #40
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #68
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #28
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #100
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #55
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #10
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #100
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #46
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #23
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #87
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #33
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #28
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #100
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #46
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #28
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #100
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #68
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #10
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #100
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #68
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #28
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #100
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #78
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #10
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #87
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #68
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #11
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #14
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #88
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #13
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #24
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #88
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #11
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #103
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #88
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #13
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #103
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #88
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #11
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #64
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #100
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #21
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #92
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #90
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #18
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #75
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #89
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #21
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #35
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #90
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #18
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #35
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #89
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #36
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #46
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #100
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #39
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #14
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #110
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #39
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #76
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #110
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #10
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #64
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #80
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #24
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #52
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #80
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #27
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #50
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #67
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #27
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #50
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #53
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #255
	HICONST R7, #255
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #10
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #59
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #53
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #15
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #50
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #53
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #15
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #76
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #53
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
L35_pacman
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;create_dots;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
create_dots
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
	LEA R7, j
	CONST R3, #0
	STR R3, R7, #0
	LEA R7, i
	CONST R3, #47
	STR R3, R7, #0
L37_pacman
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	LEA R3, i
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R7, R7, R3
	CONST R3, #96
	STR R3, R7, #0
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L38_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #10
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #78
	CMP R7, R3
	BRn L37_pacman
	LEA R7, i
	CONST R3, #47
	STR R3, R7, #0
L41_pacman
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	LEA R3, i
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R7, R7, R3
	CONST R3, #33
	STR R3, R7, #0
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L42_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #10
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #78
	CMP R7, R3
	BRn L41_pacman
	LEA R7, i
	CONST R3, #8
	STR R3, R7, #0
L45_pacman
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	CONST R3, #7
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R7, R7, R3
	LEA R3, i
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L46_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #10
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #63
	CMP R7, R3
	BRn L45_pacman
	LEA R7, i
	CONST R3, #66
	STR R3, R7, #0
L49_pacman
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	CONST R3, #7
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R7, R7, R3
	LEA R3, i
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L50_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #10
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #123
	CMP R7, R3
	BRn L49_pacman
	LEA R7, i
	CONST R3, #46
	STR R3, R7, #0
L53_pacman
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	CONST R3, #36
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R7, R7, R3
	LEA R3, i
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L54_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #10
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #63
	CMP R7, R3
	BRn L53_pacman
	LEA R7, i
	CONST R3, #69
	STR R3, R7, #0
L57_pacman
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	CONST R3, #36
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R7, R7, R3
	LEA R3, i
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L58_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #10
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #87
	CMP R7, R3
	BRn L57_pacman
	LEA R7, i
	CONST R3, #8
	STR R3, R7, #0
L61_pacman
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	CONST R3, #42
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R7, R7, R3
	LEA R3, i
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L62_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #10
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #40
	CMP R7, R3
	BRn L61_pacman
	LEA R7, i
	CONST R3, #89
	STR R3, R7, #0
L65_pacman
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	CONST R3, #42
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R7, R7, R3
	LEA R3, i
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L66_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #10
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #123
	CMP R7, R3
	BRn L65_pacman
	LEA R7, i
	CONST R3, #8
	STR R3, R7, #0
L69_pacman
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	CONST R3, #26
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R7, R7, R3
	LEA R3, i
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L70_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #10
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #63
	CMP R7, R3
	BRn L69_pacman
	LEA R7, i
	CONST R3, #66
	STR R3, R7, #0
L73_pacman
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	CONST R3, #26
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R7, R7, R3
	LEA R3, i
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L74_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #10
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #123
	CMP R7, R3
	BRn L73_pacman
	LEA R7, i
	CONST R3, #8
	STR R3, R7, #0
L77_pacman
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	CONST R3, #116
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R7, R7, R3
	LEA R3, i
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L78_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #10
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #63
	CMP R7, R3
	BRn L77_pacman
	LEA R7, i
	CONST R3, #66
	STR R3, R7, #0
L81_pacman
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	CONST R3, #116
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R7, R7, R3
	LEA R3, i
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L82_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #10
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #123
	CMP R7, R3
	BRn L81_pacman
	LEA R7, i
	CONST R3, #8
	STR R3, R7, #0
L85_pacman
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	CONST R3, #84
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R7, R7, R3
	LEA R3, i
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L86_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #10
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #63
	CMP R7, R3
	BRn L85_pacman
	LEA R7, i
	CONST R3, #66
	STR R3, R7, #0
L89_pacman
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	CONST R3, #84
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R7, R7, R3
	LEA R3, i
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L90_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #10
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #123
	CMP R7, R3
	BRn L89_pacman
	LEA R7, i
	CONST R3, #8
	STR R3, R7, #0
L93_pacman
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	CONST R3, #105
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R7, R7, R3
	LEA R3, i
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L94_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #10
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #63
	CMP R7, R3
	BRn L93_pacman
	LEA R7, i
	CONST R3, #66
	STR R3, R7, #0
L97_pacman
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	CONST R3, #105
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R7, R7, R3
	LEA R3, i
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L98_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #10
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #123
	CMP R7, R3
	BRn L97_pacman
	LEA R7, i
	CONST R3, #8
	STR R3, R7, #0
L101_pacman
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	CONST R3, #95
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R7, R7, R3
	LEA R3, i
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L102_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #10
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #63
	CMP R7, R3
	BRn L101_pacman
	LEA R7, i
	CONST R3, #66
	STR R3, R7, #0
L105_pacman
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	CONST R3, #95
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R7, R7, R3
	LEA R3, i
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L106_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #10
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #123
	CMP R7, R3
	BRn L105_pacman
L36_pacman
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;redraw;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
redraw
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-1	;; allocate stack space for local variables
	;; function body
	LEA R7, prevx
	LDR R7, R7, #0
	LEA R3, x
	LDR R3, R3, #0
	CMP R7, R3
	BRnp L113_pacman
	LEA R7, prevy
	LDR R7, R7, #0
	LEA R3, y
	LDR R3, R3, #0
	CMP R7, R3
	BRnp L113_pacman
	LEA R7, prevdirection
	LDR R7, R7, #0
	LEA R3, direction
	LDR R3, R3, #0
	CMP R7, R3
	BRz L110_pacman
L113_pacman
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #8
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, prevy
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, prevx
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_rect
	ADD R6, R6, #5	;; free space for arguments
L110_pacman
	LEA R7, direction
	LDR R7, R7, #0
	CONST R3, #1
	CMP R7, R3
	BRnp L114_pacman
	LEA R7, pacmanup
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, y
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, x
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	JMP L115_pacman
L114_pacman
	LEA R7, direction
	LDR R7, R7, #0
	CONST R3, #2
	CMP R7, R3
	BRnp L116_pacman
	LEA R7, pacmandown
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, y
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, x
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	JMP L117_pacman
L116_pacman
	LEA R7, direction
	LDR R7, R7, #0
	CONST R3, #3
	CMP R7, R3
	BRnp L118_pacman
	LEA R7, pacmanrt
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, y
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, x
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	JMP L119_pacman
L118_pacman
	LEA R7, direction
	LDR R7, R7, #0
	CONST R3, #4
	CMP R7, R3
	BRnp L120_pacman
	LEA R7, pacmanlt
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, y
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, x
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L120_pacman
L119_pacman
L117_pacman
L115_pacman
	LEA R7, i
	CONST R3, #0
	STR R3, R7, #0
	JMP L125_pacman
L122_pacman
	LEA R7, i
	LDR R7, R7, #0
	STR R7, R5, #-1
	LEA R3, ghostsprevx
	ADD R3, R7, R3
	LDR R3, R3, #0
	LEA R2, ghostsx
	ADD R2, R7, R2
	LDR R2, R2, #0
	CMP R3, R2
	BRnp L128_pacman
	LEA R7, ghostsprevy
	LDR R3, R5, #-1
	ADD R7, R3, R7
	LDR R7, R7, #0
	LEA R3, ghostsy
	LDR R2, R5, #-1
	ADD R3, R2, R3
	LDR R3, R3, #0
	CMP R7, R3
	BRz L126_pacman
L128_pacman
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #8
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, i
	LDR R7, R7, #0
	LEA R3, ghostsprevy
	ADD R3, R7, R3
	LDR R3, R3, #0
	ADD R6, R6, #-1
	STR R3, R6, #0
	LEA R3, ghostsprevx
	ADD R7, R7, R3
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_rect
	ADD R6, R6, #5	;; free space for arguments
	LEA R7, ghost
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #2
	MOD R3, R7, R3
	LEA R2, colors
	ADD R3, R3, R2
	LDR R3, R3, #0
	ADD R6, R6, #-1
	STR R3, R6, #0
	LEA R3, ghostsy
	ADD R3, R7, R3
	LDR R3, R3, #0
	ADD R6, R6, #-1
	STR R3, R6, #0
	LEA R3, ghostsx
	ADD R7, R7, R3
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L126_pacman
L123_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L125_pacman
	LEA R7, i
	LDR R7, R7, #0
	LEA R3, numghosts
	LDR R3, R3, #0
	CMP R7, R3
	BRn L122_pacman
	LEA R7, i
	CONST R3, #0
	STR R3, R7, #0
	JMP L132_pacman
L129_pacman
	CONST R7, #255
	HICONST R7, #255
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, i
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R3, R7, R3
	LDR R3, R3, #0
	ADD R6, R6, #-1
	STR R3, R6, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_pixel
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #3	;; free space for arguments
L130_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L132_pacman
	LEA R7, i
	LDR R7, R7, #0
	LEA R3, numdots
	LDR R3, R3, #0
	CMP R7, R3
	BRn L129_pacman
	JSR draw_score
	ADD R6, R6, #0	;; free space for arguments
	LEA R7, prevx
	LEA R3, x
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, prevy
	LEA R3, y
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, prevdirection
	LEA R3, direction
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, i
	CONST R3, #0
	STR R3, R7, #0
	JMP L136_pacman
L133_pacman
	LEA R7, i
	LDR R7, R7, #0
	LEA R3, ghostsprevx
	ADD R3, R7, R3
	LEA R2, ghostsx
	ADD R7, R7, R2
	LDR R7, R7, #0
	STR R7, R3, #0
	LEA R7, i
	LDR R7, R7, #0
	LEA R3, ghostsprevy
	ADD R3, R7, R3
	LEA R2, ghostsy
	ADD R7, R7, R2
	LDR R7, R7, #0
	STR R7, R3, #0
L134_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L136_pacman
	LEA R7, i
	LDR R7, R7, #0
	LEA R3, numghosts
	LDR R3, R3, #0
	CMP R7, R3
	BRn L133_pacman
L109_pacman
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;reset_game_state;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
reset_game_state
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
	LEA R7, score
	CONST R3, #0
	STR R3, R7, #0
	CONST R7, #-10
	LEA R3, prevx
	STR R7, R3, #0
	LEA R3, prevy
	STR R7, R3, #0
	CONST R7, #3
	LEA R3, direction
	STR R7, R3, #0
	LEA R3, prevdirection
	STR R7, R3, #0
	LEA R7, ghostsx
	CONST R3, #42
	STR R3, R7, #0
	LEA R3, ghostsy
	CONST R2, #55
	STR R2, R3, #0
	CONST R3, #77
	STR R3, R7, #1
	LEA R7, ghostsy
	CONST R3, #55
	STR R3, R7, #1
	LEA R7, i
	CONST R3, #0
	STR R3, R7, #0
	JMP L141_pacman
L138_pacman
	LEA R7, i
	LDR R7, R7, #0
	LEA R3, ghostsprevx
	ADD R7, R7, R3
	CONST R3, #-10
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	LEA R3, ghostsprevy
	ADD R7, R7, R3
	CONST R3, #-10
	STR R3, R7, #0
L139_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L141_pacman
	LEA R7, i
	LDR R7, R7, #0
	LEA R3, numghosts
	LDR R3, R3, #0
	CMP R7, R3
	BRn L138_pacman
	LEA R7, ghostsdirection
	CONST R3, #1
	STR R3, R7, #0
	CONST R3, #2
	STR R3, R7, #1
	LEA R7, colors
	CONST R3, #112
	HICONST R3, #7
	STR R3, R7, #0
	CONST R3, #0
	HICONST R3, #124
	STR R3, R7, #1
	LEA R7, x
	CONST R3, #60
	STR R3, R7, #0
	LEA R7, y
	CONST R3, #72
	STR R3, R7, #0
	JSR create_dots
	ADD R6, R6, #0	;; free space for arguments
L137_pacman
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;choose_direction;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
choose_direction
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-3	;; allocate stack space for local variables
	;; function body
	LDR R7, R5, #3
	LEA R3, ghostsdirection
	ADD R7, R7, R3
	LDR R7, R7, #0
	STR R7, R5, #-1
	LDR R7, R5, #-1
	STR R7, R5, #-2
	CONST R3, #1
	CMP R7, R3
	BRz L145_pacman
	CONST R7, #2
	LDR R3, R5, #-2
	CMP R3, R7
	BRnp L143_pacman
L145_pacman
	LEA R7, x
	LDR R7, R7, #0
	LDR R3, R5, #3
	LEA R2, ghostsx
	ADD R3, R3, R2
	LDR R3, R3, #0
	CMP R7, R3
	BRzp L146_pacman
	LDR R7, R5, #3
	LEA R3, ghostsdirection
	ADD R7, R7, R3
	CONST R3, #4
	STR R3, R7, #0
	JMP L147_pacman
L146_pacman
	LEA R7, x
	LDR R7, R7, #0
	LDR R3, R5, #3
	LEA R2, ghostsx
	ADD R3, R3, R2
	LDR R3, R3, #0
	CMP R7, R3
	BRnz L148_pacman
	LDR R7, R5, #3
	LEA R3, ghostsdirection
	ADD R7, R7, R3
	CONST R3, #3
	STR R3, R7, #0
L148_pacman
L147_pacman
L143_pacman
	LDR R7, R5, #-1
	STR R7, R5, #-3
	CONST R3, #4
	CMP R7, R3
	BRz L152_pacman
	CONST R7, #3
	LDR R3, R5, #-3
	CMP R3, R7
	BRnp L150_pacman
L152_pacman
	LEA R7, y
	LDR R7, R7, #0
	LDR R3, R5, #3
	LEA R2, ghostsy
	ADD R3, R3, R2
	LDR R3, R3, #0
	CMP R7, R3
	BRzp L153_pacman
	LDR R7, R5, #3
	LEA R3, ghostsdirection
	ADD R7, R7, R3
	CONST R3, #1
	STR R3, R7, #0
	JMP L154_pacman
L153_pacman
	LEA R7, y
	LDR R7, R7, #0
	LDR R3, R5, #3
	LEA R2, ghostsy
	ADD R3, R3, R2
	LDR R3, R3, #0
	CMP R7, R3
	BRnz L155_pacman
	LDR R7, R5, #3
	LEA R3, ghostsdirection
	ADD R7, R7, R3
	CONST R3, #2
	STR R3, R7, #0
L155_pacman
L154_pacman
L150_pacman
L142_pacman
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;choose_direction_random;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
choose_direction_random
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-2	;; allocate stack space for local variables
	;; function body
	JSR rand16
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	CONST R3, #4
	MOD R7, R7, R3
	STR R7, R5, #-1
	LDR R7, R5, #3
	LEA R3, ghostsdirection
	ADD R7, R7, R3
	LDR R7, R7, #0
	STR R7, R5, #-2
	JMP L159_pacman
L158_pacman
	JSR rand16
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	CONST R3, #4
	MOD R7, R7, R3
	STR R7, R5, #-1
L159_pacman
	LDR R7, R5, #-2
	ADD R7, R7, #-1
	LDR R3, R5, #-1
	CMP R7, R3
	BRz L158_pacman
	LDR R7, R5, #3
	LEA R3, ghostsdirection
	ADD R7, R7, R3
	LDR R3, R5, #-1
	ADD R3, R3, #1
	STR R3, R7, #0
L157_pacman
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;move_ghost;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
move_ghost
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-1	;; allocate stack space for local variables
	;; function body
	LEA R7, top
	LDR R3, R5, #3
	LEA R2, ghostsy
	ADD R2, R3, R2
	LDR R2, R2, #0
	STR R2, R7, #0
	LEA R2, bottom
	LDR R7, R7, #0
	ADD R7, R7, #7
	STR R7, R2, #0
	LEA R7, left
	LEA R2, ghostsx
	ADD R2, R3, R2
	LDR R2, R2, #0
	STR R2, R7, #0
	LEA R2, right
	LDR R7, R7, #0
	ADD R7, R7, #7
	STR R7, R2, #0
	LEA R7, ghostsdirection
	ADD R7, R3, R7
	LDR R7, R7, #0
	CONST R3, #1
	CMP R7, R3
	BRnp L162_pacman
	LEA R7, j
	CONST R3, #1
	STR R3, R7, #0
L164_pacman
	LEA R7, i
	CONST R3, #0
	STR R3, R7, #0
L168_pacman
	LEA R7, top
	LDR R7, R7, #0
	LEA R3, j
	LDR R3, R3, #0
	SUB R7, R7, R3
	STR R7, R5, #-1
	CONST R3, #0
	CMP R7, R3
	BRn L172_pacman
	LEA R7, left
	LDR R7, R7, #0
	LEA R3, i
	LDR R3, R3, #0
	ADD R7, R7, R3
	LDR R3, R5, #-1
	SLL R3, R3, #7
	LEA R2, validspace
	ADD R3, R3, R2
	ADD R7, R7, R3
	LDR R7, R7, #0
	CONST R3, #1
	CMP R7, R3
	BRnp L172_pacman
	LDR R7, R5, #3
	LEA R3, ghostsy
	ADD R7, R7, R3
	LEA R3, top
	LDR R3, R3, #0
	LEA R2, j
	LDR R2, R2, #0
	SUB R3, R3, R2
	ADD R3, R3, #1
	STR R3, R7, #0
	LDR R7, R5, #4
	CONST R3, #0
	CMP R7, R3
	BRz L174_pacman
	LDR R7, R5, #3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR choose_direction_random
	ADD R6, R6, #1	;; free space for arguments
	JMP L161_pacman
L174_pacman
	LDR R7, R5, #3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR choose_direction
	ADD R6, R6, #1	;; free space for arguments
	JMP L161_pacman
L172_pacman
L169_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #8
	CMP R7, R3
	BRn L168_pacman
L165_pacman
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	CONST R3, #5
	CMP R7, R3
	BRn L164_pacman
	LDR R7, R5, #3
	LEA R3, ghostsy
	ADD R7, R7, R3
	LDR R3, R7, #0
	ADD R3, R3, #-4
	STR R3, R7, #0
L162_pacman
	LDR R7, R5, #3
	LEA R3, ghostsdirection
	ADD R7, R7, R3
	LDR R7, R7, #0
	CONST R3, #2
	CMP R7, R3
	BRnp L176_pacman
	LEA R7, j
	CONST R3, #1
	STR R3, R7, #0
L178_pacman
	LEA R7, i
	CONST R3, #0
	STR R3, R7, #0
L182_pacman
	LEA R7, bottom
	LDR R7, R7, #0
	LEA R3, j
	LDR R3, R3, #0
	ADD R7, R7, R3
	STR R7, R5, #-1
	CONST R3, #124
	CMP R7, R3
	BRzp L186_pacman
	LEA R7, left
	LDR R7, R7, #0
	LEA R3, i
	LDR R3, R3, #0
	ADD R7, R7, R3
	LDR R3, R5, #-1
	SLL R3, R3, #7
	LEA R2, validspace
	ADD R3, R3, R2
	ADD R7, R7, R3
	LDR R7, R7, #0
	CONST R3, #1
	CMP R7, R3
	BRnp L186_pacman
	LDR R7, R5, #3
	LEA R3, ghostsy
	ADD R7, R7, R3
	LEA R3, bottom
	LDR R3, R3, #0
	LEA R2, j
	LDR R2, R2, #0
	ADD R3, R3, R2
	ADD R3, R3, #-8
	STR R3, R7, #0
	LDR R7, R5, #4
	CONST R3, #0
	CMP R7, R3
	BRz L188_pacman
	LDR R7, R5, #3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR choose_direction_random
	ADD R6, R6, #1	;; free space for arguments
	JMP L161_pacman
L188_pacman
	LDR R7, R5, #3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR choose_direction
	ADD R6, R6, #1	;; free space for arguments
	JMP L161_pacman
L186_pacman
L183_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #8
	CMP R7, R3
	BRn L182_pacman
L179_pacman
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	CONST R3, #5
	CMP R7, R3
	BRn L178_pacman
	LDR R7, R5, #3
	LEA R3, ghostsy
	ADD R7, R7, R3
	LDR R3, R7, #0
	ADD R3, R3, #4
	STR R3, R7, #0
L176_pacman
	LDR R7, R5, #3
	LEA R3, ghostsdirection
	ADD R7, R7, R3
	LDR R7, R7, #0
	CONST R3, #4
	CMP R7, R3
	BRnp L190_pacman
	LEA R7, j
	CONST R3, #1
	STR R3, R7, #0
L192_pacman
	LEA R7, i
	CONST R3, #0
	STR R3, R7, #0
L196_pacman
	LEA R7, left
	LDR R7, R7, #0
	LEA R3, j
	LDR R3, R3, #0
	SUB R7, R7, R3
	STR R7, R5, #-1
	CONST R3, #0
	CMP R7, R3
	BRn L200_pacman
	LEA R7, top
	LDR R7, R7, #0
	LEA R3, i
	LDR R3, R3, #0
	ADD R7, R7, R3
	SLL R7, R7, #7
	LEA R3, validspace
	ADD R7, R7, R3
	LDR R3, R5, #-1
	ADD R7, R3, R7
	LDR R7, R7, #0
	CONST R3, #1
	CMP R7, R3
	BRnp L200_pacman
	LDR R7, R5, #3
	LEA R3, ghostsx
	ADD R7, R7, R3
	LEA R3, left
	LDR R3, R3, #0
	LEA R2, j
	LDR R2, R2, #0
	SUB R3, R3, R2
	ADD R3, R3, #1
	STR R3, R7, #0
	LDR R7, R5, #4
	CONST R3, #0
	CMP R7, R3
	BRz L202_pacman
	LDR R7, R5, #3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR choose_direction_random
	ADD R6, R6, #1	;; free space for arguments
	JMP L161_pacman
L202_pacman
	LDR R7, R5, #3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR choose_direction
	ADD R6, R6, #1	;; free space for arguments
	JMP L161_pacman
L200_pacman
L197_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #8
	CMP R7, R3
	BRn L196_pacman
L193_pacman
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	CONST R3, #5
	CMP R7, R3
	BRn L192_pacman
	LDR R7, R5, #3
	LEA R3, ghostsx
	ADD R7, R7, R3
	LDR R3, R7, #0
	ADD R3, R3, #-4
	STR R3, R7, #0
L190_pacman
	LDR R7, R5, #3
	LEA R3, ghostsdirection
	ADD R7, R7, R3
	LDR R7, R7, #0
	CONST R3, #3
	CMP R7, R3
	BRnp L204_pacman
	LEA R7, j
	CONST R3, #1
	STR R3, R7, #0
L206_pacman
	LEA R7, i
	CONST R3, #0
	STR R3, R7, #0
L210_pacman
	LEA R7, right
	LDR R7, R7, #0
	LEA R3, j
	LDR R3, R3, #0
	ADD R7, R7, R3
	STR R7, R5, #-1
	CONST R3, #128
	CMP R7, R3
	BRzp L214_pacman
	LEA R7, top
	LDR R7, R7, #0
	LEA R3, i
	LDR R3, R3, #0
	ADD R7, R7, R3
	SLL R7, R7, #7
	LEA R3, validspace
	ADD R7, R7, R3
	LDR R3, R5, #-1
	ADD R7, R3, R7
	LDR R7, R7, #0
	CONST R3, #1
	CMP R7, R3
	BRnp L214_pacman
	LDR R7, R5, #3
	LEA R3, ghostsx
	ADD R7, R7, R3
	LEA R3, right
	LDR R3, R3, #0
	LEA R2, j
	LDR R2, R2, #0
	ADD R3, R3, R2
	ADD R3, R3, #-8
	STR R3, R7, #0
	LDR R7, R5, #4
	CONST R3, #0
	CMP R7, R3
	BRz L216_pacman
	LDR R7, R5, #3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR choose_direction_random
	ADD R6, R6, #1	;; free space for arguments
	JMP L161_pacman
L216_pacman
	LDR R7, R5, #3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR choose_direction
	ADD R6, R6, #1	;; free space for arguments
	JMP L161_pacman
L214_pacman
L211_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #8
	CMP R7, R3
	BRn L210_pacman
L207_pacman
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	CONST R3, #5
	CMP R7, R3
	BRn L206_pacman
	LDR R7, R5, #3
	LEA R3, ghostsx
	ADD R7, R7, R3
	LDR R3, R7, #0
	ADD R3, R3, #4
	STR R3, R7, #0
L204_pacman
	LDR R7, R5, #3
	LEA R3, ghostsx
	ADD R7, R7, R3
	LDR R7, R7, #0
	ADD R7, R7, #7
	CONST R3, #2
	CMP R7, R3
	BRzp L218_pacman
	LDR R7, R5, #3
	LEA R3, ghostsx
	ADD R7, R7, R3
	CONST R3, #126
	STR R3, R7, #0
	LDR R7, R5, #3
	LEA R3, ghostsdirection
	ADD R7, R7, R3
	CONST R3, #4
	STR R3, R7, #0
	JMP L161_pacman
L218_pacman
	LDR R7, R5, #3
	LEA R3, ghostsx
	ADD R7, R7, R3
	LDR R7, R7, #0
	CONST R3, #126
	CMP R7, R3
	BRnz L220_pacman
	LDR R7, R5, #3
	LEA R3, ghostsx
	ADD R7, R7, R3
	CONST R3, #-5
	STR R3, R7, #0
	LDR R7, R5, #3
	LEA R3, ghostsdirection
	ADD R7, R7, R3
	CONST R3, #3
	STR R3, R7, #0
L220_pacman
L161_pacman
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;move_pacman;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
move_pacman
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-1	;; allocate stack space for local variables
	;; function body
	LEA R7, y
	LDR R7, R7, #0
	LEA R3, top
	STR R7, R3, #0
	LEA R3, x
	LDR R3, R3, #0
	LEA R2, left
	STR R3, R2, #0
	LEA R2, right
	ADD R3, R3, #7
	STR R3, R2, #0
	LEA R3, bottom
	ADD R7, R7, #7
	STR R7, R3, #0
	LDR R7, R5, #3
	CONST R3, #1
	CMP R7, R3
	BRnp L223_pacman
	LEA R7, j
	CONST R3, #1
	STR R3, R7, #0
L225_pacman
	LEA R7, i
	CONST R3, #0
	STR R3, R7, #0
L229_pacman
	LEA R7, top
	LDR R7, R7, #0
	LEA R3, j
	LDR R3, R3, #0
	SUB R7, R7, R3
	STR R7, R5, #-1
	CONST R3, #0
	CMP R7, R3
	BRn L233_pacman
	LEA R7, x
	LDR R7, R7, #0
	LEA R3, i
	LDR R3, R3, #0
	ADD R7, R7, R3
	LDR R3, R5, #-1
	SLL R3, R3, #7
	LEA R2, validspace
	ADD R3, R3, R2
	ADD R7, R7, R3
	LDR R7, R7, #0
	CONST R3, #1
	CMP R7, R3
	BRnp L233_pacman
	LEA R7, y
	LEA R3, top
	LDR R3, R3, #0
	LEA R2, j
	LDR R2, R2, #0
	SUB R3, R3, R2
	ADD R3, R3, #1
	STR R3, R7, #0
	JMP L222_pacman
L233_pacman
L230_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #8
	CMP R7, R3
	BRn L229_pacman
L226_pacman
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	CONST R3, #5
	CMP R7, R3
	BRn L225_pacman
	LEA R7, y
	LDR R3, R7, #0
	ADD R3, R3, #-4
	STR R3, R7, #0
L223_pacman
	LDR R7, R5, #3
	CONST R3, #3
	CMP R7, R3
	BRnp L235_pacman
	LEA R7, j
	CONST R3, #1
	STR R3, R7, #0
L237_pacman
	LEA R7, i
	CONST R3, #0
	STR R3, R7, #0
L241_pacman
	LEA R7, right
	LDR R7, R7, #0
	LEA R3, j
	LDR R3, R3, #0
	ADD R7, R7, R3
	STR R7, R5, #-1
	CONST R3, #128
	CMP R7, R3
	BRzp L245_pacman
	LEA R7, y
	LDR R7, R7, #0
	LEA R3, i
	LDR R3, R3, #0
	ADD R7, R7, R3
	SLL R7, R7, #7
	LEA R3, validspace
	ADD R7, R7, R3
	LDR R3, R5, #-1
	ADD R7, R3, R7
	LDR R7, R7, #0
	CONST R3, #1
	CMP R7, R3
	BRnp L245_pacman
	LEA R7, x
	LEA R3, right
	LDR R3, R3, #0
	LEA R2, j
	LDR R2, R2, #0
	ADD R3, R3, R2
	ADD R3, R3, #-8
	STR R3, R7, #0
	JMP L222_pacman
L245_pacman
L242_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #8
	CMP R7, R3
	BRn L241_pacman
L238_pacman
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	CONST R3, #5
	CMP R7, R3
	BRn L237_pacman
	LEA R7, x
	LDR R3, R7, #0
	ADD R3, R3, #4
	STR R3, R7, #0
L235_pacman
	LDR R7, R5, #3
	CONST R3, #4
	CMP R7, R3
	BRnp L247_pacman
	LEA R7, j
	CONST R3, #1
	STR R3, R7, #0
L249_pacman
	LEA R7, i
	CONST R3, #0
	STR R3, R7, #0
L253_pacman
	LEA R7, left
	LDR R7, R7, #0
	LEA R3, j
	LDR R3, R3, #0
	SUB R7, R7, R3
	STR R7, R5, #-1
	CONST R3, #0
	CMP R7, R3
	BRn L257_pacman
	LEA R7, y
	LDR R7, R7, #0
	LEA R3, i
	LDR R3, R3, #0
	ADD R7, R7, R3
	SLL R7, R7, #7
	LEA R3, validspace
	ADD R7, R7, R3
	LDR R3, R5, #-1
	ADD R7, R3, R7
	LDR R7, R7, #0
	CONST R3, #1
	CMP R7, R3
	BRnp L257_pacman
	LEA R7, x
	LEA R3, left
	LDR R3, R3, #0
	LEA R2, j
	LDR R2, R2, #0
	SUB R3, R3, R2
	ADD R3, R3, #1
	STR R3, R7, #0
	JMP L222_pacman
L257_pacman
L254_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #8
	CMP R7, R3
	BRn L253_pacman
L250_pacman
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	CONST R3, #5
	CMP R7, R3
	BRn L249_pacman
	LEA R7, x
	LDR R3, R7, #0
	ADD R3, R3, #-4
	STR R3, R7, #0
L247_pacman
	LDR R7, R5, #3
	CONST R3, #2
	CMP R7, R3
	BRnp L259_pacman
	LEA R7, j
	CONST R3, #1
	STR R3, R7, #0
L261_pacman
	LEA R7, i
	CONST R3, #0
	STR R3, R7, #0
L265_pacman
	LEA R7, bottom
	LDR R7, R7, #0
	LEA R3, j
	LDR R3, R3, #0
	ADD R7, R7, R3
	STR R7, R5, #-1
	CONST R3, #124
	CMP R7, R3
	BRzp L269_pacman
	LEA R7, x
	LDR R7, R7, #0
	LEA R3, i
	LDR R3, R3, #0
	ADD R7, R7, R3
	LDR R3, R5, #-1
	SLL R3, R3, #7
	LEA R2, validspace
	ADD R3, R3, R2
	ADD R7, R7, R3
	LDR R7, R7, #0
	CONST R3, #1
	CMP R7, R3
	BRnp L269_pacman
	LEA R7, y
	LEA R3, bottom
	LDR R3, R3, #0
	LEA R2, j
	LDR R2, R2, #0
	ADD R3, R3, R2
	ADD R3, R3, #-8
	STR R3, R7, #0
	JMP L222_pacman
L269_pacman
L266_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #8
	CMP R7, R3
	BRn L265_pacman
L262_pacman
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	CONST R3, #5
	CMP R7, R3
	BRn L261_pacman
	LEA R7, y
	LDR R3, R7, #0
	ADD R3, R3, #4
	STR R3, R7, #0
L259_pacman
	LEA R7, x
	LDR R7, R7, #0
	ADD R7, R7, #7
	CONST R3, #2
	CMP R7, R3
	BRzp L271_pacman
	LEA R7, x
	CONST R3, #126
	STR R3, R7, #0
	CONST R7, #4
	STR R7, R5, #3
	JMP L222_pacman
L271_pacman
	LEA R7, x
	LDR R7, R7, #0
	CONST R3, #126
	CMP R7, R3
	BRnz L273_pacman
	LEA R7, x
	CONST R3, #-5
	STR R3, R7, #0
	CONST R7, #3
	STR R7, R5, #3
L273_pacman
L222_pacman
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;playerhit;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
playerhit
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-4	;; allocate stack space for local variables
	;; function body
	LEA R7, i
	CONST R3, #0
	STR R3, R7, #0
	JMP L279_pacman
L276_pacman
	LEA R7, x
	LDR R7, R7, #0
	STR R7, R5, #-1
	LEA R3, i
	LDR R3, R3, #0
	LEA R2, ghostsx
	ADD R3, R3, R2
	LDR R3, R3, #0
	CMP R7, R3
	BRp L280_pacman
	LDR R7, R5, #-1
	ADD R7, R7, #7
	CMP R7, R3
	BRn L280_pacman
	LEA R7, y
	LDR R7, R7, #0
	STR R7, R5, #-2
	LEA R3, i
	LDR R3, R3, #0
	LEA R2, ghostsy
	ADD R3, R3, R2
	LDR R3, R3, #0
	CMP R7, R3
	BRp L282_pacman
	LDR R7, R5, #-2
	ADD R7, R7, #7
	CMP R7, R3
	BRn L282_pacman
	CONST R7, #1
	JMP L275_pacman
L282_pacman
	LEA R7, i
	LDR R7, R7, #0
	LEA R3, ghostsy
	ADD R7, R7, R3
	LDR R7, R7, #0
	STR R7, R5, #-3
	LEA R3, y
	LDR R3, R3, #0
	CMP R7, R3
	BRp L281_pacman
	LDR R7, R5, #-3
	ADD R7, R7, #7
	CMP R7, R3
	BRn L281_pacman
	CONST R7, #1
	JMP L275_pacman
L280_pacman
	LEA R7, i
	LDR R7, R7, #0
	LEA R3, ghostsx
	ADD R7, R7, R3
	LDR R7, R7, #0
	STR R7, R5, #-2
	LEA R3, x
	LDR R3, R3, #0
	CMP R7, R3
	BRp L286_pacman
	LDR R7, R5, #-2
	ADD R7, R7, #7
	CMP R7, R3
	BRn L286_pacman
	LEA R7, y
	LDR R7, R7, #0
	STR R7, R5, #-3
	LEA R3, i
	LDR R3, R3, #0
	LEA R2, ghostsy
	ADD R3, R3, R2
	LDR R3, R3, #0
	CMP R7, R3
	BRp L288_pacman
	LDR R7, R5, #-3
	ADD R7, R7, #7
	CMP R7, R3
	BRn L288_pacman
	CONST R7, #1
	JMP L275_pacman
L288_pacman
	LEA R7, i
	LDR R7, R7, #0
	LEA R3, ghostsy
	ADD R7, R7, R3
	LDR R7, R7, #0
	STR R7, R5, #-4
	LEA R3, y
	LDR R3, R3, #0
	CMP R7, R3
	BRp L290_pacman
	LDR R7, R5, #-4
	ADD R7, R7, #7
	CMP R7, R3
	BRn L290_pacman
	CONST R7, #1
	JMP L275_pacman
L290_pacman
L286_pacman
L281_pacman
L277_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L279_pacman
	LEA R7, i
	LDR R7, R7, #0
	LEA R3, numghosts
	LDR R3, R3, #0
	CMP R7, R3
	BRn L276_pacman
	CONST R7, #0
L275_pacman
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;eat_dot;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
eat_dot
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-2	;; allocate stack space for local variables
	;; function body
	LEA R7, i
	CONST R3, #0
	STR R3, R7, #0
	JMP L296_pacman
L293_pacman
	LEA R7, x
	LDR R7, R7, #0
	STR R7, R5, #-1
	LEA R3, i
	LDR R3, R3, #0
	LEA R2, dotsx
	ADD R3, R3, R2
	LDR R3, R3, #0
	CMP R7, R3
	BRp L297_pacman
	LDR R7, R5, #-1
	ADD R7, R7, #7
	CMP R7, R3
	BRn L297_pacman
	LEA R7, y
	LDR R7, R7, #0
	STR R7, R5, #-2
	LEA R3, i
	LDR R3, R3, #0
	LEA R2, dotsy
	ADD R3, R3, R2
	LDR R3, R3, #0
	CMP R7, R3
	BRp L299_pacman
	LDR R7, R5, #-2
	ADD R7, R7, #7
	CMP R7, R3
	BRn L299_pacman
	LEA R7, i
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R7, R7, R3
	CONST R3, #-1
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	CONST R3, #-1
	STR R3, R7, #0
	LEA R7, score
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	JSR printnum
	ADD R6, R6, #0	;; free space for arguments
L299_pacman
L297_pacman
L294_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L296_pacman
	LEA R7, i
	LDR R7, R7, #0
	LEA R3, numdots
	LDR R3, R3, #0
	CMP R7, R3
	BRn L293_pacman
L292_pacman
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;main;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
main
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
	JSR draw_grid
	ADD R6, R6, #0	;; free space for arguments
	LEA R7, L302_pacman
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
L303_pacman
L304_pacman
	LEA R7, timer_speed
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_getc_timer
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #1	;; free space for arguments
	CONST R3, #116
	CMP R7, R3
	BRnp L303_pacman
	LEA R7, L306_pacman
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	JSR draw_score
	ADD R6, R6, #0	;; free space for arguments
	JSR reset_game_state
	ADD R6, R6, #0	;; free space for arguments
	JSR redraw
	ADD R6, R6, #0	;; free space for arguments
	JSR printnum
	ADD R6, R6, #0	;; free space for arguments
	JMP L308_pacman
L307_pacman
	LEA R7, timer_speed
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_getc_timer
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #1	;; free space for arguments
	LEA R3, c
	STR R7, R3, #0
	LEA R7, c
	LDR R7, R7, #0
	CONST R3, #119
	CMP R7, R3
	BRnp L310_pacman
	LEA R7, direction
	CONST R3, #1
	STR R3, R7, #0
	JMP L311_pacman
L310_pacman
	LEA R7, c
	LDR R7, R7, #0
	CONST R3, #97
	CMP R7, R3
	BRnp L312_pacman
	LEA R7, direction
	CONST R3, #4
	STR R3, R7, #0
	JMP L313_pacman
L312_pacman
	LEA R7, c
	LDR R7, R7, #0
	CONST R3, #115
	CMP R7, R3
	BRnp L314_pacman
	LEA R7, direction
	CONST R3, #2
	STR R3, R7, #0
	JMP L315_pacman
L314_pacman
	LEA R7, c
	LDR R7, R7, #0
	CONST R3, #100
	CMP R7, R3
	BRnp L316_pacman
	LEA R7, direction
	CONST R3, #3
	STR R3, R7, #0
L316_pacman
L315_pacman
L313_pacman
L311_pacman
	LEA R7, direction
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR move_pacman
	ADD R6, R6, #1	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR move_ghost
	ADD R6, R6, #2	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR move_ghost
	ADD R6, R6, #2	;; free space for arguments
	JSR eat_dot
	ADD R6, R6, #0	;; free space for arguments
	JSR redraw
	ADD R6, R6, #0	;; free space for arguments
L308_pacman
	JSR playerhit
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	CONST R3, #0
	CMP R7, R3
	BRnp L318_pacman
	LEA R7, score
	LDR R7, R7, #0
	LEA R3, numdots
	LDR R3, R3, #0
	CMP R7, R3
	BRnp L307_pacman
L318_pacman
	LEA R7, score
	LDR R7, R7, #0
	LEA R3, numdots
	LDR R3, R3, #0
	CMP R7, R3
	BRnp L319_pacman
	LEA R7, L321_pacman
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	JMP L320_pacman
L319_pacman
	LEA R7, L322_pacman
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
L320_pacman
	CONST R7, #0
L301_pacman
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

		.DATA
top 		.BLKW 1
		.DATA
bottom 		.BLKW 1
		.DATA
left 		.BLKW 1
		.DATA
right 		.BLKW 1
		.DATA
ghostsdirection 		.BLKW 4
		.DATA
ghostsprevy 		.BLKW 4
		.DATA
ghostsprevx 		.BLKW 4
		.DATA
ghostsy 		.BLKW 4
		.DATA
ghostsx 		.BLKW 4
		.DATA
randomdirection 		.BLKW 1
		.DATA
random 		.BLKW 1
		.DATA
y 		.BLKW 1
		.DATA
x 		.BLKW 1
		.DATA
prevdirection 		.BLKW 1
		.DATA
direction 		.BLKW 1
		.DATA
prevy 		.BLKW 1
		.DATA
prevx 		.BLKW 1
		.DATA
dotsy 		.BLKW 92
		.DATA
dotsx 		.BLKW 92
		.DATA
prev_score_right 		.BLKW 1
		.DATA
prev_score_middle 		.BLKW 1
		.DATA
prev_score_left 		.BLKW 1
		.DATA
score_right 		.BLKW 1
		.DATA
score_middle 		.BLKW 1
		.DATA
score_left 		.BLKW 1
		.DATA
score 		.BLKW 1
		.DATA
colors 		.BLKW 2
		.DATA
j 		.BLKW 1
		.DATA
i 		.BLKW 1
		.DATA
validspace 		.BLKW 15872
		.DATA
c 		.BLKW 1
		.DATA
L322_pacman 		.STRINGZ "You Lose"
		.DATA
L321_pacman 		.STRINGZ "You Win"
		.DATA
L306_pacman 		.STRINGZ "Use a to move left, s to down, d to move right, w to move up, try to collect all the pellets before being hit by a ghost\n"
		.DATA
L302_pacman 		.STRINGZ "Press t to start\n"
		.DATA
L17_pacman 		.STRINGZ "\n"
