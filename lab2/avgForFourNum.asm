.data
firstNumberPrompt:  .asciiz "Enter the first number: "
secondNumberPrompt: .asciiz "Enter the second number: "
thirdNumberPrompt:  .asciiz "Enter the third number: "
fourthNumberPrompt: .asciiz "Enter the fourth number: "
resultPrompt:       .asciiz "The average of the four numbers is: "
newline:            .asciiz "\n"

.text
.globl main
main:
li $v0,4
la $a0,firstNumberPrompt
syscall
li $v0,5
syscall
move $t0,$v0
li $v0,4
la $a0,secondNumberPrompt
syscall
li $v0,5
syscall
move $t1,$v0
li $v0,4
la $a0,thirdNumberPrompt
syscall
li $v0,5
syscall
move $t2,$v0
li $v0,4
la $a0,fourthNumberPrompt
syscall
li $v0,5
syscall
move $t3,$v0
# Calculate the sum of the four numbers
add $t4,$t0,$t1
add $t4,$t4,$t2
add $t4,$t4,$t3
li $t5,4
div $t4,$t5
mflo $t6
# Print the result
li $v0,4
la $a0,resultPrompt
syscall
li $v0,1
move $a0,$t6
syscall
li $v0,4
la $a0,newline
syscall
#end program
Exit:
li $v0,10
syscall

