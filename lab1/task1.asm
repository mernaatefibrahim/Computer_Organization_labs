.data 
Name : .asciiz "Name : Merna Atef"
ID : .asciiz "id : 123"
course : .asciiz "course :Computer Organization"

.text 
main:
li $v0,4
la $a0,Name
syscall

li $v0,1
la ID
syscall

li $v0,4
la $a0,course
syscall

li $v0,10
syscall
