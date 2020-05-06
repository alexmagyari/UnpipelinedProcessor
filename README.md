# Unpipelined Processor Debugger

# Introduction

This Unpipelined Processor Debugger was originally developed for a computer architecture course. The code herein is completely original. While there may be some errors with the comments, the code has been tested and run on a Cyclone V FPGA Device. For a video tutorial of the device running sample code, please [Go Here](https://drive.google.com/open?id=1QrQQyJEGjOr13PuMlKEWROKDg96Y599E)

## Sample Code

The assembly code run in the video demo is the implementation of a max function for an array. The array and instructions are loaded into the data memory and instruction memory, respectively, and then executed line by line. 
The assembly code is as follows:
```Assembly
.data

arr: 	.word 32, 11, 3, 9, 22, 17, 42, 99, 110, 58

.text
.globl main

main:	
nop				            # line buffer
addi $s0, $zero,  arr		# starting address of arr in $s0
addi $s1, $zero, 10            
add  $s2, $zero, $zero 	    # i in $s2
addi  $s3, $zero, -1	    # max in $s3
	
Loop:  
add   $t1, $t1, $s0	        # $t1 = i + $s0
lw      $t0, 0($s2)		    # $t[0] = arr[i]
slt     $t2, $t0, $s3 		# $t2 = 1 if $t0 < $s3. $t2 = 0 if $t0 >= $s3
bne   $t2, $zero, L1 		# if ($t2 != 0), $s3 is still max, go to L1
or    $s3, $t0, $zero		# update max value  # happens when new max is found

L1: 	
addi $s2, $s2, 1	        # i = i + 1
bne $s2, $s1, Loop		    # if (i != $s1), go back to loop
J     done                  # Prevent memory overflow

done: 	
add $v0, $zero, $s4 		
sw s3, 11(arr)			    # Save to mem

End:
J End                       # Prevent Instruction Overflow
syscall

```

The machine language, which is executed on the processor, is as follows:
```
        00 00 00 20 
Main:   20 10 00 00
        20 11 00 0A
        00 00 90 20
        20 13 FF FF
Loop:   01 30 48 20
        8E 48 00 00
        01 13 50 2A
        15 40 00 01
        01 00 98 25
L1:     22 52 00 01
        16 51 FF F9
```

## Meta

Alex Magyari - alexander.magyari@gmail.com