run prog
#Program finds a character passed in r0 in a null-terminated string, 
#whose address is passed in r1 returning the address of the character 
#found in r0. If the character does not occur on the string the subroutine must return −1.
str: dc "", 0

prog:
	ldi r1, str
	ldi r0, "a"
	jsr find
	ldi r0, "e"
	jsr find
	ldi r0, "i"
	jsr find
	ldi r0, "o"
	jsr find
	ldi r0, "u"
	jsr find
	halt

#finds the address of first occurence of letter in r0 in string poited by r1
find:
	save r1								#r1 will traverse tha string
		save r2							#r2 will keep the current letter
			while
				ld r1, r2				#r2 = current char
				tst r2
				stays nz				#if r2 is not the end
					if
						cmp r0, r2		#if r0 == r2
						is eq
						move r1, r0		#r0 -> r2
						break
					fi
					inc r1
			wend
			if
				tst r2
				is z
				ldi r0, -1
			fi
		restore r2
	restore r1
	rts
end