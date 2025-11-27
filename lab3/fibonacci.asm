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
    move $t0, $v0      # t0 = n

    # Handle n = 0 and n = 1
    beq $t0, $zero, fib0
    li $t1, 1
    beq $t0, $t1, fib1

    # Iterative calculation
    li $t2, 0          # t2 = fib(0)
    li $t3, 1          # t3 = fib(1)
    li $t4, 2          # counter = 2

fib_loop:
    bgt $t4, $t0, fib_done
    add $t5, $t2, $t3  # t5 = fib(n-1) + fib(n-2)
    move $t2, $t3      # t2 = old fib(n-1)
    move $t3, $t5      # t3 = fib(n)
    addi $t4, $t4, 1
    j fib_loop

fib_done:
    move $v0, $t3
    j fib_print

fib0:
    li $v0, 0
    j fib_print

fib1:
    li $v0, 1

fib_print:
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
