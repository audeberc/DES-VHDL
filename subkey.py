import collections


key = [0,0,0,1,0,0,1,1,0,0,1,1,0,1,0,0,0,1,0,1,0,1,1,1,0,1,1,1,1,0,0,1,1,0,0,1,1,0,1,1,1,0,1,1,1,1,0,0,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,
       1]
#key=range(64)
#print(len(key))
pc1l = range(28)
pc1r = range(28)


####### pc1l
pc1l[0] = key [56]
pc1l[1] = key [48]
pc1l[2] = key [40]
pc1l[3] = key [32]

pc1l[4] = key [24]
pc1l[5] = key [16]
pc1l[6] = key [8]
pc1l[7] = key [0]

pc1l[8] = key [57]
pc1l[9] = key [49]
pc1l[10] = key [41]
pc1l[11] = key [33]

pc1l[12] = key [25]
pc1l[13] = key [17]
pc1l[14] = key [9]
pc1l[15] = key [1]

pc1l[16] = key [58]
pc1l[17] = key [50]
pc1l[18] = key [42]
pc1l[19] = key [34]

pc1l[20] = key [26]
pc1l[21] = key [18]
pc1l[22] = key [10]
pc1l[23] = key [2]

pc1l[24] = key [59]
pc1l[25] = key [51]
pc1l[26] = key [43]
pc1l[27] = key [35]
#######
#pc1l=pc1l[1:29]


####### pc1r
pc1r[0] = key [62]
pc1r[1] = key [54]
pc1r[2] = key [46]
pc1r[3] = key [38]

pc1r[4] = key [30]
pc1r[5] = key [22]
pc1r[6] = key [14]
pc1r[7] = key [6]

pc1r[8] = key [61]
pc1r[9] = key [53]
pc1r[10] = key [45]
pc1r[11] = key [37]

pc1r[12] = key [29]
pc1r[13] = key [21]
pc1r[14] = key [13]
pc1r[15] = key [5]

pc1r[16] = key [60]
pc1r[17] = key [52]
pc1r[18] = key [44]
pc1r[19] = key [36]

pc1r[20] = key [28]
pc1r[21] = key [20]
pc1r[22] = key [12]
pc1r[23] = key [4]

pc1r[24] = key [27]
pc1r[25] = key [19]
pc1r[26] = key [11]
pc1r[27] = key [3]
######
#pc1r=pc1r[1:29]
#
#print("Pc1_r")
#print(pc1r)
#print("   ")
#print("Pc1_l")
#print(pc1l)

###### rotleft
pc1r= collections.deque(pc1r)
pc1l= collections.deque(pc1l)  

##rot1
pc1l.rotate(-1)
pc1r.rotate(-1)
pc1l=list(pc1l)
pc1r=list(pc1r)


#print("Pc1_r")
#print(pc1r)
#print("   ")
#print("Pc1_l")
#print(pc1l)

def PC2(tab1,tab2):
    tab=tab1+tab2
    out = range(0,48)
    out[0]=tab[13]
    out[1]=tab[16]
    out[2]=tab[10]
    out[3]=tab[23]
    
    out[4]=tab[0]
    out[5]=tab[4]
    out[6]=tab[2]
    out[7]=tab[27]

    out[8]=tab[14]
    out[9]=tab[5]
    out[10]=tab[20]
    out[11]=tab[9]

    out[12]=tab[22]
    out[13]=tab[18]
    out[14]=tab[11]
    out[15]=tab[3]

    out[16]=tab[25]
    out[17]=tab[7]
    out[18]=tab[15]
    out[19]=tab[6]

    out[20]=tab[26]
    out[21]=tab[19]
    out[22]=tab[12]
    out[23]=tab[1]    
    
    out[24]=tab[40]
    out[25]=tab[51]
    out[26]=tab[30]
    out[27]=tab[36]
    
####
    out[28]=tab[46]
    out[29]=tab[54]
    out[30]=tab[29]
    out[31]=tab[39]
    
    out[32]=tab[50]
    out[33]=tab[44]
    out[34]=tab[32]
    out[35]=tab[47]

    out[36]=tab[43]
    out[37]=tab[48]
    out[38]=tab[38]
    out[39]=tab[55]

    out[40]=tab[33]
    out[41]=tab[52]
    out[42]=tab[45]
    out[43]=tab[41]

    out[44]=tab[49]
    out[45]=tab[35]
    out[46]=tab[28]
    out[47]=tab[31]
    
    return out
#    
#test1 = range(1,29)
#test2 = range(29,57)
#print(test1)
#print("  ")
#test=PC2(test1,test2)
#print(test)
print(" ")
print("subkey1")
subkey1 = PC2(pc1l,pc1r)
print(subkey1)
  

# ROT 12

pc1r= collections.deque(pc1r)
pc1l= collections.deque(pc1l)  
pc1l.rotate(-1)
pc1r.rotate(-1)
pc1l=list(pc1l)
pc1r=list(pc1r)
print(" ")
print("subkey2")
subkey1 = PC2(pc1l,pc1r)
print(subkey1)

# ROT 21

pc1r= collections.deque(pc1r)
pc1l= collections.deque(pc1l)  
pc1l.rotate(-2)
pc1r.rotate(-2)
pc1l=list(pc1l)
pc1r=list(pc1r)
print(" ")
print("subkey3")
subkey1 = PC2(pc1l,pc1r)
print(subkey1)

# ROT 22

pc1r= collections.deque(pc1r)
pc1l= collections.deque(pc1l)  
pc1l.rotate(-2)
pc1r.rotate(-2)
pc1l=list(pc1l)
pc1r=list(pc1r)
print(" ")
print("subkey4")
subkey1 = PC2(pc1l,pc1r)
print(subkey1)

# ROT 22

pc1r= collections.deque(pc1r)
pc1l= collections.deque(pc1l)  
pc1l.rotate(-2)
pc1r.rotate(-2)
pc1l=list(pc1l)
pc1r=list(pc1r)
print(" ")
print("subkey5")
subkey1 = PC2(pc1l,pc1r)
print(subkey1)

# ROT 22

pc1r= collections.deque(pc1r)
pc1l= collections.deque(pc1l)  
pc1l.rotate(-2)
pc1r.rotate(-2)
pc1l=list(pc1l)
pc1r=list(pc1r)
print(" ")
print("subkey6")
subkey1 = PC2(pc1l,pc1r)
print(subkey1)

# ROT 22

pc1r= collections.deque(pc1r)
pc1l= collections.deque(pc1l)  
pc1l.rotate(-2)
pc1r.rotate(-2)
pc1l=list(pc1l)
pc1r=list(pc1r)
print(" ")
print("subkey7")
subkey1 = PC2(pc1l,pc1r)
print(subkey1)

# ROT 22

pc1r= collections.deque(pc1r)
pc1l= collections.deque(pc1l)  
pc1l.rotate(-2)
pc1r.rotate(-2)
pc1l=list(pc1l)
pc1r=list(pc1r)
print(" ")
print("subkey8")
subkey1 = PC2(pc1l,pc1r)
print(subkey1)

# ROT 22

pc1r= collections.deque(pc1r)
pc1l= collections.deque(pc1l)  
pc1l.rotate(-1)
pc1r.rotate(-1)
pc1l=list(pc1l)
pc1r=list(pc1r)
print(" ")
print("subkey9")
subkey1 = PC2(pc1l,pc1r)
print(subkey1)

# ROT 22

pc1r= collections.deque(pc1r)
pc1l= collections.deque(pc1l)  
pc1l.rotate(-2)
pc1r.rotate(-2)
pc1l=list(pc1l)
pc1r=list(pc1r)
print(" ")
print("subkey10")
subkey1 = PC2(pc1l,pc1r)
print(subkey1)

# ROT 22

pc1r= collections.deque(pc1r)
pc1l= collections.deque(pc1l)  
pc1l.rotate(-2)
pc1r.rotate(-2)
pc1l=list(pc1l)
pc1r=list(pc1r)
print(" ")
print("subkey11")
subkey1 = PC2(pc1l,pc1r)
print(subkey1)

# ROT 22

pc1r= collections.deque(pc1r)
pc1l= collections.deque(pc1l)  
pc1l.rotate(-2)
pc1r.rotate(-2)
pc1l=list(pc1l)
pc1r=list(pc1r)
print(" ")
print("subkey12")
subkey1 = PC2(pc1l,pc1r)
print(subkey1)

# ROT 22

pc1r= collections.deque(pc1r)
pc1l= collections.deque(pc1l)  
pc1l.rotate(-2)
pc1r.rotate(-2)
pc1l=list(pc1l)
pc1r=list(pc1r)
print(" ")
print("subkey13")
subkey1 = PC2(pc1l,pc1r)
print(subkey1)

# ROT 22

pc1r= collections.deque(pc1r)
pc1l= collections.deque(pc1l)  
pc1l.rotate(-2)
pc1r.rotate(-2)
pc1l=list(pc1l)
pc1r=list(pc1r)
print(" ")
print("subkey14")
subkey1 = PC2(pc1l,pc1r)
print(subkey1)

# ROT 22

pc1r= collections.deque(pc1r)
pc1l= collections.deque(pc1l)  
pc1l.rotate(-2)
pc1r.rotate(-2)
pc1l=list(pc1l)
pc1r=list(pc1r)
print(" ")
print("subkey15")
subkey1 = PC2(pc1l,pc1r)
print(subkey1)




# ROT 22

pc1r= collections.deque(pc1r)
pc1l= collections.deque(pc1l)  
pc1l.rotate(-1)
pc1r.rotate(-1)
pc1l=list(pc1l)
pc1r=list(pc1r)
print(" ")
print("subkey16")
subkey1 = PC2(pc1l,pc1r)
print(subkey1)

