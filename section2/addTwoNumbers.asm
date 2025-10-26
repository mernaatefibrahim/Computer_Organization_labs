.data
    firstNumberPrompt: .asciiz "Enter the first number: "
    secondNumberPrompt: .asciiz "Enter the second number: "
    resultPrompt: .asciiz "The sum is: "
.text
main:
    # Prompt for the first number
    li $v0, 4                  # syscall for print string
    la $a0, firstNumberPrompt  # load address of first prompt
    syscall

    # Read the first number
    li $v0, 5                  # syscall for read integer
    syscall
    move $t0, $v0              # store first number in $t0

    # Prompt for the second number
    li $v0, 4                  # syscall for print string
    la $a0, secondNumberPrompt # load address of second prompt
    syscall

    # Read the second number
    li $v0, 5                  # syscall for read integer
    syscall
    move $t1, $v0              # store second number in $t1

    # Add the two numbers
    add $t2, $t0, $t1          # sum = firstNumber + secondNumber

    # Print the result prompt
    li $v0, 4                  # syscall for print string
    la $a0, resultPrompt       # load address of result prompt
    syscall

    # Print the result
    move $a0, $t2              # move sum to $a0 for printing
    li $v0, 1                  # syscall for print integer
    syscall
    Exit:
    li $v0, 10                 # syscall for exit
    syscall