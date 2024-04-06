asect  0x00

# =================================
# INSERT YOUR CODE BELOW
# Executable instructions only
# No dc or ds pseudo-instructions
# Do not include a halt instruction: that has been done already (below)
# ---------------------------------------------------------------------
	ldi r0, aLo
	ld r0, r0
	ldi r1, bLo
	ld r1, r1
	add r1, r0
	ldi r2, resLo
	st r2, r0
	ldi r0, aHi
	ld r0, r0
	ldi r1, bHi
	ld r1, r1
	addc r1, r0
	ldi r2, resHi
	st r2, r0
# =================================
# LEAVE THIS PART OF THE FILE ALONE
# Do not change the next two instructions: they must be the last two
# instructions executed by your program.
    ldi r0, resLo  # Loads the start address of your result into r0 for the robot
    halt           # Brings execution to a halt

# =================================
# DATA GOES BELOW
# We have set this up for you, but you will need to test your program by
# compiling and running it several times with different input data values
# (different bit-strings placed at addresses aLo, aHi, bLo and bHi)
# ---------------------------------------------------------------------

INPUTS>
aLo:	dc	255 	# replace 0 by your choice of low byte for testing
aHi:	dc	29 	# replace 0 by your choice of high byte for testing
bLo:	dc	255 	# replace 0 by your choice of low byte for testing
bHi:	dc	29 	# replace 0 by your choice of high byte for testing
ENDINPUTS>

resLo:	ds	1
resHi:  ds  1		# two bytes reserved for the result
end


