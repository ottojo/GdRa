################################################
### Gruppe 121: Dominik Authaler, Jonas Otto ###
################################################

.data
string1: .asciiz "Diese Programm berechet den Binomialkoeffizienten n über m. Dazu müssen n und m als nicht negative ganze Zahlen eingegeben werden. Zudem muss n größer oder gleich m sein.\n"
string2: .asciiz "Bitte n eingeben: "
string3: .asciiz "Bitte m eingeben: "
string4: .asciiz "Das Ergebnis von n über m ist: "

.text
main:
la $a0, string1		#load address of string1
addi $v0, $zero, 4
syscall			#print string 1
la $a0, string2		#load address of string 2
syscall			#print string2
addi $v0, $zero, 5
syscall			#read n
move $s0, $v0		#store n in $s0
addi $v0, $zero, 4
la $a0, string3		#load address of string 3
syscall			#print string3
addi $v0, $zero, 5
syscall			#read m
move $s1, $v0		#store m in $s1

#start task####################################

#hier den Code für die Berechnung des Binomialkoeffizienten reinschreiben
#zur rekursiven Fakultäsberechnung kann zum Label faculty gesprungen werden

move	$a0, $s0	# calculate n!
jal	facultyIt
move	$s2, $v0	# store n! in $s2

move	$a0, $s1	# calculate m!
jal	facultyIt
move	$s3, $v0	# store m! in $s3

sub	$a0, $s0, $s1	# calculate (n-m)!
jal	facultyIt
move	$s4, $v0	# store (n-m)! in $s4

mult	$s3, $s4	# calculate m! * (n-m)!
mflo	$s5		# assume that the result fits in 32bit	
		
divu	$s2, $s5	# caluclate (n!) / (m! * (n-m)!)
mflo	$s7		


#end task######################################

la $a0, string4
addi $v0, $zero, 4
syscall			#print string4
addi $a0, $s7, 0
addi $v0, $zero, 1
syscall			#print result

j end

facultyIt:	        # calculate faculty

addiu   $sp, $sp, -4    # put return address on stack
sw      $ra, 0($sp)

addiu   $a0, $a0, 1     # increment n by one for <

li      $v0, 1          # f = 1
li      $t2, 1          # i = 1

bnez	$a0, for_start  # if (n != 0) do iterative calculation	

		        # else: return 1 for case 0
j	for_end 		

for_start:
sltu	$t3, $t2, $a0
beqz    $t3, for_end    # while (i < n)
mul     $v0, $v0, $t2   # f = f * i
addiu   $t2, $t2, 1     # i++
j       for_start

for_end:
lw      $ra, 0($sp)	# get return address from stack and jump back
addiu   $sp, $sp, 4
jr      $ra

faculty:			#calculates the fak($a0) and stores it to $v0
addi $sp, $sp, -8	 	# reduce stack pointer by two words
sw $ra, 4($sp) 			# store return address on stack
sw $a0, 0($sp) 			# store input parameter on stack
slti $t0, $a0, 1 		# test n<1
beq $t0, $zero, faculty2	# if n>=1 goto faculty2
addi $v0, $zero, 1 		# else: return 1
addi $sp, $sp, 8 		# decrement stack pointer by two words
jr $ra 				# return

faculty2:			#for the recursive call
addi $a0, $a0, -1 		# decrement input argument
jal faculty			# recursive call faculty
lw $a0, 0($sp) 			# get input parameter from stack
lw $ra, 4($sp) 			# get return addresss from stack
addi $sp, $sp, 8 		# increase stack pointer by two words
mul $v0, $a0, $v0 		# calculate n*fak(n-1)
jr $ra				#return


end:			#terminate programm
addi $v0, $zero, 10
syscall
