	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r0, #67108864
	mov	r4, #0
	mov	ip, #4608
	strh	r4, [r0, #20]	@ movhi
	ldr	r5, .L4
	strh	r4, [r0, #22]	@ movhi
	mov	r3, #256
	strh	r4, [r0, #18]	@ movhi
	mov	r2, #83886080
	strh	r4, [r0, #16]	@ movhi
	ldr	r1, .L4+4
	strh	ip, [r0]	@ movhi
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1360
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r5
	ldr	r3, .L4+20
	str	r4, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	startscreenPal
	.word	startscreenTiles
	.word	100687872
	.word	startscreenMap
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r0, #5632
	mov	ip, #3072
	push	{r4, lr}
	mov	r2, #0
	mov	lr, #15
	strh	r0, [r3]	@ movhi
	ldr	r1, .L8
	ldr	r0, .L8+4
	strh	ip, [r3, #10]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	strh	r0, [r3, #12]	@ movhi
	ldr	r1, .L8+8
	ldr	r3, .L8+12
	ldrh	r0, [r1]
	strh	r0, [r3]	@ movhi
	ldr	r3, .L8+16
	ldrh	r3, [r3, #48]
	ldr	ip, .L8+20
	strh	r3, [r1]	@ movhi
	ldr	r0, .L8+24
	ldr	r1, .L8+28
	ldr	r3, .L8+32
	str	lr, [ip]
	str	r2, [r0]
	str	r2, [r1]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	-27640
	.word	20236
	.word	buttons
	.word	oldButtons
	.word	67109120
	.word	screenBlock
	.word	hOff1
	.word	vOff1
	.word	setupSounds
	.size	initialize, .-initialize
	.align	2
	.global	initBox
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBox, %function
initBox:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #151
	mov	r1, #137
	mov	r2, #0
	ldr	r3, .L11
	str	r0, [r3, #4]
	str	r1, [r3]
	str	r2, [r3, #44]
	bx	lr
.L12:
	.align	2
.L11:
	.word	box
	.size	initBox, .-initBox
	.align	2
	.global	goToHowto
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToHowto, %function
goToHowto:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #67108864
	mov	r0, #0
	push	{r4, lr}
	mov	r3, #256
	strh	r0, [r1, #20]	@ movhi
	ldr	r4, .L15
	strh	r0, [r1, #22]	@ movhi
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L15+4
	mov	lr, pc
	bx	r4
	mov	r3, #3824
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L15+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L15+12
	mov	r0, #3
	ldr	r1, .L15+16
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L15+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L16:
	.align	2
.L15:
	.word	DMANow
	.word	instructscreenPal
	.word	instructscreenTiles
	.word	100687872
	.word	instructscreenMap
	.word	state
	.size	goToHowto, .-goToHowto
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #0
	ldr	r2, .L24
	ldr	r3, [r2]
	ldr	r0, .L24+4
	push	{r4, lr}
	add	r3, r3, #1
	ldr	r1, .L24+8
	str	r3, [r2]
	str	ip, [r0]
	mov	lr, pc
	bx	r1
	ldr	r3, .L24+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L17
	ldr	r3, .L24+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L23
.L17:
	pop	{r4, lr}
	bx	lr
.L23:
	pop	{r4, lr}
	b	goToHowto
.L25:
	.align	2
.L24:
	.word	seed
	.word	level
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	start, .-start
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #67108864
	mov	r0, #0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L28
	strh	r0, [r1, #20]	@ movhi
	mov	r2, #83886080
	strh	r0, [r1, #22]	@ movhi
	mov	r0, #3
	ldr	r1, .L28+4
	mov	lr, pc
	bx	r4
	mov	r3, #2432
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L28+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L28+12
	ldr	r1, .L28+16
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L28+20
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L28+24
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L28+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L29:
	.align	2
.L28:
	.word	DMANow
	.word	pausescreenPal
	.word	pausescreenTiles
	.word	100687872
	.word	pausescreenMap
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #67108864
	mov	r0, #0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L32
	strh	r0, [r1, #20]	@ movhi
	mov	r2, #83886080
	strh	r0, [r1, #22]	@ movhi
	mov	r0, #3
	ldr	r1, .L32+4
	mov	lr, pc
	bx	r4
	mov	r3, #2576
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L32+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L32+12
	ldr	r1, .L32+16
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L32+20
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L32+24
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L32+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L33:
	.align	2
.L32:
	.word	DMANow
	.word	losescreenPal
	.word	losescreenTiles
	.word	100687872
	.word	losescreenMap
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L41
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L41+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L34
	ldr	r3, .L41+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L40
.L34:
	pop	{r4, lr}
	bx	lr
.L40:
	pop	{r4, lr}
	b	goToStart
.L42:
	.align	2
.L41:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, #67108864
	mov	r5, #0
	mov	r8, #1024
	ldr	r0, .L45
	ldr	r6, .L45+4
	strh	r5, [r4, #20]	@ movhi
	ldr	r7, .L45+8
	strh	r5, [r4, #22]	@ movhi
	mov	r3, #256
	strh	r8, [r4]	@ movhi
	mov	r2, #83886080
	strh	r0, [r4, #12]	@ movhi
	ldr	r1, .L45+12
	mov	r0, #3
	mov	lr, pc
	bx	r6
	mov	r3, #4608
	mov	r0, #3
	ldr	r2, .L45+16
	ldr	r1, .L45+20
	mov	lr, pc
	bx	r6
	mov	r1, r7
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L45+24
	mov	lr, pc
	bx	r6
	mov	r1, r7
	mov	r3, r8
	mov	r0, #3
	ldr	r2, .L45+28
	mov	lr, pc
	bx	r6
	ldr	r2, .L45+32
	ldr	r3, .L45+36
	str	r5, [r2]
	str	r5, [r3]
	strh	r5, [r4, #24]	@ movhi
	ldr	r3, .L45+40
	strh	r5, [r4, #26]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L45+44
	mov	lr, pc
	bx	r6
	mov	r2, #3
	ldr	r3, .L45+48
	pop	{r4, r5, r6, r7, r8, lr}
	str	r2, [r3]
	bx	lr
.L46:
	.align	2
.L45:
	.word	20236
	.word	DMANow
	.word	winnerMap
	.word	winnerPal
	.word	100712448
	.word	winnerTiles
	.word	100694016
	.word	100702208
	.word	hOff1
	.word	vOff1
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #67108864
	ldr	r1, .L57
	ldr	r0, [r1]
	add	r3, r0, #1
	push	{r4, lr}
	lsl	r2, r3, #16
	ldr	r4, .L57+4
	lsr	r2, r2, #16
	str	r3, [r1]
	strh	r2, [ip, #24]	@ movhi
	ldr	r2, [r4]
	sub	lr, r2, #18
	rsbs	ip, lr, #0
	adc	ip, ip, lr
	cmp	r3, #256
	movle	ip, #0
	cmp	ip, #0
	bne	.L55
	cmp	r3, #256
	subgt	r0, r0, #255
	addgt	r2, r2, #1
	strgt	r0, [r1]
	strgt	r2, [r4]
.L49:
	ldr	r3, .L57+8
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	ldr	r3, [r4]
	lsl	r3, r3, #24
	orr	r3, r3, #1073741824
	orr	r3, r3, #786432
	lsr	r3, r3, #16
	strh	r3, [r2, #12]	@ movhi
	ldr	r3, .L57+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L47
	ldr	r3, .L57+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L56
.L47:
	pop	{r4, lr}
	bx	lr
.L56:
	pop	{r4, lr}
	b	goToStart
.L55:
	mov	r2, #15
	mov	r3, #0
	str	r2, [r4]
	str	r3, [r1]
	b	.L49
.L58:
	.align	2
.L57:
	.word	hOff1
	.word	screenBlock
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #4608
	mov	r5, #67108864
	ldr	r3, .L61
	strh	r2, [r5]	@ movhi
	ldr	r4, .L61+4
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L61+8
	mov	lr, pc
	bx	r4
	mov	r3, #208
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L61+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L61+16
	ldr	r1, .L61+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L61+24
	ldrh	r2, [r3]
	ldr	r3, .L61+28
	strh	r2, [r5, #22]	@ movhi
	ldrh	r2, [r3]
	mov	r0, #3
	strh	r2, [r5, #20]	@ movhi
	mov	r3, #16384
	ldr	r2, .L61+32
	ldr	r1, .L61+36
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L61+40
	ldr	r1, .L61+44
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L61+48
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L61+52
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L61+56
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L62:
	.align	2
.L61:
	.word	waitForVBlank
	.word	DMANow
	.word	backgroundPal
	.word	backgroundTiles
	.word	100687872
	.word	backgroundMap
	.word	vOff
	.word	hOff
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	howto
	.syntax unified
	.arm
	.fpu softvfp
	.type	howto, %function
howto:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L70
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L70+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L63
	ldr	r3, .L70+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L69
.L63:
	pop	{r4, lr}
	bx	lr
.L69:
	ldr	r3, .L70+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L70+16
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L70+20
	ldr	r3, .L70+24
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L70+28
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L71:
	.align	2
.L70:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	stopSound
	.word	gameSong_length
	.word	gameSong_data
	.word	playSoundA
	.word	initGame
	.size	howto, .-howto
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L79
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L79+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L72
	ldr	r3, .L79+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L78
.L72:
	pop	{r4, lr}
	bx	lr
.L78:
	bl	goToGame
	ldr	r3, .L79+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L79+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L80:
	.align	2
.L79:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	unpauseSound
	.word	unstopClock
	.size	pause, .-pause
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L94
	push	{r4, lr}
	ldr	r0, [r2]
	ldr	r3, .L94+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L94+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L94+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L94+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L82
	ldr	r3, .L94+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L90
.L82:
	ldr	r4, .L94+24
	ldr	r3, [r4]
	cmp	r3, #3
	beq	.L91
.L83:
	ldr	r3, .L94+28
	ldr	r3, [r3]
	cmp	r3, #12
	bgt	.L92
	ldr	r3, [r4]
	cmp	r3, #2
	beq	.L93
.L81:
	pop	{r4, lr}
	bx	lr
.L92:
	ldr	r3, .L94+32
	mov	lr, pc
	bx	r3
	bl	goToWin
	ldr	r2, .L94+36
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	ldr	r3, [r4]
	cmp	r3, #2
	bne	.L81
.L93:
	ldr	r3, .L94+40
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L94+44
	ldr	r3, .L94+48
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L91:
	ldr	r3, .L94+32
	mov	lr, pc
	bx	r3
	bl	goToLose
	b	.L83
.L90:
	bl	goToPause
	ldr	r3, .L94+52
	mov	lr, pc
	bx	r3
	ldr	r3, .L94+56
	mov	lr, pc
	bx	r3
	b	.L82
.L95:
	.align	2
.L94:
	.word	seed
	.word	srand
	.word	updateGame
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	hit
	.word	postershit
	.word	stopSound
	.word	level
	.word	collide_length
	.word	collide_data
	.word	playSoundB
	.word	pauseSound
	.word	stopClock
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L109
	mov	lr, pc
	bx	r3
	ldr	r6, .L109+4
	ldr	r8, .L109+8
	ldr	r5, .L109+12
	ldr	fp, .L109+16
	ldr	r10, .L109+20
	ldr	r9, .L109+24
	ldr	r7, .L109+28
	ldr	r4, .L109+32
.L97:
	ldr	r1, [r6]
	ldrh	r3, [r8]
.L98:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r1, #5
	ldrls	pc, [pc, r1, asl #2]
	b	.L98
.L100:
	.word	.L105
	.word	.L104
	.word	.L103
	.word	.L102
	.word	.L101
	.word	.L99
.L102:
	ldr	r3, .L109+36
	mov	lr, pc
	bx	r3
.L101:
	mov	lr, pc
	bx	r7
	b	.L97
.L103:
	ldr	r3, .L109+40
	mov	lr, pc
	bx	r3
	b	.L97
.L104:
	mov	lr, pc
	bx	r9
	b	.L97
.L105:
	mov	lr, pc
	bx	fp
	b	.L97
.L99:
	mov	lr, pc
	bx	r10
	b	.L97
.L110:
	.align	2
.L109:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	howto
	.word	game
	.word	lose
	.word	67109120
	.word	win
	.word	pause
	.size	main, .-main
	.comm	tapped,4,4
	.comm	vOff1,4,4
	.comm	hOff1,4,4
	.comm	screenBlock,4,4
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	box,88,4
	.comm	shadowOAM,1024,4
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
