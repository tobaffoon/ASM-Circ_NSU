asect  0x00

# =================================
# INSERT YOUR CODE BELOW
# Executable instructions only
# No dc or ds pseudo-instructions
# Do not include a halt instruction: that has been done already (below)
# ---------------------------------------------------------------------
	ldi r0, 0
	ldi r1, x
	ld r1, r1
	
	ldi r2, y
	ld r2, r2
	while
		tst r1
		stays nz
			add r2, r0
			dec r1
	wend
	
	ldi r1, ans
	st r1, r0

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
# (different unsigned numbers placed at addresses x and y)
# ---------------------------------------------------------------------

INPUTS>
x:     dc 7    # replace these with your choice
y:     dc 10    # of unsigned numbers for testing
ENDINPUTS>

ans:   ds 1    # one byte reserved for the (unsigned number) product

end

