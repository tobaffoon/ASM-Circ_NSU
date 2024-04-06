asect  0x00

# =================================
# INSERT YOUR CODE BELOW
# Executable instructions only
# No dc or ds pseudo-instructions
# Do not include a halt instruction: that has been done already (below)
# ---------------------------------------------------------------------
	ldi r0, a
	ld r0, r0
	if
		tst r0
	is eq
		ldi r1, x
		ld r1, r1
		neg r1
	else
		if
			shra r0
			tst r0
		is eq
			ldi r1, x
			ld r1, r1
			ldi r2, y
			ld r2, r2
			add r2, r1
		else
			if
				ldi r0, a
				ld r0, r0
				ldi r1, 2
				sub r1, r0
				tst r0
			is eq
				ldi r1, z
				ld r1, r1
				ldi r2, y
				ld r2, r2
				sub r2, r1
			fi
		fi
	fi
	ldi r0, ans
	st r0, r1
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
# (different bit-strings placed at addresses a, x, y and z)
# ---------------------------------------------------------------------

INPUTS>
a:    dc 2   # replace these three numbers
x:    dc 5     # by your choice of integers
y:    dc 3     #  for testing purposes
z:    dc 7
ENDINPUTS>

ans:  ds 1     # one byte reserved for the result
end

