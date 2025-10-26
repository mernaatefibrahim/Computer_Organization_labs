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
if:
    bne $t0,$zero,elsif
    la $a0,zeroPrompt
    j endif
elsif:
    blez $t0,else
    la $a0,positivePrompt
    j endif
else:
    la $a0,negativePrompt
endif:
    li $v0,4
    syscall
exit:
    li $v0,10
    syscall
