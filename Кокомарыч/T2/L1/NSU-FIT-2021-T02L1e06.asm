asect  0x00

# =================================
# INSERT YOUR CODE BELOW
# Executable instructions only
# No dc or ds pseudo-instructions
# Do not include a halt instruction: that has been done already (below)
# ---------------------------------------------------------------------
	ldi r0, x
	ld r0, r0
	ldi r1, y
	ld r1, r1
	if
		shla r1
		move r1, r3
		shra r1
		move r0, r2
		shla r0
		add r0, r2
		neg r2
		shra r0
		sub r3, r2
		tst r2
	is ge
		ldi r2, z
		ld r2, r2
		sub r1, r2
	else
		add r0, r1
		move r1, r2
	fi
	ldi r3, ans
	st r3, r2
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
# (different bit-strings placed at addresses x and y)
# ---------------------------------------------------------------------

INPUTS>
x:    dc -6    # replace these numbers by your choice
y:    dc 10     # of integers for testing purposes
z:    dc 3
ENDINPUTS>

ans:  ds 1     # one byte reserved for the result
end

