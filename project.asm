##############################################################
#Array
##############################################################
#   4 Bytes - Address of the Data
#   4 Bytes - Size
##############################################################

##############################################################
#Linked List Node
##############################################################
#   4 Bytes - Address of the Data
#   4 Bytes - Address of the Next Node
##############################################################

##############################################################
#Song
##############################################################
#   4 Bytes - Address of the Name (name itself is 64 bytes)
#   4 Bytes - Duration
##############################################################


.data
space: .asciiz " "
newLine: .asciiz "\n"
tab: .asciiz "\t"

name: .asciiz "Song name: "
duration: .asciiz "Song duration: "
emptyList: .asciiz "List is empty!\n"
noSong: .asciiz "\nSong not found!\n"
foundSong: .asciiz "\nSong found!\n"
songAdded: .asciiz "\nSong added.\n"

copmStr: .space 64

sReg: .word 3, 7, 1, 2, 9, 4, 6, 5
arrayOfPlaylistsAddress: .word 0 #the address of the array of playlists stored here!


p1s1: .asciiz "Summer Breeze"
p1s1_duration: .word 124

p1s2: .asciiz "Rhythm of the Night"
p1s2_duration: .word 225

p1s3: .asciiz "Golden Days"
p1s3_duration: .word 192

p1s4: .asciiz "Dancing in the Moonlight"
p1s4_duration: .word 186

p1s5: .asciiz "Island Paradise"
p1s5_duration: .word 213

p2s1: .asciiz "Chill Vibes"
p2s1_duration: .word 198

p2s2: .asciiz "Smooth Jazz Serenade"
p2s2_duration: .word 213

p2s3: .asciiz "Dreamscape"
p2s3_duration: .word 156

p2s4: .asciiz "Mellow Melodies"
p2s4_duration: .word 177

p2s5: .asciiz "Sunny Side Up"
p2s5_duration: .word 204

p3s1: .asciiz "Rock 'n Roll Classics"
p3s1_duration: .word 214

p3s2: .asciiz "Electric Dreams"
p3s2_duration: .word 199

p3s3: .asciiz "Highway to Heaven"
p3s3_duration: .word 235

p3s4: .asciiz "City Lights"
p3s4_duration: .word 186

p3s5: .asciiz "Rebel Yell"
p3s5_duration: .word 192

p4s1: .asciiz "Acoustic Serenity"
p4s1_duration: .word 176

p4s2: .asciiz "Gentle Guitar Grooves"
p4s2_duration: .word 205

p4s3: .asciiz "Woodland Whispers"
p4s3_duration: .word 153

p4s4: .asciiz "Folklore Fantasia"
p4s4_duration: .word 218

p4s5: .asciiz "Countryside Carols"
p4s5_duration: .word 242

p5s1: .asciiz "Hip-Hop Heatwave"
p5s1_duration: .word 193

p5s2: .asciiz "Urban Dreams"
p5s2_duration: .word 208

p5s3: .asciiz "Rap Revolution"
p5s3_duration: .word 177

p5s4: .asciiz "Street Symphony"
p5s4_duration: .word 205

p5s5: .asciiz "Groove City Groceries"
p5s5_duration: .word 221


search1: .asciiz "Highway to Heaven"
search2: .asciiz "Master of Puppets"

.text 
main:

	la $t0, sReg
	lw $s0, 0($t0)
	lw $s1, 4($t0)
	lw $s2, 8($t0)
	lw $s3, 12($t0)
	lw $s4, 16($t0)
	lw $s5, 20($t0)
	lw $s6, 24($t0)
	lw $s7, 28($t0)

mainStart:
	
	addi $a0, $zero, 3
	jal createArray
	# save the address of arrayinfo to label
	sw $v0, arrayOfPlaylistsAddress
	
	jal createLinkedList
	#a0 arrayinfo addreesss
	lw $a0, arrayOfPlaylistsAddress
	#a1 index of elemnt to add
	addi $a1,$zero, 0
	# v0 a2 the address of linked list 
	move $a2, $v0
	jal putElementToArray
	
	
	jal createLinkedList
	#a0 arrayinfo addreesss
	lw $a0, arrayOfPlaylistsAddress
	#a1 index of elemnt to add
	addi $a1,$zero, 1
	# v0 a2 the address of linked list 
	move $a2, $v0
	jal putElementToArray
	
	
	jal createLinkedList
	#a0 arrayinfo addreesss
	lw $a0, arrayOfPlaylistsAddress
	#a1 index of elemnt to add
	addi $a1,$zero, 2
	# v0 a2 the address of linked list 
	move $a2, $v0
	jal putElementToArray
	#t0 arrayinfo address
	#t1 array elemtn address
	
	
	
	#RESIZE ARRAY
	
	#a0 arrayinfo addreesss
	lw $a0, arrayOfPlaylistsAddress
	#a1 oldsize
	addi $a1, $zero, 3
	#a2 newsize
	addi $a2, $zero, 5
	jal resizeArray
	
	
	#put4. pl
	jal createLinkedList
	#a0 arrayinfo addreesss
	lw $a0, arrayOfPlaylistsAddress
	#a1 index of elemnt to add
	addi $a1,$zero, 3
	# v0 a2 the address of linked list 
	move $a2, $v0
	jal putElementToArray
	
	#put5. pl
	jal createLinkedList
	#a0 arrayinfo addreesss
	lw $a0, arrayOfPlaylistsAddress
	#a1 index of elemnt to add
	addi $a1,$zero, 4
	# v0 a2 the address of linked list 
	move $a2, $v0
	jal putElementToArray
	
	
	
	#CREATE SONG
	#v0 address of the song returned
	la $a0, p1s1
	lw $a1, p1s1_duration
	jal createSong
	#a1 address of the song
	move $a1, $v0
	
	#put song to node
	#create a node
	#v0 address of the node
	#t1 array contents adress
	lw $t1, arrayOfPlaylistsAddress
	#first playlist address
	lw $a0, 0($t1)
	lw $a0, 0($a0)
	jal putElementToLinkedList
	
	
	la $a0, p1s2
	lw $a1, p1s2_duration
	jal createSong
	move $a1, $v0
	
	#put song to node
	#create a node
	#v0 address of the node
	#t1 array contents adress
	lw $t1, arrayOfPlaylistsAddress
	#first playlist address
	lw $a0, 0($t1)
	lw $a0, 0($a0)
	jal putElementToLinkedList
	
	
	la $a0, p1s3
	lw $a1, p1s3_duration
	jal createSong
	move $a1, $v0
	
	#put song to node
	#create a node
	#v0 address of the node
	#t1 array contents adress
	lw $t1, arrayOfPlaylistsAddress
	#first playlist address
	lw $a0, 0($t1)
	lw $a0, 0($a0)
	jal putElementToLinkedList
	
	
	la $a0, p1s4
	lw $a1, p1s4_duration
	jal createSong
	move $a1, $v0
	
	#put song to node
	#create a node
	#v0 address of the node
	#t1 array contents adress
	lw $t1, arrayOfPlaylistsAddress
	#first playlist address
	lw $a0, 0($t1)
	lw $a0, 0($a0)
	jal putElementToLinkedList

	
	#2. Playlist
	#CREATE SONG
	#v0 address of the song returned
	la $a0, p2s1
	lw $a1, p2s1_duration
	jal createSong
	#a1 address of the song
	move $a1, $v0
	#put song to node
	#create a node
	#v0 address of the node
	#t1 array contents adress
	lw $t1, arrayOfPlaylistsAddress
	#first playlist address
	lw $a0, 0($t1)
	lw $a0, 4($a0)
	jal putElementToLinkedList
	
	
	la $a0, p2s2
	lw $a1, p2s2_duration
	jal createSong
	move $a1, $v0
	#put song to node
	#create a node
	#v0 address of the node
	#t1 array contents adress
	lw $t1, arrayOfPlaylistsAddress
	#first playlist address
	lw $a0, 0($t1)
	lw $a0, 4($a0)
	jal putElementToLinkedList
	
	
	la $a0, p2s3
	lw $a1, p2s3_duration
	jal createSong
	move $a1, $v0
	#put song to node
	#create a node
	#v0 address of the node
	#t1 array contents adress
	lw $t1, arrayOfPlaylistsAddress
	#first playlist address
	lw $a0, 0($t1)
	lw $a0, 4($a0)
	jal putElementToLinkedList
	

	la $a0, p2s4
	lw $a1, p2s4_duration
	jal createSong
	move $a1, $v0
	#put song to node
	#create a node
	#v0 address of the node
	#t1 array contents adress
	lw $t1, arrayOfPlaylistsAddress
	#first playlist address
	lw $a0, 0($t1)
	lw $a0, 4($a0)
	jal putElementToLinkedList
	
	
	#3. playlist
	
	#CREATE SONG
	#v0 address of the song returned
	la $a0, p3s1
	lw $a1, p3s1_duration
	jal createSong
	#a1 address of the song
	move $a1, $v0
	#put song to node
	#create a node
	#v0 address of the node
	#t1 array contents adress
	lw $t1, arrayOfPlaylistsAddress
	#first playlist address
	lw $a0, 0($t1)
	lw $a0, 8($a0)
	jal putElementToLinkedList
	
	
	la $a0, p3s2
	lw $a1, p3s2_duration
	jal createSong
	move $a1, $v0
	#put song to node
	#create a node
	#v0 address of the node
	#t1 array contents adress
	lw $t1, arrayOfPlaylistsAddress
	#first playlist address
	lw $a0, 0($t1)
	lw $a0, 8($a0)
	jal putElementToLinkedList
	

	la $a0, p3s3
	lw $a1, p3s3_duration
	jal createSong
	move $a1, $v0
	#put song to node
	#create a node
	#v0 address of the node
	#t1 array contents adress
	lw $t1, arrayOfPlaylistsAddress
	#first playlist address
	lw $a0, 0($t1)
	lw $a0, 8($a0)
	jal putElementToLinkedList
	

	la $a0, p3s4
	lw $a1, p3s4_duration
	jal createSong
	move $a1, $v0
	#put song to node
	
	#create a node
	#v0 address of the node
	#t1 array contents adress
	lw $t1, arrayOfPlaylistsAddress
	#first playlist address
	lw $a0, 0($t1)
	lw $a0, 8($a0)
	jal putElementToLinkedList
	
	
	#4. playlist

	#CREATE SONG
	#v0 address of the song returned
	la $a0, p4s1
	lw $a1, p4s1_duration
	jal createSong
	#a1 address of the song
	move $a1, $v0
	#put song to node
	#create a node
	#v0 address of the node
	#t1 array contents adress
	lw $t1, arrayOfPlaylistsAddress
	#first playlist address
	lw $a0, 0($t1)
	lw $a0, 12($a0)
	jal putElementToLinkedList
	
	
	la $a0, p4s2
	lw $a1, p4s2_duration
	jal createSong
	move $a1, $v0
	#put song to node
	#create a node
	#v0 address of the node
	#t1 array contents adress
	lw $t1, arrayOfPlaylistsAddress
	#first playlist address
	lw $a0, 0($t1)
	lw $a0, 12($a0)
	jal putElementToLinkedList
	

	la $a0, p4s3
	lw $a1, p4s3_duration
	jal createSong
	move $a1, $v0
	#put song to node
	#create a node
	#v0 address of the node
	#t1 array contents adress
	lw $t1, arrayOfPlaylistsAddress
	#first playlist address
	lw $a0, 0($t1)
	lw $a0, 12($a0)
	jal putElementToLinkedList
	
	
	la $a0, p4s4
	lw $a1, p4s4_duration
	jal createSong
	move $a1, $v0
	#put song to node
	#create a node
	#v0 address of the node
	#t1 array contents adress
	lw $t1, arrayOfPlaylistsAddress
	#first playlist address
	lw $a0, 0($t1)
	lw $a0, 12($a0)
	jal putElementToLinkedList
	
	
	#5. playlist
	
	#CREATE SONG
	#v0 address of the song returned
	la $a0, p5s1
	lw $a1, p5s1_duration
	jal createSong
	#a1 address of the song
	move $a1, $v0
	#put song to node
	#create a node
	#v0 address of the node
	#t1 array contents adress
	lw $t1, arrayOfPlaylistsAddress
	#first playlist address
	lw $a0, 0($t1)
	lw $a0, 16($a0)
	jal putElementToLinkedList
	
	
	la $a0, p5s2
	lw $a1, p5s2_duration
	jal createSong
	move $a1, $v0
	#put song to node
	#create a node
	#v0 address of the node
	#t1 array contents adress
	lw $t1, arrayOfPlaylistsAddress
	#first playlist address
	lw $a0, 0($t1)
	lw $a0, 16($a0)
	jal putElementToLinkedList
	

	la $a0, p5s3
	lw $a1, p5s3_duration
	jal createSong
	move $a1, $v0
	#put song to node
	#create a node
	#v0 address of the node
	#t1 array contents adress
	lw $t1, arrayOfPlaylistsAddress
	#first playlist address
	lw $a0, 0($t1)
	lw $a0, 16($a0)
	jal putElementToLinkedList
	
	
	la $a0, p5s4
	lw $a1, p5s4_duration
	jal createSong
	move $a1, $v0
	#put song to node
	#create a node
	#v0 address of the node
	#t1 array contents adress
	lw $t1, arrayOfPlaylistsAddress
	#first playlist address
	lw $a0, 0($t1)
	lw $a0, 16($a0)
	jal putElementToLinkedList
	
	#print
	la $a0, printSong		
	lw $a1, arrayOfPlaylistsAddress
	jal traverseArray
	
	#remove
	lw $a0, arrayOfPlaylistsAddress
	lw $a0, 0($a0)
	lw $a0, 0($a0)
	li $a1, 1
	jal removeElementFromTheLinkedList
	
	lw $a0, arrayOfPlaylistsAddress
	lw $a0, 0($a0)
	lw $a0, 4($a0)
	li $a1, 1
	jal removeElementFromTheLinkedList
	
	lw $a0, arrayOfPlaylistsAddress
	lw $a0, 0($a0)
	lw $a0, 8($a0)
	li $a1, 1
	jal removeElementFromTheLinkedList
	
	lw $a0, arrayOfPlaylistsAddress
	lw $a0, 0($a0)
	lw $a0, 12($a0)
	li $a1, 1
	jal removeElementFromTheLinkedList
	
	lw $a0, arrayOfPlaylistsAddress
	lw $a0, 0($a0)
	lw $a0, 16($a0)
	li $a1, 1
	jal removeElementFromTheLinkedList
	
	#print
	la $a0, printSong		
	lw $a1, arrayOfPlaylistsAddress
	jal traverseArray
	
	
	#add 1 more
	
	#print
	li $v0, 4
	la $a0, newLine		
	syscall
	
	
	#CREATE SONG
	#v0 address of the song returned
	la $a0, p1s5
	lw $a1, p1s5_duration
	jal createSong
	#a1 address of the song
	move $a1, $v0
	#create a node
	#v0 address of the node
	#t1 array contents adress
	lw $t1, arrayOfPlaylistsAddress
	#first playlist address
	lw $a0, 0($t1)
	lw $a0, 0($a0)
	jal putElementToLinkedList
	
	#CREATE SONG
	#v0 address of the song returned
	la $a0, p2s5
	lw $a1, p2s5_duration
	jal createSong
	#a1 address of the song
	move $a1, $v0
	#create a node
	#v0 address of the node
	#t1 array contents adress
	lw $t1, arrayOfPlaylistsAddress
	#first playlist address
	lw $a0, 0($t1)
	lw $a0, 4($a0)
	jal putElementToLinkedList
	
	#CREATE SONG
	#v0 address of the song returned
	la $a0, p3s5
	lw $a1, p3s5_duration
	jal createSong
	#a1 address of the song
	move $a1, $v0
	#create a node
	#v0 address of the node
	#t1 array contents adress
	lw $t1, arrayOfPlaylistsAddress
	#first playlist address
	lw $a0, 0($t1)
	lw $a0, 8($a0)
	jal putElementToLinkedList
	
	#CREATE SONG
	#v0 address of the song returned
	la $a0, p4s5
	lw $a1, p4s5_duration
	jal createSong
	#a1 address of the song
	move $a1, $v0
	#create a node
	#v0 address of the node
	#t1 array contents adress
	lw $t1, arrayOfPlaylistsAddress
	#first playlist address
	lw $a0, 0($t1)
	lw $a0, 12($a0)
	jal putElementToLinkedList
	
	#CREATE SONG
	#v0 address of the song returned
	la $a0, p5s5
	lw $a1, p5s5_duration
	jal createSong
	#a1 address of the song
	move $a1, $v0
	#create a node
	#v0 address of the node
	#t1 array contents adress
	lw $t1, arrayOfPlaylistsAddress
	#first playlist address
	lw $a0, 0($t1)
	lw $a0, ,16($a0)
	jal putElementToLinkedList
	
	#print
	la $a0, printSong		
	lw $a1, arrayOfPlaylistsAddress
	jal traverseArray
	
	lw $a0, arrayOfPlaylistsAddress
	lw $a0, 0($a0)
	li $a1, 4
	jal  removeElementFromArray
	
	#print
	li $v0, 4
	la $a0, newLine		
	syscall
	
	#print
	la $a0, printSong		
	lw $a1, arrayOfPlaylistsAddress
	jal traverseArray
	
	#compareSong
	la $a0, isSong		
	lw $a1, arrayOfPlaylistsAddress
	jal traverseArray
	
mainTerminate:
	la $a0, newLine		
	li $v0, 4
	syscall
	syscall
	
	li $v0, 1
	move $a0, $s0
	syscall
	move $a0, $s1
	syscall
	move $a0, $s2
	syscall
	move $a0, $s3
	syscall
	move $a0, $s4
	syscall
	move $a0, $s5
	syscall
	move $a0, $s6
	syscall
	move $a0, $s7
	syscall
	
	li $v0, 10
	syscall


createArray:
	
	#a0 size to size*4
	sll $t0, $a0, 2
	#t1 = size
	move $t1, $a0
	
	#$v0 = address of array of playlist
	#array of playlists contains adresses of playlists
	addi $v0, $zero, 9
	add $a0, $t0, $zero
	syscall
	#t2 = address of array of playlist
	move $t2 , $v0
	
	#array that holds address of array of playlist and the size of array
	addi $v0, $zero, 9
	addi $a0,$zero, 8
	syscall
	
	move $t3, $v0
	#add t2 adress to first place size to 2. place
	sw $t2, 0($v0)
	sw $t1, 4($v0)
	#$v0 return the address of array info
	move $v0, $t3
	jr $ra

resizeArray:
	
	#a0 arrayinfo addreesss
	#a1 oldsize
	#a2 newsize
	#t1 = newsize
	move $t1, $a2
	#a0 size to size*4
	sll $t0, $a2, 2
	#arrayinfo address t2
	move $t2, $a0
	#oldsize t3
	move $t3, $a1
	#get previous address of playlist array
	lw $t5, 0($t2)
	#$v0 =address of array of playlist
	#array of playlists contains adresses of playlists
	addi $v0, $zero, 9
	add $a0, $t0, $zero
	syscall
	#t4 = new address of array of playlist
	move $t4 , $v0
	#add it to old array info list
	sw $t4, 0($t2)
	#add new size
	sw $a2, 4($t2)
	
	#loop iterator t7
	addi $t7, $zero, 0
	update_loop:
		#while condition
		bge $t7, $t3, exit
		#load old address
		lw $t6, 0($t5)
		#save old address to new array 
		sw $t6, 0($t4)
		#increase iterator
		addi $t7, $t7,1
		#increase array indexes
		addi $t5, $t5, 4
		addi $t4, $t4, 4
		j update_loop
	exit:
		jr $ra
		
putElementToArray:
	
	#a0 arrayinfo addreesss
	#a1 index of elemnt to add
	#v0 a2 the address of linked list 
	#t1 the address of first elemnet in array
	lw $t1, 0($a0)
	#indexe göre kaç?nc? elemana gitmeli
	sll $t2, $a1,2
	add $t1,  $t2, $t1
	sw $a2, 0($t1)
	jr $ra
	
removeElementFromArray:
	#a0 array address a1 index
	sll $t0,$a1, 2
	add $a0,$t0,$a0
	sw $zero, 0($a0)
	jr $ra

createLinkedList:
	addi $v0, $zero, 9
	#8byte array aç 2li
	addi $a0, $zero, 8
	syscall
	jr $ra

putElementToLinkedList:
	
	#a0 address of the linkedlist a1 address of the song
	addi $sp, $sp, -4
	sw $ra,0($sp)
	#t1 next song	
	lw $t1, 4($a0)
	beq $t1, $zero, addsong
	move $a0, $t1
	jal putElementToLinkedList	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
	addsong:
		move $t2, $a0
		sw $a1, 0($t2)
		#v0 address of the new node
		jal createLinkedList
		#add it to second place
		sw $v0, 4($t2)
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		jr $ra

removeElementFromTheLinkedList:
	
	#a0 link listin adresi a1 index
	move $t0, $a0
	move $t1, $a1
	#t3 index
	addi $t2, $zero,0
	
	findNodeToRemove:
		lw $t3, 4($t0)
		addi $t2, $t2, 1
		beq $t2, $t1, removeNode
		move $t0,$t3
		j findNodeToRemove
	removeNode:
		lw $t4 ,4($t3)
		sw $t4, 4($t0)
	
	jr $ra

traverseArray:
	
	#a0 function address a1 array address
	#t0 address
	#t1 size
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	lw $t0, 0($a1)
	lw $t1, 4($a1)
	addi $t2, $zero, 0
	#function addresss
	move $t4, $a0
	bgt $t2, $t1, exit
	
	arrayTraverseLoop:
		#t3 playlist address
		lw $t3, 0($t0)
		beq $t3, $zero, ifEmpty
		move $a0, $t4
		move $a1, $t3
		jal traverseLinkedList
		addi $t0, $t0, 4
		addi $t2, $t2, 1
		beq $t2, $t1, exit1
		j arrayTraverseLoop
		
	ifEmpty:
		addi $t0, $t0, 4
		addi $t2, $t2, 1
		bne $t2, $t1, arrayTraverseLoop
	exit1: 
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		jr $ra
	
	
traverseLinkedList:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	# $a0 function $a1 playlistt adress
	move $t5, $a0
	move $t3, $a1
	
	fetchSong:
		lw $a0, 0($t3)
		jalr $t5
		lw $t3 4($t3)
		lw $t6, 0($t3)
		beq $t6, $zero, exit2
		j fetchSong
	exit2:
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		jr $ra

createSong:

	#a0 address of the song name -t1
	#a1 duration of the song  
	move $t1, $a0
	
	#$v0 = address of the song node
	addi $v0, $zero, 9
	addi $a0, $zero, 8
	syscall
	sw $t1, 0($v0)
	sw $a1, 4($v0)
	
	jr $ra

isSong:
	
	lw $a1, search1
	li $a2, 15
	jr $ra
	jal compareString
	beq $v0, 1, found
	j notFound
	jr $ra
	
	found:
		#print
		li $v0, 4
		la $a0, foundSong	
		syscall
		jr $ra
		
	notFound:
		li $v0, 4
		la $a0, noSong	
		syscall
		jr $ra

compareString:
	
	li $t0, 0
	
	compare_loop:
    		# Load byte from each string
    		lb $t1, 0($a0)       
    		lb $t2, 0($a1)      
		# Compare bytes
    		bne $t1, $t2, not_equal  

    		# Check if end of string reached or counter equals $a2
    		beqz $t1, strings_equal  
    		beq $t0, $a2, strings_equal 

    		addiu $a0, $a0, 1
    		addiu $a1, $a1, 1
    		addiu $t0, $t0, 1

    		j compare_loop

	not_equal:    		
   		li $v0, 0
    		j end
	
	strings_equal:
    		li $v0, 1

	end:
       		jr $ra

printSong:
	
	#a0 address of the song
	move $t7 , $a0
	li $v0, 4
	la $a0, name
	syscall
	
	li $v0 , 4
	lw $a0,  0($t7)
	syscall
	
	li $v0, 4
	la $a0, space
	syscall
	
	li $v0, 4
	la $a0, duration
	syscall
	
	li $v0 , 1
	lw $a0, 4($t7)
	syscall
	
	li $v0, 4
	la $a0, newLine
	syscall
	
	jr $ra