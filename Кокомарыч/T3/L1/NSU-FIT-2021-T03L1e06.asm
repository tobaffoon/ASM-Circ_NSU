asect  0x00

# =================================
# INSERT YOUR CODE BELOW
# Executable instructions only
# No dc or ds pseudo-instructions
# Do not include a halt instruction: that has been done already (below)
# ---------------------------------------------------------------------
	ldi r0, length	#length
	ld r0, r0
	
	ldi r1, content #address of the array	
	
	while
		tst r0
		stays nz
		ld r1, r2		#current element
		if
			tst r2
			is mi
			ldi r3, neg
			else
				if
				is z
				ldi r3, zer
				else
					ldi r3, pos
				fi
		fi	
		ld r3, r2	#take current number
		inc r2
		st r3, r2	#inc and store it back
		inc r1		#next element
		dec r0
	wend
				
		
# =================================
# LEAVE THIS PART OF THE FILE ALONE
# Do not change the next two instructions: they must be the last two
# instructions executed by your program.
    ldi r0, pos  # Loads the start address of your result into r0 for the robot
    halt         # Brings execution to a halt

# =================================
# DATA GOES BELOW
# We have set this up for you, but you will need to test your program by
# compiling and running it several times with different input data values
# (different arrays of numbers)
# ---------------------------------------------------------------------

INPUTS>
length:  dc 9          # the length of the array (between 1 and 10)
content: dc 2, 0, -3, 4, -9, 0, 7, 88, -92, 18
ENDINPUTS>
pos: ds 1 # 1 byte each for the three result values
neg: ds 1
zer: ds 1
end

