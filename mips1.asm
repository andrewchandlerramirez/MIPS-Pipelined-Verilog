start: 
       #testing some r-type instructions
       lw $t1, 16($zero) #t1 gets 1
       lw $t2, 20($zero) #t2 gets 3
       lw $t3, 56($zero) #t3 gets 33333333
       lw $t4, 52($zero) #t4 gets CCCCCCCC
       lw $t7, 64($zero) #t7 gets 66666666 
       add $t0,$t1,$t2   #t0 gets 1 + 3 = 4
       and $t1,$t2,$t3   #t1 gets 3 & 33333333 = 3
       nor $t2,$t3,$t4	 #t2 gets ~(33333333 | CCCCCCCC) = 00000000 
       xor $t5,$t3,$t7	 #t5 gets (33333333 ^ 66666666)  = 55555555
       or  $t6,$t3,$t4	 #t6 get (33333333 | CCCCCCCC)   = FFFFFFFF 
       slt $t7,$t3,$t4	 #t7 get set to 1   
       sll $t0,$t1,2  	 #t0 get (00000003 << 2) = 0000000C
       srl $t1,$t4,3  	 #t1 get (CCCCCCCC >> 3) = 19999999
       sra $t2,$t3,6  	 #t2 get (33333333 >> 6) = 00CCCCCC
       sub $t5,$t1,$t2   #t5 (19999999 - 00CCCCCC) = 18CCCCCD
       #testing some i-type instructions
       slti $t6,$t7,10  #t6 set to 1 
       andi $t7,$t1,1   #t7 set to 1  
       ori  $t1, $t0, 1  #t1 set to D
       sw   $t1,40($zero) #MEM[10] set to D
       lw   $t2,12($zero) #t2 set to 8
       #testing load-use stall
       add  $t3, $t0, $t2 #t3 set to 8 + C = 14 hex
       #testing EX forwarding
       add  $t3,$t3,$t3# set to 28 hex
       add  $t3,$t3,$t3# set to 50 hex
       add  $t3,$t3,$t3# set to A0 hex
       
       j start