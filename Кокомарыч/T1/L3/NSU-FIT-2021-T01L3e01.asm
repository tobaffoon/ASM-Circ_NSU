asect  0x00

# =================================
# INSERT YOUR CODE BELOW
# Executable instructions only
# No dc or ds pseudo-instructions
# Do not include a halt instruction: that has been done already (below)
# ---------------------------------------------------------------------
	ldi r0, x
	ld r0, r0
	shla r0
	addc r2, r1
	shla r0
	addc r2, r1
	shla r0
	addc r2, r1
	shla r0
	addc r2, r1
	shla r0
	addc r2, r1
	shla r0
	addc r2, r1
	shla r0
	addc r2, r1
	shla r0
	addc r2, r1
	shr r1
	addc r0, r0
	ldi r1, res
	st r1, r0
# =================================
# LEAVE THIS PART OF THE FILE ALONE
# Do not change the next two instructions: they must be the last two
# instructions executed by your program.
    ldi r0, res  # Loads the start address of your result into r0 for the robot
    halt           # Brings execution to a halt

# =================================
# DATA GOES BELOW
# We have set this up for you, but you will need to test your program by
# compiling and running it several times with different input data values
# (different bit-strings placed at addresses aLo, aHi, bLo and bHi)
# ---------------------------------------------------------------------

INPUTS>
x:     dc  0b01110111    # replace 0 by your choice of bit-string for testing
ENDINPUTS>

res:  ds  1    # one byte reserved for the result
end

