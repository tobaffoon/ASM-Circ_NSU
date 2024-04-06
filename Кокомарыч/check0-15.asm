#Determine whether or not a given array of 16 elements 
#has all values from 0 to 15 exactly once.
asect 0x00

array: dc 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0

ldi r0, array					#r0 keeps address of the current element
ldi r1, 16						#r1 is for counting elements and finding them

do
	dec r1						#start with 16 and then decrement to check zero as well
	ldi r2, 16					#r2 is another counter for inner loop
	save r0						#we will check all the array for current value of r1
		while
			tst r2	
			stays nz
			ld r0, r3			#r3 contains element that may be r1
			if
				cmp r1, r3
				is eq
					break		#if r3 = r1 we found the instance, no need to look further
			fi
			dec r2
			inc r0
		wend	
	restore r0
	if
		tst r2					#if inner loop ended regularly (without break)
		is z					#it means we didn't find r1
			halt				#r1's value stays at the end of the program
	fi
	tst r1						#if we checked all the possible values of r1 (15-0)
until z							#it is safe to say that array satisfies the condition

ldi r1, -1						#if we left the loop normal way, write that array is okay

halt
end