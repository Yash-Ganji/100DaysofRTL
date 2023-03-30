The 8 bit ALU designed to perform 8 different operations on two 8 bit numbers A and B.

| 3 bit code | Operation | description |
| ---------- | --------- | ----------- |
| 000 | ADD | binary addition |
| 001 | SUB | binary substraction |
| 010 | LFS | left shift A by 3 bits and replace the LSB with B[2:0] |
| 011 | RTS | right shift A by 3 bits and replace the MSB with B[2:0] |
| 100 | AND | logical bitwise and operation on both inputs |
| 101 | OR  | logical bitwise or operation on both inputs |
| 110 | XOR | logical bitwise xor operation on both inputs |
| 111 | EQL | give "1" if both inputs are equal else give "0" |
