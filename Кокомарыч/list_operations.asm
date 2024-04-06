tplate list_item
value: ds 1
next: ds 1

asect 0x00
prog:
	ldi r0, item1
	ldi r1, 4
	jsr reverse_by_content
	jsr find_nth
	halt

#returns address of the nth item (in r1) of the list addressed by r0, stores it in r1
find_nth:
	save r0									#r0 -> cureent item
		save r3								#r3 = next item address offset
			ldi r3, list_item.next
			while
				tst r1
				stays nz
				add r3, r0					#r0 -> next item
				ld r0, r0					#r0 = next item
				dec r1
			wend
			move r0, r1						#r1 -> current item
		restore r3
	restore r0
	rts

#reverses list pointed to by r0
reverse_by_content:
#r0 -> current item, r1 = current value, r3 will keep original r0 value
	save r1
#save all the values in stack
			save r3
			move r0, r3
				while								#we will assume list is not empty
					ldi r1, list_item.value			#r1 = offset of value, so we can access it
					add r0, r1						#r1 -> current value
					ld r1, r1						#r1 = current value
					push r1							#current value in stack
					ldi r1, list_item.next			#r1 = offset of next item address
					add r1, r0						#r0 -> next item address
					ld r0, r0						#r0 = next item address
					tst r0
					stays nz
				wend
			move r3, r0
#store all the values in reverse order		
				while					
					ldi r1, list_item.value			#r1 = offset of value, so we can access it
					add r1, r0						#r0 -> current value
					pop r1							#current value from stack
					st r0, r1						#mem[r0] = value from stack
					ldi r1, list_item.value
					sub r1, r0						#r0 -> current item again
					neg r0
					ldi r1, list_item.next			#r1 = offset of next item address
					add r1, r0						#r0 -> next item address
					ld r0, r0						#r0 = next item address
					tst r0
					stays nz	
				wend
			move r3, r0
			restore r3
	restore r1
rts
	
item1: 
	dc "a", item2
item2:
	dc "b", item3
item3:
	dc "c", item4 
item4:
	dc "e", item5 
item5:
	dc "f", 0x00 
end

#2nd - написать все значения в строку, потом вернуться к голове и в обратном порядке изменить содержимое
#4 - скорее всего рекурсия - доходим до последнего потом последовательно разворачиваем
#созранённые в стеке (или ldsp) адреса