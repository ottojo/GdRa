################################################
### Gruppe 121: Dominik Authaler, Jonas Otto ###
################################################

.data
welcome: .asciiz "Diese Programm berechet das Produkt zweier nicht negativer Zaheln.\n"
inputA: .asciiz "Bitte a eingeben: "
inputB: .asciiz "Bitte b eingeben: "
result: .asciiz "Das Ergebnis von a * b ist: "

.text
main:
la   $a0, welcome	#load address of welcome string
addi $v0, $zero, 4
syscall			#print welcome string
la   $a0, inputA	#load address of input string for a
syscall			#print input string for a
addi $v0, $zero, 5
syscall			#read a
move $s0, $v0		#store a in $s0
addi $v0, $zero, 4
la   $a0, inputB	#load address of input string for b
syscall			#print input string for b
addi $v0, $zero, 5
syscall			#read b
move $s1, $v0		#store b in $s1


la   $a0, result	# load address of the result string
addi $v0, $zero, 4	
syscall			# print result string

mult $s0, $s1

mfhi $s2
mflo $s3

			# assuming the result only needs to lower 32-bit
		

move $a0, $s3
addi $v0, $zero, 1
syscall			#print result

j end

end:			#terminate programm
addi $v0, $zero, 10
syscall
