run main
#Write a clean subroutine for string concatenation 
#and another one for string reversal. 
#the main program reverses two strings, concatenates them and reverses the result
main:
	ldi r0, str1
	ldi r1, str2
	jsr concat
	jsr rev
halt
#reverses string pointed to by r0
rev:
	save r2							#r2 is for counting length
	save r3
		clr r2						#start counting from 0
		save r0						#r0 is for traversing the string
			save r1					#r1 is for current character
#brings r0 to the end of the string and stores its length in r2
				while
					ld r0, r1		#r1 = current element
					tst r1
					stays nz
					inc r2
					inc r0			#r0 -> next element
				wend
#moves SP down so we would be able to fit r2 characters	
				ldsp r1				
				sub r2, r1			#r1 = -(SP-length(str))
				neg r1
				stsp r1				#now r1 points to the new, reversed string
#fills string r1 with r0 going backwards
				save r1
				save r2
					do
						dec r0		#r0 -> last uncopied character
						ld r0, r3	#r3 = last uncopied character
						st r1, r3	#r1 -> current character of reversed string
						inc r1		#r1 -> next character of reversed string
						dec r2
					until z
				restore r2
				restore r1
#copy r1 to r0
				save r2
					do
						ld r1, r3	#r3 = current character of reversed string
						st r0, r3	#r0 -> current character of reversed string
						inc r0		#r0 -> next character to be filled
						inc r1		#r1 -> next character of reversed string
						dec r2
					until z
				restore r2
#move SP back
				ldsp r1				
				add r2, r1			#r1 = (SP-length(str))+length(str) = SP
				stsp r1				#SP is back
				
			restore r1
		restore r0
	restore r3
	restore r2
	
	rts
	
concat:
			save r0
			save r3
				while
					ld r0, r3
					tst r3
					stays nz
					inc r0
				wend
				while
					ld r1, r3
					tst r3
					st r0, r3
					stays nz
					inc r1
					inc r0
				wend
			restore r3
			restore r0
rts

str1: dc "among us",0
str2: dc "inshalla",0
newline:	ds 1

end