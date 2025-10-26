.data 
numPrompt:   .asciiz "Enter a positive integer: "
sum:   .asciiz "sum:\n"
newLine:     .asciiz "\n"
.text
main:
# Initialize sum to 0
    move $t1, $zero
do:
    li $v0,4
    la $a0, numPrompt
    syscall
    li $v0,5
    syscall
    move $t0, $v0
    add $t1, $t1, $t0
while: 
    bne $t0, $zero, do
    li $v0,4
    la $a0, sum
    syscall
    li $v0,1
    move $a0, $t1
    syscall
    li $v0,4
    la $a0, newLine
    syscall
exit:
    li $v0,10
    syscall
