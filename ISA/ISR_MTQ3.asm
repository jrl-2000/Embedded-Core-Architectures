# ISR1
cwp
wpl

# 0x4102 address holds
mil r1 0x02
mih r1 0x41
# same for r1
mil r2 0x00
# 0x0900
mih r2 0x09
sta r1 r2

wph # high

# 0x4103 same for count (it holds)
mil r3 0x03
mih r3 0x41
mil r4 0xFF
mih r3 0x00
sta r4, r3

# The CPU loads the DMA address register
# that marks the beginning address of the block to be transferred in the memory. Also
# it loads the count register that gets the number of data to be transferred.

wpl
# Command 0x4101
mil r2 0x01
mih r2 0x41
mil r1 0x01
mih r1 0x00


#########################################################################

# ISR2
    cwp
    wpl

#  Set R0
    mil r0 0x00
    mih r0 0x00


#  Set R1
    mil r1 0x01
    mih r1 0x00

#  Set R2 # lower of 0x09_FF setting up the for loop 255 elements to be transferred 
    mil r2 0xFF
    mih r2 0x00

    wph # high

    mil r4 0x01
    mih r4 0x00
    mil r5 0x00
    mih r5 0x09 # upper of 0x09_FF
    mil r4 0x00
    mih r4 0x00

L10 wph
# Load address
    lda r7, r5
# compare
    cmp r6, r7
# branch if carry
    brc L02
# Move Register
    mvr r6, r7
    add r5, r4
    wpl
L02 add r0, r1
    cmp r2, r0 
    brc L2
    jpr L10
L2    










