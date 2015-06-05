print """Writeaprogramthatcomputestherealrootsofaquadraticfunction.Yourprogram
shouldbeginbypromptingtheuserforthevaluesof
a
,
b
and
c
.Thenitshoulddisplay
a message indicating the number of real roots, along with the values of the real roots
(if any)"""

from math import sqrt

a = input("Type a: ")
b = input("Type b: ")
c = input("Type c: ")

discriminant = b**2 - 4*a*c

if discriminant < 0:
	print "There are no real roots!"

elif discriminant == 0:
	root = - float(b) / (2*a)
	print "The unique rael root is", root

else:
	root1 = (-b + sqrt(discriminant))/(2 * float(a))
	root2 = (-b - sqrt(discriminant))/(2 * float(a))
	print "The real roots are", root1, "and", root2
