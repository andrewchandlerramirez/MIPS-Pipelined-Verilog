start: 
       #testing some r-type instructions
       add $t0,$t1,$t2
       and $t1,$t2,$t3
       nor $t2,$t3,$t4
       xor $t5,$t6,$t7
       or  $t6,$t7,$t0
       slt $t7,$t0,$t1
       sll $t0,$t1,2
       srl $t1,$t2,4
       sra $t2,$t3,6
       sub $t5,$t6,10
       #testing some i-type instructions
       slti  $t6,$t7,10
       andi $t7,$t0,1
       ori  $t0, $t1, 1
       sw   $t1,40($zero)
       lw   $t2,12($zero)
       #testing load-use stall
       add  $t3, $t4, $t5
       #testing EX forwarding
       add  $t3,$t3,$t3
       add  $t3,$t3,$t3
       add  $t3,$t3,$t3 
       
       j start