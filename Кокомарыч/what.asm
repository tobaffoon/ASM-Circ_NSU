tplate foo
dc "aabb",0
a: dc "abobus",0
b: ds 2

asect 0x22
ldi r0, foo.a
ldi r1, 0
st r0, r1
ldi r0, foo.b
st r0, r1
ldi r0, foo._
st r0, r1
end