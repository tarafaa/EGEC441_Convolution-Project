# EGEC441_Convolution-Project
Multiply, Accumulating and Convolving

  ### -- TO DO --
  

# Construct 3 Array Modules:
## working on it: 
A array = input signal x[k]
B array = filter h[k]
C array = output y[n]

# Construct 2 RCAs:
## working on it: 
RCA #1 = compute B_index = n-k
RCA #2 = compute Y = Y + product

# Construct 1 Multiplier:
## working on it: 
product = A[k] * Bi

# Construct Comparator:
## working on it: Tara
checks if B_index is valid

# Construct MUX:
## working on it: 
if B_index is valid, Bi = B_array[B_index]
else Bi = 0

# Construct Top Module:
## working on it: 
connects arrays, RCA, comparator, MUX, multiplier, accumulator

# Construct Testbench:
## working on it: 
loads user/test values into A and B arrays
checks output C



  To see more details of the project please see: https://docs.google.com/document/d/1C7WxYBjMMmh4Kwd5BA1LIYB42v2O_TmrD2CL_c7xr68/edit?usp=sharing
