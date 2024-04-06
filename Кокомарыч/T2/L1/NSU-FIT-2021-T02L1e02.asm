asect  0x00

# =================================
# INSERT YOUR CODE BELOW
# Executable instructions only
# No dc or ds pseudo-instructions
# Do not include a halt instruction: that has been done already (below)
# ---------------------------------------------------------------------
	ldi r0, a
	ld r0, r0
	ldi r1, b
	ld r1, r1
	if
		sub r1, r0
		tst r0
	is ge
		
	else
		sub r0, r1
		neg r1
	fi
	move r1, r2
	move r2, r0
	
	ldi r1, c
	ld r1, r1
	if
		sub r1, r0
		tst r0
	is ge
		
	else
		sub r0, r1
		neg r1
	fi
	move r1, r2
	ldi r1, ans
	st r1, r2
# =================================
# LEAVE THIS PART OF THE FILE ALONE
# Do not change the next two instructions: they must be the last two
# instructions executed by your program.
    ldi r0, ans  # Loads the address of your result into r0 for the robot
    halt         # Brings execution to a halt

# =================================
# DATA GOES BELOW
# We have set this up for you, but you will need to test your program by
# compiling and running it several times with different input data values
# (different bit-strings placed at addresses a, b and c)
# ---------------------------------------------------------------------

INPUTS>
a:    dc 2   # replace these three numbers
b:    dc -14     # by your choice of integers
c:    dc 3     #  for testing purposes
ENDINPUTS>

ans:  ds 1     # one byte reserved for the result
end

