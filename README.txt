# Huffman-Implementation
Implemantation of huffman encoding and decoding, for education purposes
Subject TEL416-Information Theory-
-Matlab code(.m)-- I used Octave on Linux-
|$$author: soylis.k@gmail.com $$|

This code created for education purposes, so you have to design the algorith on the paper to get your code for each symbol
Then use this coding by matching every symbol's binary code to the right decimal value and use it 
as an input to create the dictionary.

*We assume that we have sequential integers as symbols*

For example lets say we have a vector symbols=1:4 ; --symbols=[1 2 3 4]
Probabilty for each symbol p=[0.5 0.25 0.125 0.125];-- where p(1) is the probabilty of symbol(1) --
Now after applying Huffman algorithm by hand I get this look up table:
*Code_symbols is in binary
***********************************************************************************************************
_________________________~~~~~~~~~~~~~~~~~~~
| Symbol |Code_symbol   | Match to decimal |
| -------|--------------|******************|
|    1   |    0         |        '0'       |
|    2   |    10        |        '2'       |
|    3   |    110       |        '6'       |
|    4   |    111       |        '7'       |
|_______________________|__________________|


*************************************************************************************************************
I matched each binary to a decimal to be more easy to handle as an simple array in matlab
Then take this array, dec_coded_w=[0 2 6 7]; and pass it as argument in function huff_dict(dec_coded_w) -- creates cell array
where its cell corresponde to a symbol and its matched to its binary code.
**************************************************************************************************************
eg. dict{2} = [1,2] {10} --index 2 correspond to symbol "2", which code is "1 0"

If huffman algorith gives u a more complicate coding you better import your dictionary as you have created in your paper

see examples-use
