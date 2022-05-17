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
	.file	"game.c"
	.text
	.align	2
	.global	interruptHandler
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L26
	ldrh	r1, [r3, #2]
	tst	r1, #32
	push	{r4, lr}
	strh	r2, [r3, #8]	@ movhi
	beq	.L3
	ldr	r3, .L26+4
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L22
.L3:
	ldr	r3, .L26
	ldrh	r3, [r3, #2]
	tst	r3, #1
	beq	.L5
	ldr	r3, .L26+8
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L7
	ldr	r2, [r3, #28]
	ldr	r1, [r3, #20]
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #28]
	ble	.L7
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L23
	ldr	r0, .L26+12
	ldr	r1, .L26+16
	ldr	r0, [r0]
	str	r2, [r3, #12]
	str	r2, [r0, #20]
	strh	r2, [r1, #2]	@ movhi
.L7:
	ldr	r3, .L26+20
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bne	.L24
.L11:
	mov	r2, #1
	ldr	r3, .L26
	strh	r2, [r3, #2]	@ movhi
.L5:
	mov	r1, #1
	ldr	r3, .L26
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L24:
	ldr	r2, [r3, #28]
	ldr	r1, [r3, #20]
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #28]
	ble	.L11
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L25
	ldr	r0, .L26+12
	ldr	r1, .L26+16
	ldr	r0, [r0]
	str	r2, [r3, #12]
	str	r2, [r0, #32]
	strh	r2, [r1, #6]	@ movhi
	b	.L11
.L22:
	ldr	r1, [r3, #4]
	sub	r2, r1, #1
	cmp	r2, #0
	str	r2, [r3, #4]
	bge	.L3
	ldr	r0, .L26+24
	ldr	r2, [r0]
	cmp	r2, #0
	addgt	r1, r1, #59
	subgt	r2, r2, #1
	strgt	r1, [r3, #4]
	strgt	r2, [r0]
	b	.L3
.L23:
	ldm	r3, {r0, r1}
	ldr	r3, .L26+28
	mov	lr, pc
	bx	r3
	b	.L7
.L25:
	ldm	r3, {r0, r1}
	ldr	r3, .L26+32
	mov	lr, pc
	bx	r3
	b	.L11
.L27:
	.align	2
.L26:
	.word	67109376
	.word	.LANCHOR0
	.word	soundA
	.word	dma
	.word	67109120
	.word	soundB
	.word	time_m
	.word	playSoundA
	.word	playSoundB
	.size	interruptHandler, .-interruptHandler
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer.part.0, %function
initPlayer.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #0
	mov	r4, #221
	mov	lr, #44
	mov	r0, #16
	mov	r1, #1
	mov	ip, #5
	ldr	r3, .L30
	stm	r3, {r4, lr}
	str	r2, [r3, #52]
	str	r2, [r3, #44]
	str	r2, [r3, #48]
	str	r2, [r3, #28]
	str	r2, [r3, #36]
	str	r2, [r3, #60]
	str	r2, [r3, #64]
	str	r2, [r3, #84]
	str	ip, [r3, #40]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	pop	{r4, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	player
	.size	initPlayer.part.0, .-initPlayer.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemy.part.0, %function
initEnemy.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r1, #144
	mov	r5, #16
	mov	r4, #32
	mov	r0, #1
	mov	lr, #155
	mov	r2, #0
	mov	ip, #3
	ldr	r3, .L36
.L33:
	str	r1, [r3]
	sub	r1, r1, #69
	cmn	r1, #63
	str	r5, [r3, #16]
	str	r4, [r3, #20]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	lr, [r3, #4]
	str	r2, [r3, #44]
	str	r2, [r3, #48]
	str	r2, [r3, #28]
	str	r2, [r3, #36]
	str	r2, [r3, #24]
	str	ip, [r3, #40]
	str	r2, [r3, #68]
	str	r0, [r3, #72]
	str	r2, [r3, #76]
	add	r3, r3, #88
	bne	.L33
	pop	{r4, r5, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	enemy
	.size	initEnemy.part.0, .-initEnemy.part.0
	.global	__aeabi_idivmod
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPoster.part.0, %function
initPoster.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r6, .L59
	mov	r5, #0
	mov	r4, r6
	mov	r7, #16
	ldr	r9, .L59+4
	ldr	r8, .L59+8
.L52:
	mov	r3, #1
	cmp	r5, r3
	str	r7, [r4, #16]
	str	r7, [r4, #20]
	str	r3, [r4, #8]
	str	r3, [r4, #12]
	ble	.L54
	cmp	r5, #2
	beq	.L55
	cmp	r5, #3
	beq	.L56
	cmp	r5, #4
	bne	.L42
	mov	r2, #50
	mov	r3, #73
	str	r2, [r6, #356]
	str	r3, [r6, #352]
.L48:
	mov	r3, #0
	add	r5, r5, #1
	cmp	r5, #14
	str	r3, [r4, #44]
	str	r3, [r4, #48]
	str	r3, [r4, #28]
	str	r3, [r4, #36]
	add	r4, r4, #88
	bne	.L52
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L54:
	mov	r2, #143
	rsb	r3, r5, r5, lsl #3
	rsb	r3, r5, r3, lsl #3
	add	r3, r3, #18
	stm	r4, {r2, r3}
.L42:
	cmp	r5, #5
	beq	.L57
	cmp	r5, #6
	beq	.L58
	cmp	r5, #7
	bne	.L45
	mov	r3, #0
	mov	r1, #50
	mov	r2, #73
	str	r1, [r6, #620]
	str	r2, [r6, #616]
	mov	r5, #8
	str	r3, [r4, #44]
	str	r3, [r4, #48]
	str	r3, [r4, #28]
	str	r3, [r4, #36]
	add	r4, r4, #88
	b	.L52
.L45:
	ble	.L48
	mov	lr, pc
	bx	r9
	add	r1, r5, r5, lsl #1
	lsl	r1, r1, #2
	add	r1, r1, #40
	mov	lr, pc
	bx	r8
	mov	r3, #8
	add	r1, r1, #10
	str	r1, [r4, #4]
	str	r3, [r4]
	b	.L48
.L58:
	mov	r2, #218
	mov	r3, #73
	str	r2, [r6, #532]
	str	r3, [r6, #528]
	b	.L48
.L57:
	mov	r2, #145
	mov	r3, #73
	str	r2, [r6, #444]
	str	r3, [r6, #440]
	b	.L48
.L56:
	mov	r2, #216
	mov	r3, #143
	str	r2, [r6, #268]
	str	r3, [r6, #264]
	b	.L48
.L55:
	mov	r2, #144
	mov	r3, #143
	str	r2, [r6, #180]
	str	r3, [r6, #176]
	b	.L48
.L60:
	.align	2
.L59:
	.word	poster
	.word	rand
	.word	__aeabi_idivmod
	.size	initPoster.part.0, .-initPoster.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer.part.0, %function
drawPlayer.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L69
	ldr	r3, [r1, #48]
	cmp	r3, #0
	push	{r4, r5, r6, lr}
	bne	.L62
	ldr	r3, [r1, #4]
	ldr	r0, .L69+4
	ldr	ip, .L69+8
	ldr	r0, [r0]
	lsl	r3, r3, #23
	ldr	r2, [r1, #28]
	lsr	r3, r3, #23
	ldr	r5, [ip]
	ldr	r4, [r1, #36]
	sub	r3, r3, r0
	ldrb	r0, [r1]	@ zero_extendqisi2
	ldr	lr, .L69+12
	add	r2, r2, #5
	ldr	ip, .L69+16
	add	r2, r2, r4, lsl #6
	sub	r1, r0, r5
	orr	r3, r3, lr
	orr	r1, r1, lr
	lsl	r2, r2, #1
	strh	r3, [ip, #2]	@ movhi
	strh	r1, [ip]	@ movhi
	strh	r2, [ip, #4]	@ movhi
	ldr	r4, .L69+20
.L63:
	ldr	r3, [r4, #8]
	cmp	r3, #2
	moveq	r3, #83886080
	moveq	r2, #31
	pop	{r4, r5, r6, lr}
	strheq	r2, [r3, #2]	@ movhi
	bx	lr
.L62:
	cmp	r3, #1
	ldr	r4, .L69+20
	bne	.L63
	ldr	r3, [r4]
	cmp	r3, #0
	bleq	initPlayer.part.0
.L64:
	mov	r3, #0
	mov	r0, #95
	ldr	r1, .L69+8
	ldr	r2, .L69+4
	str	r0, [r1]
	str	r3, [r4, #4]
	str	r3, [r2]
	b	.L63
.L70:
	.align	2
.L69:
	.word	player
	.word	hOff
	.word	vOff
	.word	-32768
	.word	shadowOAM
	.word	.LANCHOR1
	.size	drawPlayer.part.0, .-drawPlayer.part.0
	.align	2
	.global	showTimer
	.syntax unified
	.arm
	.fpu softvfp
	.type	showTimer, %function
showTimer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	ip, #0
	mov	r7, #160
	ldr	r3, .L73
	mov	r6, #168
	ldr	r8, [r3]
	ldr	r2, .L73+4
	mov	r5, #176
	smull	r1, r3, r2, r8
	mov	r4, #184
	mov	lr, #192
	ldr	r1, .L73+8
	ldr	r1, [r1, #4]
	smull	r0, r9, r2, r1
	asr	r0, r8, #31
	rsb	r0, r0, r3, asr #2
	add	r2, r0, r0, lsl #2
	ldr	r3, .L73+12
	sub	r8, r8, r2, lsl #1
	add	r8, r8, #960
	add	r2, r3, #492
	strh	r8, [r2]	@ movhi
	add	r0, r0, #960
	add	r2, r3, #484
	strh	r0, [r2]	@ movhi
	asr	r2, r1, #31
	rsb	r2, r2, r9, asr #2
	add	r0, r2, r2, lsl #2
	sub	r1, r1, r0, lsl #1
	add	r1, r1, #960
	add	r0, r3, #516
	add	r2, r2, #960
	strh	r1, [r0]	@ movhi
	add	r1, r3, #508
	strh	r2, [r1]	@ movhi
	add	r2, r3, #480
	strh	r7, [r2, #2]	@ movhi
	strh	ip, [r2]	@ movhi
	add	r2, r3, #488
	strh	ip, [r2]	@ movhi
	strh	r6, [r2, #2]	@ movhi
	ldr	r1, .L73+16
	add	r2, r3, #496
	strh	ip, [r2]	@ movhi
	strh	r5, [r2, #2]	@ movhi
	add	r2, r3, #500
	strh	r1, [r2]	@ movhi
	add	r2, r3, #504
	add	r3, r3, #512
	strh	r4, [r2, #2]	@ movhi
	strh	lr, [r3, #2]	@ movhi
	strh	ip, [r2]	@ movhi
	strh	ip, [r3]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L74:
	.align	2
.L73:
	.word	time_m
	.word	1717986919
	.word	.LANCHOR0
	.word	shadowOAM
	.word	970
	.size	showTimer, .-showTimer
	.align	2
	.global	enableTimerInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	enableTimerInterrupts, %function
enableTimerInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #0
	mov	r4, #49152
	mov	ip, #195
	mov	lr, #96
	mvn	r0, #59
	mov	r1, #196
	ldr	r3, .L77
	strh	r2, [r3, #10]	@ movhi
	strh	r4, [r3, #8]	@ movhi
	strh	ip, [r3, #10]	@ movhi
	ldr	ip, .L77+4
	strh	r2, [r3, #14]	@ movhi
	strh	lr, [ip]	@ movhi
	strh	r0, [r3, #12]	@ movhi
	pop	{r4, lr}
	strh	r1, [r3, #14]	@ movhi
	bx	lr
.L78:
	.align	2
.L77:
	.word	67109120
	.word	67109376
	.size	enableTimerInterrupts, .-enableTimerInterrupts
	.align	2
	.global	stopClock
	.syntax unified
	.arm
	.fpu softvfp
	.type	stopClock, %function
stopClock:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L80
	str	r2, [r3]
	bx	lr
.L81:
	.align	2
.L80:
	.word	.LANCHOR0
	.size	stopClock, .-stopClock
	.align	2
	.global	unstopClock
	.syntax unified
	.arm
	.fpu softvfp
	.type	unstopClock, %function
unstopClock:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #1
	ldr	r3, .L83
	str	r2, [r3]
	bx	lr
.L84:
	.align	2
.L83:
	.word	.LANCHOR0
	.size	unstopClock, .-unstopClock
	.align	2
	.global	updateTime
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateTime, %function
updateTime:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L101
	ldr	r3, [r0, #4]
	ldr	r1, .L101+4
	ldr	r2, .L101+8
	cmp	r3, #29
	push	{r4, r5, lr}
	ldr	ip, [r1]
	ldr	lr, [r2, #12]
	bgt	.L86
	ldr	r4, [r2, #8]
	cmp	r4, #1
	ble	.L98
.L86:
	cmp	r3, #0
	cmple	ip, #0
	movle	r3, #1
	movgt	r3, #0
	cmp	lr, #0
	bne	.L99
	cmp	r3, #0
	movne	r3, #3
	strne	r3, [r2, #8]
	bne	.L92
.L91:
	ldr	r3, [r2, #8]
	cmp	r3, #3
	beq	.L92
.L85:
	pop	{r4, r5, lr}
	bx	lr
.L99:
	cmp	r3, #0
	beq	.L85
	mov	lr, #0
	mov	ip, #59
	mov	r3, #3
	str	lr, [r1]
	str	ip, [r0, #4]
	str	r3, [r2, #8]
	b	.L85
.L98:
	cmp	ip, #0
	ble	.L100
	cmp	lr, #0
	beq	.L91
	b	.L85
.L100:
	mov	r4, #83886080
	mov	r5, #31
	strh	r5, [r4, #2]	@ movhi
	b	.L86
.L92:
	mov	r2, #0
	mov	r3, #59
	str	r2, [r1]
	str	r3, [r0, #4]
	pop	{r4, r5, lr}
	bx	lr
.L102:
	.align	2
.L101:
	.word	.LANCHOR0
	.word	time_m
	.word	.LANCHOR1
	.size	updateTime, .-updateTime
	.align	2
	.global	setupInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #0
	mov	r6, #49152
	mov	r5, #195
	mov	r1, #67108864
	mvn	r4, #59
	mov	lr, #196
	mov	ip, #97
	mov	r0, #1
	ldr	r3, .L105
	strh	r2, [r3, #10]	@ movhi
	strh	r6, [r3, #8]	@ movhi
	strh	r5, [r3, #10]	@ movhi
	strh	r2, [r3, #14]	@ movhi
	ldrh	r2, [r1, #4]
	orr	r2, r2, #8
	strh	r4, [r3, #12]	@ movhi
	strh	r2, [r1, #4]	@ movhi
	strh	lr, [r3, #14]	@ movhi
	ldr	r2, .L105+4
	ldr	r1, .L105+8
	ldr	r3, .L105+12
	strh	ip, [r2]	@ movhi
	strh	r0, [r2, #8]	@ movhi
	pop	{r4, r5, r6, lr}
	str	r3, [r1, #4092]
	bx	lr
.L106:
	.align	2
.L105:
	.word	67109120
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.align	2
	.global	updateLevel
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateLevel, %function
updateLevel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L113
	ldr	r3, [r2]
	cmn	r3, #256
	bxge	lr
	ldr	r0, .L113+4
	ldr	r1, [r0]
	cmp	r1, #0
	bxle	lr
	str	lr, [sp, #-4]!
	ldr	lr, .L113+8
	ldr	ip, [lr]
	sub	r1, r1, #1
	add	r3, r3, #256
	sub	ip, ip, #256
	str	ip, [lr]
	str	r1, [r0]
	str	r3, [r2]
	ldr	lr, [sp], #4
	bx	lr
.L114:
	.align	2
.L113:
	.word	vOff
	.word	sb
	.word	player
	.size	updateLevel, .-updateLevel
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L117
	ldr	r3, [r3]
	cmp	r3, #0
	bxne	lr
	b	initPlayer.part.0
.L118:
	.align	2
.L117:
	.word	.LANCHOR1
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemy, %function
initEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L121
	ldr	r3, [r3]
	cmp	r3, #0
	bxne	lr
	b	initEnemy.part.0
.L122:
	.align	2
.L121:
	.word	.LANCHOR1
	.size	initEnemy, .-initEnemy
	.align	2
	.global	initPoster
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPoster, %function
initPoster:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L125
	ldr	r3, [r3]
	cmp	r3, #0
	bxne	lr
	b	initPoster.part.0
.L126:
	.align	2
.L125:
	.word	.LANCHOR1
	.size	initPoster, .-initPoster
	.align	2
	.global	initDoor
	.syntax unified
	.arm
	.fpu softvfp
	.type	initDoor, %function
initDoor:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r1, #232
	mov	ip, #16
	mov	r0, #1
	mov	lr, #104
	mov	r2, #0
	ldr	r3, .L131
.L128:
	str	r1, [r3]
	sub	r1, r1, #72
	cmn	r1, #56
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	lr, [r3, #4]
	str	r2, [r3, #44]
	str	r2, [r3, #48]
	str	r2, [r3, #80]
	str	r2, [r3, #28]
	str	r2, [r3, #36]
	add	r3, r3, #88
	bne	.L128
	ldr	lr, [sp], #4
	bx	lr
.L132:
	.align	2
.L131:
	.word	door
	.size	initDoor, .-initDoor
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	mov	r0, #59
	mov	r1, #3
	mov	r2, #95
	push	{r4, r5, r6, lr}
	ldr	r4, .L141
	ldr	ip, [r4]
	cmp	ip, r3
	ldr	ip, .L141+4
	str	r3, [ip]
	ldr	ip, .L141+8
	str	r3, [r4, #16]
	str	r3, [r4, #8]
	str	r3, [r4, #20]
	str	r3, [r4, #24]
	str	r3, [r4, #12]
	str	r3, [ip]
	ldr	r5, .L141+12
	ldr	r3, .L141+16
	stmib	r5, {r0, r1}
	str	r2, [r3]
	bne	.L138
	bl	initPlayer.part.0
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L138
	bl	initPoster.part.0
	ldr	r3, [r4]
	cmp	r3, #0
	bleq	initEnemy.part.0
.L138:
	bl	initDoor
	mov	r2, #0
	mov	r0, #16
	mov	r1, #1
	mov	lr, #176
	mov	r6, #145
	mov	r4, #73
	ldr	ip, [r5, #8]
	ldr	r3, .L141+20
	cmp	ip, r2
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r0, [r3, #104]
	str	r0, [r3, #108]
	str	r6, [r3]
	str	r4, [r3, #88]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r1, [r3, #96]
	str	r1, [r3, #100]
	str	lr, [r3, #4]
	str	lr, [r3, #92]
	str	r2, [r3, #44]
	str	r2, [r3, #48]
	str	r2, [r3, #28]
	str	r2, [r3, #36]
	str	r2, [r3, #132]
	str	r2, [r3, #136]
	str	r2, [r3, #116]
	str	r2, [r3, #124]
	ble	.L136
	mov	r1, #13
	mov	r0, #8
	add	ip, ip, ip, lsl #2
	lsl	ip, ip, #1
	ldr	r3, .L141+24
	add	ip, ip, r1
.L137:
	str	r1, [r3, #4]
	add	r1, r1, #10
	cmp	r1, ip
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r2, [r3]
	str	r2, [r3, #28]
	str	r2, [r3, #36]
	add	r3, r3, #88
	bne	.L137
.L136:
	mov	r2, #0
	mov	r6, #49152
	mov	r5, #195
	mov	r1, #67108864
	mvn	r4, #59
	mov	lr, #196
	mov	ip, #97
	mov	r0, #1
	ldr	r3, .L141+28
	strh	r2, [r3, #10]	@ movhi
	strh	r6, [r3, #8]	@ movhi
	strh	r5, [r3, #10]	@ movhi
	strh	r2, [r3, #14]	@ movhi
	ldrh	r2, [r1, #4]
	orr	r2, r2, #8
	strh	r4, [r3, #12]	@ movhi
	strh	r2, [r1, #4]	@ movhi
	strh	lr, [r3, #14]	@ movhi
	ldr	r2, .L141+32
	ldr	r1, .L141+36
	ldr	r3, .L141+40
	strh	ip, [r2]	@ movhi
	strh	r0, [r2, #8]	@ movhi
	pop	{r4, r5, r6, lr}
	str	r3, [r1, #4092]
	bx	lr
.L142:
	.align	2
.L141:
	.word	.LANCHOR1
	.word	time_m
	.word	hOff
	.word	.LANCHOR0
	.word	vOff
	.word	curtain
	.word	lives
	.word	67109120
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	initGame, .-initGame
	.align	2
	.global	initCurtain
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCurtain, %function
initCurtain:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #0
	mov	r0, #16
	mov	r1, #1
	mov	r4, #145
	mov	lr, #73
	mov	ip, #176
	ldr	r3, .L145
	str	r4, [r3]
	str	lr, [r3, #88]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r0, [r3, #104]
	str	r0, [r3, #108]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r1, [r3, #96]
	str	r1, [r3, #100]
	str	ip, [r3, #4]
	str	ip, [r3, #92]
	str	r2, [r3, #44]
	str	r2, [r3, #48]
	str	r2, [r3, #28]
	str	r2, [r3, #36]
	str	r2, [r3, #132]
	str	r2, [r3, #136]
	str	r2, [r3, #116]
	str	r2, [r3, #124]
	pop	{r4, lr}
	bx	lr
.L146:
	.align	2
.L145:
	.word	curtain
	.size	initCurtain, .-initCurtain
	.align	2
	.global	initLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLives, %function
initLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L151
	ldr	ip, [r3, #8]
	cmp	ip, #0
	bxle	lr
	mov	r2, #13
	mov	r0, #8
	mov	r1, #0
	add	ip, ip, ip, lsl #2
	lsl	ip, ip, #1
	ldr	r3, .L151+4
	add	ip, ip, r2
.L149:
	str	r2, [r3, #4]
	add	r2, r2, #10
	cmp	r2, ip
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r1, [r3]
	str	r1, [r3, #28]
	str	r1, [r3, #36]
	add	r3, r3, #88
	bne	.L149
	bx	lr
.L152:
	.align	2
.L151:
	.word	.LANCHOR0
	.word	lives
	.size	initLives, .-initLives
	.align	2
	.global	updateLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateLives, %function
updateLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L162
	ldrh	r3, [r3]
	ldr	r2, .L162+4
	tst	r3, #2
	ldr	r3, [r2, #8]
	beq	.L154
	ldr	r1, .L162+8
	ldrh	r1, [r1]
	tst	r1, #2
	beq	.L160
.L154:
	cmp	r3, #1
	beq	.L161
.L155:
	cmp	r3, #2
	moveq	r2, #1
	ldreq	r3, .L162+12
	streq	r2, [r3, #8]
	bx	lr
.L160:
	cmp	r3, #0
	ble	.L155
	sub	r3, r3, #1
	cmp	r3, #1
	str	r3, [r2, #8]
	bne	.L155
.L161:
	mov	r2, #2
	ldr	r3, .L162+12
	str	r2, [r3, #8]
	bx	lr
.L163:
	.align	2
.L162:
	.word	oldButtons
	.word	.LANCHOR1
	.word	buttons
	.word	.LANCHOR0
	.size	updateLives, .-updateLives
	.align	2
	.global	animatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	animatePlayer, %function
animatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #2
	push	{r4, r5, r6, lr}
	ldr	r4, .L176
	ldr	r3, .L176+4
	ldr	r5, [r4, #24]
	smull	r0, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	ldr	r6, [r4, #28]
	add	r3, r3, r3, lsl r1
	cmp	r5, r3, lsl r1
	str	r6, [r4, #32]
	str	r1, [r4, #28]
	bne	.L165
	ldr	r0, [r4, #36]
	ldr	r3, .L176+8
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L165:
	ldr	r2, .L176+12
	ldrh	r3, [r2, #48]
	ands	r3, r3, #16
	bne	.L166
	ldrh	r2, [r2, #48]
	tst	r2, #32
	str	r3, [r4, #28]
	bne	.L167
.L169:
	mov	r3, #1
	str	r3, [r4, #28]
.L167:
	add	r5, r5, #1
	str	r5, [r4, #24]
	pop	{r4, r5, r6, lr}
	bx	lr
.L166:
	ldrh	r3, [r2, #48]
	tst	r3, #32
	beq	.L169
	mov	r3, #0
	str	r6, [r4, #28]
	str	r3, [r4, #36]
	str	r3, [r4, #24]
	pop	{r4, r5, r6, lr}
	bx	lr
.L177:
	.align	2
.L176:
	.word	player
	.word	1717986919
	.word	__aeabi_idivmod
	.word	67109120
	.size	animatePlayer, .-animatePlayer
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L246
	ldrh	r3, [r3, #48]
	ands	r3, r3, #16
	sub	sp, sp, #28
	beq	.L179
	ldr	r4, .L246+4
.L180:
	ldr	r3, .L246
	ldrh	r3, [r3, #48]
	ands	r3, r3, #32
	bne	.L186
	ldr	r2, .L246+8
	ldr	r1, [r2, #48]
	cmp	r1, #1
	streq	r3, [r2, #48]
	ldr	r3, [r2, #136]
	cmp	r3, #1
	moveq	r3, #0
	streq	r3, [r2, #136]
	ldr	r3, [r4, #52]
	cmp	r3, #1
	moveq	r3, #0
	mov	r2, #0
	streq	r3, [r4, #52]
	ldr	r3, [r4, #4]
	cmp	r3, #13
	str	r2, [r4, #44]
	ldrgt	r2, [r4, #12]
	ldr	r1, .L246+12
	subgt	r3, r3, r2
	strgt	r3, [r4, #4]
	ldr	r3, [r1]
	cmp	r3, #0
	ble	.L186
	ldr	r2, [r4, #4]
	sub	r2, r2, r3
	cmp	r2, #120
	suble	r3, r3, #1
	strle	r3, [r1]
.L186:
	ldr	r10, .L246+16
	ldrh	r3, [r10]
	tst	r3, #64
	beq	.L240
	ldr	r2, .L246+20
	ldrh	r2, [r2]
	ands	r2, r2, #64
	bne	.L240
	ldr	r3, [r4, #52]
	ldr	r6, .L246+24
	cmp	r3, #1
	streq	r2, [r4, #52]
	ldr	r5, .L246+28
	ldr	r7, .L246+32
	add	r8, r6, #352
.L195:
	ldm	r6, {r2, r3}
	ldr	r0, [r6, #20]
	ldr	r1, [r6, #16]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	cmp	r0, #1
	beq	.L244
.L194:
	add	r6, r6, #88
	cmp	r6, r8
	bne	.L195
	ldrh	r3, [r10]
	tst	r3, #128
	bne	.L196
.L241:
	ldr	r7, .L246+36
.L198:
	ldr	r6, .L246+40
	add	r2, r4, #16
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	ldm	r2, {r2, r3}
	add	r9, r6, #1232
.L197:
	ldr	ip, [r6, #48]
	cmp	ip, #1
	beq	.L203
	add	ip, r6, #16
	ldm	ip, {ip, lr}
	str	lr, [sp, #12]
	ldr	lr, [r6]
	str	ip, [sp, #8]
	ldr	ip, [r6, #4]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r5
	cmp	r0, #1
	ldreq	r3, [r7, #24]
	add	r2, r4, #16
	addeq	r3, r3, #1
	streq	r0, [r6, #48]
	streq	r3, [r7, #24]
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	ldm	r2, {r2, r3}
.L203:
	add	r6, r6, #88
	cmp	r6, r9
	bne	.L197
	ldr	r6, .L246+44
	ldr	fp, .L246+48
	add	r9, r6, #264
.L208:
	ldr	ip, [r7, #28]
	ldr	lr, [r4, #48]
	add	ip, ip, #1
	cmp	lr, #1
	str	ip, [r7, #28]
	beq	.L205
	ldr	lr, [r6, #16]
	ldr	ip, [r6, #4]
	sub	lr, lr, #8
	str	lr, [sp, #8]
	add	ip, ip, #2
	ldr	lr, [r6, #20]
	str	ip, [sp]
	ldr	ip, [r6]
	str	lr, [sp, #12]
	str	ip, [sp, #4]
	mov	lr, pc
	bx	r5
	cmp	r0, #1
	beq	.L206
.L243:
	add	r2, r4, #16
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	ldm	r2, {r2, r3}
.L205:
	add	r6, r6, #88
	cmp	r6, r9
	bne	.L208
	ldr	r9, .L246+24
	mov	r6, r9
.L210:
	add	ip, r6, #16
	ldm	ip, {ip, lr}
	str	lr, [sp, #12]
	ldr	lr, [r6]
	str	ip, [sp, #8]
	ldr	ip, [r6, #4]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r5
	sub	r3, r0, #1
	rsbs	r0, r3, #0
	adc	r0, r0, r3
	str	r0, [r6, #48]
	add	r6, r6, #88
	cmp	r6, r8
	beq	.L209
	add	r2, r4, #16
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	ldm	r2, {r2, r3}
	b	.L210
.L240:
	tst	r3, #128
	ldr	r8, .L246+52
	ldr	r5, .L246+28
	beq	.L241
.L196:
	ldr	r3, .L246+20
	ldrh	r9, [r3]
	ands	r9, r9, #128
	bne	.L241
	ldr	r7, .L246+36
	ldr	r3, [r7, #20]
	add	r3, r3, #1
	str	r3, [r7, #20]
	ldr	r6, .L246+8
.L200:
	ldr	r2, [r6, #16]
	ldr	r3, [r6, #4]
	ldr	r0, [r6, #20]
	ldr	r1, [r6]
	sub	r2, r2, #6
	add	r3, r3, #1
	str	r2, [sp, #8]
	str	r0, [sp, #12]
	str	r1, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	cmp	r0, #1
	streq	r0, [r6, #48]
	streq	r0, [r4, #44]
	streq	r0, [r4, #52]
	cmp	r9, #1
	add	r6, r6, #88
	bne	.L218
	ldr	r6, .L246+24
	ldr	r9, .L246+32
.L202:
	ldm	r6, {r2, r3}
	ldr	r0, [r6, #20]
	ldr	r1, [r6, #16]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	cmp	r0, #1
	beq	.L245
.L201:
	add	r6, r6, #88
	cmp	r6, r8
	bne	.L202
	b	.L198
.L209:
	ldr	r0, [r9, #20]
	ldr	r1, [r9, #16]
	ldm	r9, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	cmp	r0, #1
	streq	r0, [r9, #80]
	add	r9, r9, #88
	cmp	r8, r9
	bne	.L209
	ldr	r3, [r4, #60]
	cmp	r3, #1
	bne	.L212
	ldr	r3, [r4]
	cmp	r3, #63
	movgt	r2, #0
	subgt	r3, r3, #70
	strgt	r3, [r4]
	strgt	r2, [r4, #60]
.L212:
	ldr	r3, [r4, #64]
	cmp	r3, #1
	moveq	r2, #0
	ldreq	r3, [r4]
	addeq	r3, r3, #70
	streq	r3, [r4]
	ldrh	r3, [r10]
	streq	r2, [r4, #64]
	tst	r3, #1
	beq	.L215
	ldr	r3, .L246+20
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L215
	ldr	r3, [r7, #12]
	cmp	r3, #0
	bne	.L215
	ldr	r2, .L246+56
	ldr	r3, [r2, #4]
	add	r1, r3, #10
	cmp	r1, #60
	ldrgt	r0, .L246+60
	ldrgt	r1, [r0]
	subgt	r3, r3, #50
	addgt	r1, r1, #1
	strle	r1, [r2, #4]
	strgt	r3, [r2, #4]
	strgt	r1, [r0]
.L215:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	animatePlayer
.L179:
	ldr	r2, .L246+8
	ldr	r1, [r2, #48]
	cmp	r1, #1
	streq	r3, [r2, #48]
	ldr	r3, [r2, #136]
	cmp	r3, #1
	moveq	r3, #0
	ldr	r4, .L246+4
	streq	r3, [r2, #136]
	ldr	r3, [r4, #52]
	cmp	r3, #1
	moveq	r3, #0
	mov	r1, #0
	streq	r3, [r4, #52]
	ldr	r2, [r4, #16]
	ldr	r3, [r4, #4]
	add	r2, r3, r2
	cmp	r2, #242
	str	r1, [r4, #44]
	bgt	.L180
	ldr	r1, .L246+12
	ldr	r0, [r4, #12]
	ldr	r2, [r1]
	add	r3, r3, r0
	cmp	r2, #14
	str	r3, [r4, #4]
	bgt	.L180
	sub	r3, r3, r2
	cmp	r3, #120
	addgt	r2, r2, #1
	strgt	r2, [r1]
	b	.L180
.L206:
	ldr	r2, [r4, #44]
	cmp	r2, #0
	bne	.L243
	ldr	r3, .L246+64
	str	r0, [sp, #20]
	ldr	r1, [r3]
	ldr	r0, .L246+68
	ldr	r3, .L246+72
	str	r2, [sp, #16]
	mov	lr, pc
	bx	r3
	ldr	r3, [sp, #20]
	mov	r0, #4352
	str	r3, [r4, #48]
	mov	r3, #67108864
	ldr	r1, [r7, #8]
	ldr	r2, [sp, #16]
	add	r1, r1, #1
	str	r2, [r4, #44]
	str	r1, [r7, #8]
	strh	r0, [r3, #76]	@ movhi
	ldrh	r3, [fp]
	orr	r3, r3, #4096
	strh	r3, [fp]	@ movhi
	b	.L243
.L244:
	ldr	r3, [r6, #48]
	cmp	r3, #1
	bne	.L194
	ldr	r2, [r4, #84]
	cmp	r2, #2
	bgt	.L194
	ldr	r1, [r7]
	add	r2, r2, #1
	sub	r1, r1, #33
	str	r2, [r4, #84]
	str	r3, [r4, #60]
	str	r1, [r7]
	b	.L194
.L245:
	ldr	r3, [r6, #80]
	cmp	r3, #1
	bne	.L201
	ldr	r2, [r4, #84]
	cmp	r2, #0
	ble	.L201
	ldr	r1, [r9]
	sub	r2, r2, #1
	add	r1, r1, #33
	str	r2, [r4, #84]
	str	r3, [r4, #64]
	str	r1, [r9]
	b	.L201
.L218:
	mov	r9, #1
	b	.L200
.L247:
	.align	2
.L246:
	.word	67109120
	.word	player
	.word	curtain
	.word	hOff
	.word	oldButtons
	.word	buttons
	.word	door
	.word	collision
	.word	vOff
	.word	.LANCHOR1
	.word	poster
	.word	enemy
	.word	shadowOAM
	.word	door+352
	.word	.LANCHOR0
	.word	time_m
	.word	collide_length
	.word	collide_data
	.word	playSoundB
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	animateEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateEnemy, %function
animateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r4, #0
	ldr	r2, .L255
	ldr	lr, .L255+4
	ldr	ip, .L255+8
	add	r0, r2, #264
.L252:
	ldr	r1, [r2, #24]
	add	r3, r1, r1, lsl #2
	add	r3, r3, r3, lsl #4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	add	r3, r1, r3, lsl #1
	add	r3, r3, lr
	cmp	ip, r3, ror #2
	add	r1, r1, #1
	bcc	.L250
	add	r3, r2, #36
	ldm	r3, {r3, r5}
	add	r3, r3, #1
	cmp	r3, r5
	movlt	r5, r3
	movge	r5, r4
	str	r5, [r2, #36]
.L250:
	str	r1, [r2, #24]
	add	r2, r2, #88
	cmp	r2, r0
	bne	.L252
	pop	{r4, r5, lr}
	bx	lr
.L256:
	.align	2
.L255:
	.word	enemy
	.word	715827880
	.word	357913940
	.size	animateEnemy, .-animateEnemy
	.align	2
	.global	updateEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy, %function
updateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r7, #1
	mov	r5, ip
	mvn	r6, #0
	ldr	r3, .L273
	ldr	r2, .L273+4
	ldr	r1, [r3, #32]
	smull	r0, r3, r2, r1
	ldr	r4, .L273+8
	asr	r2, r1, #31
	rsb	r2, r2, r3, asr #2
	ldr	r3, .L273+12
	add	r2, r2, r2, lsl #2
	ldr	r8, [r4]
	sub	r2, r1, r2, lsl r7
	add	r0, r3, #264
.L262:
	cmp	r2, #1
	beq	.L272
.L258:
	add	r3, r3, #88
	cmp	r3, r0
	bne	.L262
	cmp	ip, #0
	strne	r8, [r4]
	pop	{r4, r5, r6, r7, r8, r9, lr}
	b	animateEnemy
.L272:
	ldr	lr, [r3, #72]
	cmp	lr, #0
	beq	.L259
	ldr	r1, [r3, #68]
	cmp	r1, #48
	ble	.L260
	mov	ip, r2
	mov	r1, #0
	str	r5, [r3, #68]
	str	r6, [r3, #12]
	str	r5, [r3, #72]
	str	r2, [r3, #76]
	add	r8, r8, #1
.L260:
	ldr	lr, [r3, #4]
	ldr	r9, [r3, #12]
	add	r1, r1, #1
	add	lr, lr, r9
	str	r1, [r3, #68]
	str	r5, [r3, #28]
	str	lr, [r3, #4]
	b	.L258
.L259:
	ldr	r1, [r3, #76]
	cmp	r1, #0
	beq	.L258
	ldr	r1, [r3, #68]
	cmp	r1, #48
	ble	.L261
	mov	r1, lr
	mov	ip, r2
	str	lr, [r3, #68]
	str	r2, [r3, #12]
	str	lr, [r3, #76]
	str	r2, [r3, #72]
	add	r8, r8, #1
.L261:
	ldr	lr, [r3, #4]
	ldr	r9, [r3, #12]
	add	r1, r1, #1
	add	lr, lr, r9
	str	r1, [r3, #68]
	str	r7, [r3, #28]
	str	lr, [r3, #4]
	b	.L258
.L274:
	.align	2
.L273:
	.word	.LANCHOR1
	.word	1717986919
	.word	count
	.word	enemy
	.size	updateEnemy, .-updateEnemy
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updatePlayer
	bl	updateEnemy
	bl	updateTime
	ldr	r3, .L277
	ldr	r1, [r3, #32]
	ldr	r2, [r3, #28]
	add	r1, r1, #1
	add	r2, r2, #1
	str	r1, [r3, #32]
	str	r2, [r3, #28]
	pop	{r4, lr}
	bx	lr
.L278:
	.align	2
.L277:
	.word	.LANCHOR1
	.size	updateGame, .-updateGame
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L283
	ldr	r3, [r3, #52]
	cmp	r3, #0
	beq	.L280
	ldr	r2, .L283+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L280:
	b	drawPlayer.part.0
.L284:
	.align	2
.L283:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawPoster
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPoster, %function
drawPoster:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L294
	ldr	r1, .L294+4
	ldr	r3, .L294+8
	push	{r4, r5, r6, r7, r8, lr}
	ldrh	r5, [r2]
	ldrh	r6, [r1]
	ldr	r2, .L294+12
	ldr	r4, .L294+16
	add	lr, r3, #1232
	b	.L289
.L293:
	ldrh	r1, [r2, #8]
	add	r3, r3, #88
	orr	r1, r1, #512
	cmp	r3, lr
	strh	r1, [r2, #8]	@ movhi
	add	r2, r2, #8
	beq	.L292
.L289:
	ldr	r1, [r3, #52]
	cmp	r1, #0
	bne	.L293
	ldr	r7, [r3, #48]
	ldr	r0, [r3, #36]
	cmp	r7, #0
	ldr	r1, [r3, #4]
	ldr	r7, [r3, #28]
	add	r0, r0, #3
	lsl	r0, r0, #5
	ldr	ip, [r3]
	add	r8, r0, r7
	sub	r1, r1, r5
	addne	r7, r7, #1
	addne	r0, r7, r0
	and	r1, r1, r4
	sub	ip, ip, r6
	orr	r1, r1, #16384
	and	ip, ip, #255
	lslne	r0, r0, #1
	lsl	r8, r8, #1
	add	r3, r3, #88
	strheq	ip, [r2, #8]	@ movhi
	strheq	r1, [r2, #10]	@ movhi
	strheq	r8, [r2, #12]	@ movhi
	strhne	r0, [r2, #12]	@ movhi
	strhne	ip, [r2, #8]	@ movhi
	strhne	r1, [r2, #10]	@ movhi
	cmp	r3, lr
	add	r2, r2, #8
	bne	.L289
.L292:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L295:
	.align	2
.L294:
	.word	hOff
	.word	vOff
	.word	poster
	.word	shadowOAM
	.word	511
	.size	drawPoster, .-drawPoster
	.align	2
	.global	drawDoor
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawDoor, %function
drawDoor:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L303
	ldr	r2, .L303+4
	ldr	r3, .L303+8
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r0, .L303+12
	ldrh	r6, [r1]
	ldrh	r5, [r2]
	ldr	r4, .L303+16
	add	lr, r3, #352
.L300:
	ldr	r2, [r3, #52]
	cmp	r2, #0
	beq	.L297
	ldrh	r2, [r0, #160]
	orr	r2, r2, #512
	strh	r2, [r0, #160]	@ movhi
.L298:
	add	r3, r3, #88
	cmp	r3, lr
	add	r0, r0, #8
	bne	.L300
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L297:
	ldr	r7, [r3, #48]
	ldr	r2, [r3, #4]
	ldr	ip, [r3, #36]
	cmp	r7, #0
	ldrb	r1, [r3]	@ zero_extendqisi2
	ldr	r7, [r3, #28]
	and	r2, r2, r4
	add	ip, ip, #1
	lsl	ip, ip, #5
	sub	r2, r2, r5
	add	r8, ip, r7
	orr	r2, r2, #16384
	sub	r1, r1, r6
	addne	r7, r7, #1
	addne	ip, r7, ip
	lsl	r2, r2, #16
	lsl	r1, r1, #16
	lsr	r2, r2, #16
	lsr	r1, r1, #16
	lsl	r8, r8, #1
	lslne	ip, ip, #1
	strheq	r1, [r0, #160]	@ movhi
	strheq	r2, [r0, #162]	@ movhi
	strheq	r8, [r0, #164]	@ movhi
	strhne	ip, [r0, #164]	@ movhi
	strhne	r1, [r0, #160]	@ movhi
	strhne	r2, [r0, #162]	@ movhi
	b	.L298
.L304:
	.align	2
.L303:
	.word	vOff
	.word	hOff
	.word	door
	.word	shadowOAM
	.word	511
	.size	drawDoor, .-drawDoor
	.align	2
	.global	drawLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLives, %function
drawLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L323
	ldrh	r3, [r3]
	ldr	r2, .L323+4
	tst	r3, #2
	ldr	r3, [r2, #8]
	beq	.L306
	ldr	r1, .L323+8
	ldrh	r1, [r1]
	tst	r1, #2
	beq	.L321
.L306:
	cmp	r3, #0
	bne	.L307
	ldr	r3, .L323+12
	str	lr, [sp, #-4]!
	ldr	lr, [r3, #8]
	cmp	lr, #0
	ble	.L305
	ldr	r2, .L323+16
	add	r3, lr, lr, lsl #2
	add	lr, lr, r3, lsl #1
	ldr	r1, .L323+20
	add	lr, r2, lr, lsl #3
.L312:
	ldr	ip, [r2, #36]
	ldr	r3, [r2, #28]
	ldr	r0, [r2, #4]
	add	r3, r3, ip, lsl #5
	add	r3, r3, #34
	ldr	ip, [r2]
	add	r2, r2, #88
	lsl	r3, r3, #1
	orr	r0, r0, #16384
	cmp	lr, r2
	strh	r3, [r1, #4]	@ movhi
	strh	r0, [r1, #2]	@ movhi
	strh	ip, [r1]	@ movhi
	add	r1, r1, #8
	bne	.L312
.L305:
	ldr	lr, [sp], #4
	bx	lr
.L307:
	cmp	r3, #1
	beq	.L322
	cmp	r3, #2
	ldreq	r2, .L323+24
	ldrheq	r3, [r2]
	orreq	r3, r3, #512
	strheq	r3, [r2]	@ movhi
	bx	lr
.L321:
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r2, #8]
	b	.L306
.L322:
	ldr	r2, .L323+28
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L324:
	.align	2
.L323:
	.word	oldButtons
	.word	.LANCHOR1
	.word	buttons
	.word	.LANCHOR0
	.word	lives
	.word	shadowOAM+560
	.word	shadowOAM+568
	.word	shadowOAM+576
	.size	drawLives, .-drawLives
	.align	2
	.global	drawEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemy, %function
drawEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L331
	ldr	r1, .L331+4
	ldr	r3, .L331+8
	push	{r4, r5, r6, r7, r8, lr}
	ldr	ip, .L331+12
	ldrh	r4, [r2]
	ldrh	r5, [r1]
	ldr	r2, .L331+16
	ldr	lr, .L331+20
	add	r0, r3, #264
.L328:
	ldr	r1, [r3, #52]
	cmp	r1, #0
	beq	.L326
	ldrh	r1, [r2, #40]
	orr	r1, r1, #512
	strh	r1, [r2, #40]	@ movhi
.L327:
	add	r3, r3, #88
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L328
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L326:
	ldr	r1, [r3, #48]
	cmp	r1, #0
	bne	.L327
	ldr	r7, [r3]
	ldr	r6, [r3, #4]
	ldr	r1, [r3, #28]
	ldr	r8, [r3, #36]
	sub	r7, r7, r5
	sub	r6, r6, r4
	add	r1, r1, #7
	and	r7, r7, #255
	and	r6, r6, lr
	add	r1, r1, r8, lsl #6
	orr	r7, r7, ip
	orr	r6, r6, ip
	lsl	r1, r1, #1
	strh	r7, [r2, #240]	@ movhi
	strh	r6, [r2, #242]	@ movhi
	strh	r1, [r2, #244]	@ movhi
	b	.L327
.L332:
	.align	2
.L331:
	.word	hOff
	.word	vOff
	.word	enemy
	.word	-32768
	.word	shadowOAM
	.word	511
	.size	drawEnemy, .-drawEnemy
	.align	2
	.global	drawCurtain
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCurtain, %function
drawCurtain:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #0
	ldr	r2, .L341
	ldr	r3, .L341+4
	push	{r4, r5, r6, r7, r8, lr}
	ldrh	r5, [r2]
	ldrh	r4, [r3]
	ldr	r2, .L341+8
	ldr	r3, .L341+12
	ldr	lr, .L341+16
.L337:
	ldr	r1, [r3, #52]
	cmp	r1, #0
	beq	.L334
	ldrh	r1, [r2]
	cmp	ip, #1
	orr	r1, r1, #512
	strh	r1, [r2]	@ movhi
	add	r3, r3, #88
	add	r2, r2, #8
	bne	.L338
.L340:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L334:
	ldr	r6, [r3]
	ldr	r7, [r3, #48]
	ldr	r0, [r3, #36]
	sub	r6, r6, r5
	cmp	r7, #0
	ldr	r1, [r3, #4]
	and	r7, r6, #255
	add	r6, r0, #5
	ldr	r0, [r3, #28]
	sub	r1, r1, r4
	add	r8, r0, r6, lsl #6
	addne	r0, r0, #1
	addne	r0, r0, r6, lsl #5
	and	r1, r1, lr
	orr	r1, r1, #16384
	lslne	r0, r0, #1
	strheq	r7, [r2]	@ movhi
	strheq	r1, [r2, #2]	@ movhi
	strheq	r8, [r2, #4]	@ movhi
	strhne	r0, [r2, #4]	@ movhi
	strhne	r7, [r2]	@ movhi
	strhne	r1, [r2, #2]	@ movhi
	cmp	ip, #1
	add	r3, r3, #88
	add	r2, r2, #8
	beq	.L340
.L338:
	mov	ip, #1
	b	.L337
.L342:
	.align	2
.L341:
	.word	vOff
	.word	hOff
	.word	shadowOAM+360
	.word	curtain
	.word	511
	.size	drawCurtain, .-drawCurtain
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L347
	ldr	r3, [r3, #52]
	cmp	r3, #0
	push	{r4, lr}
	beq	.L344
	ldr	r2, .L347+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
.L345:
	bl	drawPoster
	bl	drawEnemy
	bl	drawDoor
	bl	drawCurtain
	bl	drawLives
	ldr	r3, .L347+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L347+12
	bl	showTimer
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L347+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L347+16
	ldrh	r1, [r2]
	ldr	r2, .L347+20
	ldrh	r2, [r2]
	strh	r1, [r3, #20]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #22]	@ movhi
	bx	lr
.L344:
	bl	drawPlayer.part.0
	b	.L345
.L348:
	.align	2
.L347:
	.word	player
	.word	shadowOAM
	.word	waitForVBlank
	.word	DMANow
	.word	hOff
	.word	vOff
	.size	drawGame, .-drawGame
	.global	heartenabled
	.global	isPlay
	.global	livesleft
	.global	level
	.global	checkframe
	.global	postercount
	.global	enemymove
	.comm	count,4,4
	.global	framesmos
	.global	frames
	.comm	sb,4,4
	.global	changetimes
	.global	time_s
	.comm	time_m,4,4
	.global	postershit
	.global	button
	.global	hit
	.comm	lives,880,4
	.comm	door,352,4
	.comm	enemy,264,4
	.comm	cart,88,4
	.comm	clock,88,4
	.comm	curtain,264,4
	.comm	poster,1232,4
	.comm	player,88,4
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	isPlay, %object
	.size	isPlay, 4
isPlay:
	.word	1
	.type	time_s, %object
	.size	time_s, 4
time_s:
	.word	60
	.type	livesleft, %object
	.size	livesleft, 4
livesleft:
	.word	3
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	level, %object
	.size	level, 4
level:
	.space	4
	.type	checkframe, %object
	.size	checkframe, 4
checkframe:
	.space	4
	.type	hit, %object
	.size	hit, 4
hit:
	.space	4
	.type	changetimes, %object
	.size	changetimes, 4
changetimes:
	.space	4
	.type	postercount, %object
	.size	postercount, 4
postercount:
	.space	4
	.type	button, %object
	.size	button, 4
button:
	.space	4
	.type	postershit, %object
	.size	postershit, 4
postershit:
	.space	4
	.type	framesmos, %object
	.size	framesmos, 4
framesmos:
	.space	4
	.type	frames, %object
	.size	frames, 4
frames:
	.space	4
	.type	heartenabled, %object
	.size	heartenabled, 4
heartenabled:
	.space	4
	.type	enemymove, %object
	.size	enemymove, 4
enemymove:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
