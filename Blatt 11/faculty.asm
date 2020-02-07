################################################
### Gruppe 121: Dominik Authaler, Jonas Otto ###
################################################

.data

text_input:  .asciiz "Bitte geben Sie eine nicht negative ganze Zahl ein: "

text_error:  .asciiz "Kann die Fakulät nicht berechnen, da die Eingabe negativ ist.\n"

text_output: .asciiz "Die berechnete Fakultät lautet: "

.text


main:			#main program

li $v0, 4             
la $a0, text_input 	#load address of text_input
syscall			#print text_input

li $v0, 5             
syscall			#read input from user

bltz $v0, error      	#if negative input, goto error

move $a0, $v0         	#else save input to parameter register
jal  faculty		#call faculty method
move $t0, $v0         	#save result

li   $v0, 4             
la   $a0, text_output  	#load address of text_output
syscall			#print the string

li   $v0, 1             
move $a0, $t0       	#move result of faculty to output register
syscall			#print result

j    exit		#jump to exit
		
############begin aufgabe für studenten##################################		
		

faculty:	        # calculate faculty

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




		
##################ende aufgabe für studenten##################################
		
						

error:			#error case

li $v0, 4             
la $a0, text_error   	#load address of text_error
syscall			#print string
		
exit:			#exit case

li $v0, 10           
syscall			#terminate programm
