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
	bl uart_put_char
	add r5, r5, #1
	b loop
done: 
	pop { r5, pc }

application:
	ldr r0 , =app_berichtje
	b print_asciz

app_berichtje:
.ascii "Hello world, the ANSWER is 42! @[]`{}~\n"
