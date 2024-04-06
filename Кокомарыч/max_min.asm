asect 	0x00

br code
array: dc 10, 5, -5, 3, -4, 0, -6, 11, 1, 1, -5

code:
ldi r0, array
ld r0, r1				#r1 keeps the length of the array

inc r0					#now onto the actual elements

add r0, r2
ld r2, r2				#r2 will keep the min value

add r0, r3
ld r3, r3				#r3 will keep the max value

while
	tst r1
	stays nz			#while it is not the end of the array
	save r1				#save the length
		ld r0, r1		#now lets use r1 for keeping the current element
		if
			cmp r1, r2
			is lt		#if current is smaller than min, change the min
			move r1, r2
		fi
		
		if
			cmp r1, r3
			is gt		#if current is bigger than max change the max
			move r1, r3
		fi
		
	restore				#now we restore the length
	dec r1				#update the number of elements left
	inc r0				#update address of current element
wend	

ldi r0, res
st r0, r2
inc r0
st r0, r3

halt

res:ds 2
end