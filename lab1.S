.data
N:
.word 4
M:
.word 4
TARGET_COL:
.word 1

matrix:
.word -1, 1, -3, 0,
.word  4, 1, -6, 0,
.word  8, 1,  3, 0,
.word  0, 1,  3, 0,

result:
.word 0

.text

main:
# Init registers
    la a2, N
    la a3, M
    la a4, TARGET_COL
    la a5, matrix
    la a6, result

# Function
    call process

# Print result
    call print
    call exit

###
# Functional
print:
    addi a0, x0, 1   # print_int ecall
    lw a1, 0(a6)     # result
    ecall
    
    addi a0, x0, 11  # print_char ecall
    addi a1, x0, 10  # \n
    ecall 

exit:
    addi a0, x0, 10
    ecall

process:
    # Init regs
    lw t1, 0(a4)
    lw t2, 0(a2)
    lw t3, 0(a3)

    # Init variables
    addi t5, x0, 0       # sum = 0
    addi t4, x0, 0       # i = 0

cycle:
    slli s0, t4, 2       # x8 = i * 4
    add s0, s0, t1       # x8 = i * 4 + TARGET_COL
    slli s0, s0, 2       # x8 = (i * 4 + TARGET_COL) * 4
    add s1, a5, s0       # required element

    lw   t6, 0(s1)       # Load element from matrix
    add  t5, t5, t6      # Sum
    addi t4, t4, 1       # i++
    blt  t4, t2, cycle   # i<N?

    sw t5, 0(a6)         # Save result

    ret
