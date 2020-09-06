.cpu cortex-m0
.text                           
.align 1

.global application

print_asciz:
	push { r5, lr }
	mov r5, r0
loop:
	ldrb  r0 , [r5]
	add r0, r0, #0
	beq done
	b upper_lower
midden:
	bl uart_put_char
	add r5, r5, #1
	b loop
done: 
	pop { r5, pc }

upper_lower:
	CMP r0, #97
	BGE lower_1
	CMP r0, #65
	BGE upper_1
	b midden
lower_1: 
	CMP r0, #122
	BLS lower_2
	b midden
lower_2:
	sub r0, r0, #32
	b midden
upper_1:
	CMP r0, #90
	BLS upper_2
	b midden
upper_2:
	add r0, r0, #32
	b midden

application:
	ldr r0 , =app_berichtje
	b print_asciz


app_berichtje:
.ascii "Hello world, the ANSWER is 42! @[]`{}~\n"




