asect 0x00
ldi r1, a
ld r1, r1
ldi r2, 0
or r2, r1
st r1, r2
sub r2, r1

INPUTS>
a:	dc 144
ENDINPUTS>
end