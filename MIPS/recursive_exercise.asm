.text 
.globl main

main:
    addi $a0, $a0, 4 #call 1
    	

fact:
    addi	$sp, $sp, -8	#stack alloc
    sw      $ra, 4($sp)  #save adress
    sw      $a0, 0($sp)  #save value
    
    slti    $t0,$a0,1    #check 
    beq		$t0, $zero, L1 #go

    addi $t3, $t3, 1  #t3 +1
    addi $sp, $sp, 8   #stack pop 
    jr $ra
    

L1:
    addi $a0, $a0, -1  #next 
    jal fact   

    lw $ra, 4($sp)  #stack 2 
    lw $a0, 0($sp) # adress sav2
    addi $sp, $sp, 8 #
    mul $t3, $t3, $a0 #multi

    jr $ra

.data

