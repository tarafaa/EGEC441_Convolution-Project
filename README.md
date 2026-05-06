# EGEC441_Convolution-Project
### Multiply, Accumulating and Convolving

### make sure its a .v file for when you create the file or upload to the hub
  # -- TO DO --

## Specifications: 
  * A: 16 bits
  * B: 16 bits
  * Multiplier output: 32 bits
  * Accumulator C: 32 bits or larger
  * Final Y: 32 bits

## Construct 3 Array Modules:
### working on it: Justus
A array = input signal x[k]
B array = filter h[k]
C array = output y[n]

## Construct 2 RCAs:
### working on it: Tara -- 1st RCA 

RCA #1 = compute B_index = n-k
RCA #2 = compute Y = Y + product

## Construct 1 Multiplier:
### working on it: Jesus

product = A[k] * Bi

## Construct Comparator:

## B Memory Module - for Compare
### working on it: Tara

checks if B_index is valid

## Construct MUX:
### working on it: Justus

if B_index is valid, Bi = B_array[B_index]
else Bi = 0

## Construct Top Module:
### working on it: 

connects arrays, RCA, comparator, MUX, multiplier, accumulator

## Construct Testbench:
### working on it: 

loads user/test values into A and B arrays
checks output C



  To see more details of the project please see: https://docs.google.com/document/d/1C7WxYBjMMmh4Kwd5BA1LIYB42v2O_TmrD2CL_c7xr68/edit?usp=sharing
