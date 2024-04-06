#program that finds the first number that is less than the previous one in an array
asect 0x00

ldi r0, array
ld r0, r1		#r1 keeps the number of elements
dec r1			#array of one element is degenerade case + assume there aren't empty arrays

inc r0

while
	tst r1
	stays nz					#keep looking until the end of array
	save r1						
		ld r0, r1				#r1 is for previous element now
		inc r0					#r0 points to the next one
		save r0	
			ld r0, r0			#r0 now contains the next one
			if
				cmp r1, r0		
				is gt
					ldi r1, res
					st r1, r0	#write result if condition is satisfied
				halt			#program can be ended now
			fi
		restore r0
	restore r1
	dec r1						#the number of elements decreased by one
wend

halt

array: dc 11, -10, -3, -1, 0, 0, 0, 0, 1, 2, 3, -4 
#first cell is the size n, next n cells are elements

res: ds 1
end