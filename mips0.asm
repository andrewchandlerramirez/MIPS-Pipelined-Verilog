0X00  lw $t0, 16($zero), loading 1 into reg 
0X04  lw $t1, 16($zero) 
0X08  andi $t2, $t0, 1    <- oddevencheck
0X0C  beq  $t2, $zero, even 
0X10  bne  $t2, $zero, odd 
0X14  add $t0, $t0, $t1   <- even
0X18  beq $zero, $zero oddevencheck 
0X1C  add $t1, $t0, $zero <- odd
0X20  add $t0, $t0, $t0
0X24  beq $zero, $zero oddevencheck

#start pc at 28 to test bgtz,blez, and jump;
0X28  lw $t0,12($zero)loading 8 into reg 
0X2C  bgtz to, 0x34 aka 1
0X30  bne $zero,$zero, 0  nothing happens
0X34  srl t0,t0 4 make reg 0
0X38  blez t0, 0x40 aka 1 
0X3C  bne $zero,$zero, 0  nothing happens 
0X40  jump 0x00    