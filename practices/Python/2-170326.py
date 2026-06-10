print ("its second day in python")
print("below is code commenting")
""" this is for multi line comment
and this is the second line of the comment  
and this is the third line of the comment"""

# this is for single line comment
print("single line commenting")

print ("in VSCODE use ctrl / for cmd / for commenting and uncommenting the code")
#write code for all mathemetical operations
import math
a = 100
b = 25
print("addition of a and b is", a+b)    
print("subtraction of a and b is", a-b)
print("multiplication of a and b is", a*b)
print("division of a and b is", a/b)
print("modulus of a and b is", a%b)
print("exponentiation/power of a and b is", a**b)
print("floor division of a and b is", a//b)
#print ceiling of a and b is, math.ceil(a/b)) # need to import math module for this

print("ceiling of a and b is", math.ceil(a/b))

#lets work on relational operators
print("is a greater than b?", a>b)
print("is a less than b?", a<b)
print("is a equal to b?", a==b)
print("is a not equal to b?", a!=b)
print("is a greater than or equal to b?", a>=b)
print("is a less than or equal to b?", a<=b)

#lets work on logical operators
x = True
y = False
print("x and y is", x and y)
print("x or y is", x or y)
print("not x is", not x)
print("not y is", not y)

#lets work on assignment operators
c = 10
c += 5
print("c after addition assignment is", c)  
c -= 3
print("c after subtraction assignment is", c)
c *= 2
print("c after multiplication assignment is", c)
c /= 4
print("c after division assignment is", c)
c %= 3
print("c after modulus assignment is", c)
c **= 2
print("c after exponentiation assignment is", c)
c //= 2
print("c after floor division assignment is", c)

#lets work on bitwise operators
p = 5  # in binary: 0101
q = 3  # in binary: 0011
print("p & q (bitwise AND) is", p & q)  # 0101 & 0011 = 0001 (1 in decimal)
print("p | q (bitwise OR) is", p | q)   # 0101 | 0011 = 0111 (7 in decimal)
print("p ^ q (bitwise XOR) is", p ^ q)  # 0101 ^ 0011 = 0110 (6 in decimal)
print("~p (bitwise NOT) is", ~p)         # ~0101    = 1010 (in two's complement, -6 in decimal)
print("p << 1 (left shift) is", p << 1) # 0101 << 1 = 1010 (10 in decimal)
print("p >> 1 (right shift) is", p >> 1) #  0101 >> 1 = 0010 (2 in decimal)

#type conversion
num1=10
char1="10.2"
print(num1+float(char1)) # converting char1 to float before addition

#use enter input 
print (input("enter whatever value you want to Print: "))
