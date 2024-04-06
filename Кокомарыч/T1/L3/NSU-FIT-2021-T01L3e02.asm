asect  0x00

# =================================
# INSERT YOUR CODE BELOW
# Executable instructions only
# No dc or ds pseudo-instructions
# Do not include a halt instruction: that has been done already (below)
# ---------------------------------------------------------------------
	ldi r0, aHi
	ld r0, r0
	ldi r1, bHi
	ld r1, r1
	shla r1
	neg r1
	add r1, r0
	ldi r1, aLo
	ld r1, r1
	ldi r2, bLo
	ld r2, r2
	neg r2
	shla r2
	add r2, r1
	if
		tst r1
	is mi
		dec r0
		ldi r3, 128
		add r3, r1
	fi
	ldi r3, resLo
	st r3, r1
	ldi r3, resHi
	st r3, r0
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
aLo:	dc	208 	# replace 0 by your choice of low byte for testing
aHi:	dc	28 	# replace 0 by your choice of high byte for testing
bLo:	dc	105 	# replace 0 by your choice of low byte for testing
bHi:	dc	13 	# replace 0 by your choice of high byte for testing
ENDINPUTS>

resLo:	ds	1
resHi:  ds  1		# two bytes reserved for the result
end


