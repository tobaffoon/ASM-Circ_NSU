asect  0x00

# =================================
# INSERT YOUR CODE BELOW
# Executable instructions only
# No dc or ds pseudo-instructions
# Do not include a halt instruction: that has been done already (below)
# ---------------------------------------------------------------------
	ldi r0, length	
	ld r0, r0		#length of the array
	
	ldi r1, content	#array
	
	while
		tst r0
		stays nz
		ld r1, r2		#current elem
		if
			tst r2
			is mi
			neg r2
			st r1, r2
		fi
		inc r1
		dec r0
	wend

# =================================
# LEAVE THIS PART OF THE FILE ALONE
# Do not change the next two instructions: they must be the last two
# instructions executed by your program.
    ldi r0, content  # Loads the start address of your result into r0 for the robot
    halt             # Brings execution to a halt

# =================================
# DATA GOES BELOW
# We have set this up for you, but you will need to test your program by
# compiling and running it several times with different input data values
# (different arrays of numbers)
# ---------------------------------------------------------------------

DATA>
length:  dc 8          # the length of the array (between 1 and 10)
content: dc 2, 0, -3, 4, -9, 0, 7, -88, -92, 18
ENDDATA>
end

