.data
numberPrompt: .asciiz "Enter a number: "
positivePrompt: .asciiz "Positive"
negativePrompt: .asciiz "Negative"
zeroPrompt: .asciiz "Zero"
.text
main:
    li $v0,4
    la $a0,numberPrompt
    syscall
    li $v0,5
    syscall
    move $t0,$v0
switch:
    beq $t0,$zero,case_zero
    bgtz $t0,case_positive
    blez $t0,case_negative
case_zero:
    la $a0,zeroPrompt
    j end_switch
case_positive:
    la $a0,positivePrompt
    j end_switch
case_negative:
    la $a0,negativePrompt
end_switch:
    li $v0,4
    syscall
exit:
    li $v0,10
    syscall
