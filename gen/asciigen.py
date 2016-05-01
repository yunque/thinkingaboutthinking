#!/usr/bin/env python

'''
asciigen.py

Guess?

x imr
@ 160501
'''

import numpy as np

full = 8
half = full/2

np.array((N,N))

# Define characters to use
bag1 = [',', ',',  '.', '`', '\'', '^', '¬', '-', '_']
bag2 = ['¦', '|', '\\', '/', '[', ']', '{', ';', '(', ')' ]

# Draw random characters into an array which will populate each quadrant
selection = []
for i in range(0,N):
	selection.extend(rand.rand(bag1))


def quadrantTesselate(Q):
	# Define the canvas
	Quadrants = [Q1, Q2, Q3, Q4]

	# Define the grid indices / index the grid

	# XXX: can I find a nice transofmration operation?
	'''
	0 1 1 0
	1 2 2 0
	1 2 2 1
	0 1 1 0

	0 1 2 1 0
	1 2 3 2 1
	2 3 4 3 2
	1 2 3 2 1
	0 1 2 1 0
	'''
	Q2 = '???'
	Q3 = Q2[::-1]
	Q4 = Q1[::-1]

	# At index (a,b), cell value is a+b
	val[a][b] = a + b

	return QQQQ


if __name__ == '__main__':
	Q = quadrantGenerate()
	QQQQ = quadrantTesselate(Q)
