.data
numPrompt:   .asciiz "Enter a positive integer (or zero to terminate): "
nPrompt:     .asciiz "Enter the number of values to average: "
avgprompt:   .asciiz "The average is: "
errorMsg:    .asciiz "Error: Cannot compute average of zero numbers.\n"
newLine:     .asciiz "\n"

.text
.globl main
main:

    li $v0,4
    la $a0, nPrompt
    syscall

    li $v0,5
    syscall
    move $t0, $v0          # $t0 <- n

    move $t1, $zero        # $t1 <- sum
    move $t2, $zero        # $t2 <- count
for:
    beq $t2, $t0, endLoop

    li $v0,4
    la $a0, numPrompt
    syscall

    li $v0,5
    syscall
    move $t3, $v0          # $t3 <- input number

    add $t1, $t1, $t3      # sum += input number
    addi $t2, $t2, 1       # count += 1

    j for
endLoop:
    beq $t0, $zero, skipDiv  # Avoid division by zero 
    div $t1, $t0            # sum / n
    mflo $t4                 # $t4 <- average

    li $v0,4
    la $a0, avgprompt
    syscall
    li $v0,1
    move $a0, $t4
    syscall
    li $v0,4
    la $a0, newLine
    syscall
    j exit
skipDiv:
        li $v0,4
        la $a0, errorMsg
        syscall
    exit:
        li $v0,10
        syscall 