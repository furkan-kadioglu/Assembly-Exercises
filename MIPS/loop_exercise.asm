.text
.globl main


main:
    la $t1, myarray # alloc 
loop:
    add $t2, $t0, $t1  # pointer
    sw $t7,($t2) # write data
    addi $t7, $t7, 1
    addi $t0, $t0, 4 # increment
    beq $t0, 40, loop2 #check
    b loop #again

loop2:
    add $t2, $t3, $t1  # pointer
    lw $t5,($t2) # write data
    addi $t3, $t3, 4 # increment
    beq $t3, 40, finish #check
    b loop2 #again


finish:
    jr $ra  #finish it 

.data

myarray: .space 40 #alloc arr