asect  0x00

# =================================
# INSERT YOUR CODE BELOW
# Executable instructions only
# No dc or ds pseudo-instructions
# Do not include a halt instruction: that has been done already (below)
# ---------------------------------------------------------------------
	ldi r1, 0	#quot
	
	ldi r2, x	#remainder
	ld r2, r2
	
	ldi r3, y
	ld r3, r3

	while
		cmp r2, r3
		stays ge
			sub r3, r2
			neg r2		#r2 = r2 - y
			inc r1
	wend
	
	ldi r0, quot
	st r0, r1
	
	ldi r0, remain
	st r0, r2

# =================================
# LEAVE THIS PART OF THE FILE ALONE
# Do not change the next two instructions: they must be the last two
# instructions executed by your program.
    ldi r0, quot  # Loads the address of your result into r0 for the robot
    halt          # Brings execution to a halt

# =================================
# DATA GOES BELOW
# We have set this up for you, but you will need to test your program by
# compiling and running it several times with different input data values
# (different unsigned numbers placed at addresses x and y)
# ---------------------------------------------------------------------

INPUTS>
x:      dc 24   # replace these with your choice
y:      dc 23    # of unsigned numbers for testing
ENDINPUTS>

quot:   ds 1    # one byte reserved for the quotient
remain: ds 1    # one byte reserved for the remainder
end

