.data
prompt:     .asciiz "Enter a number: "
result_msg: .asciiz "Fibonacci number is: "

.text
.globl main

main:
    # Print prompt
    li $v0, 4
    la $a0, prompt
    syscall

    # Read integer
    li $v0, 5
    syscall
    move $a0, $v0      # argument for fibonacci(n)

    # Call fibonacci function
    jal fibonacci

    # Print result
    li $v0, 4
    la $a0, result_msg
    syscall

    move $a0, $v0
    li $v0, 1
    syscall

    # Exit
    li $v0, 10
    syscall

# Recursive Fibonacci function
# Input: $a0 = n
# Output: $v0 = fib(n)
fibonacci:
    # Base cases
    li $t0, 0
    beq $a0, $t0, fib_base_0
    li $t1, 1
    beq $a0, $t1, fib_base_1

    # Save $ra and $a0 on stack
    addi $sp, $sp, -8
    sw $ra, 4($sp)
    sw $a0, 0($sp)

    # fib(n-1)
    addi $a0, $a0, -1
    jal fibonacci
    move $t2, $v0

    # fib(n-2)
    lw $a0, 0($sp)
    addi $a0, $a0, -2
    jal fibonacci
    move $t3, $v0

    # Add results
    add $v0, $t2, $t3

    # Restore stack and return
    lw $ra, 4($sp)
    addi $sp, $sp, 8
    jr $ra

fib_base_0:
    li $v0, 0
    jr $ra

fib_base_1:
    li $v0, 1
    jr $ra
