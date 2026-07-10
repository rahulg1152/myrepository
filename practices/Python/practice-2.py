a= 2051988
b= 13081994
v_str=str(a+b)
print (v_str)
v_str1=input("Enter your name: ")
for i in range(0,len(v_str1)):
    print(v_str1[i])
    
#concat 2 strings
a=[1,2,3,4]
b=[9,8,7,6]
print (a+b)
#sort the items increasing order
print (sorted(a+b))
#add all elements of a into list b
b.extend(a)
print (b)
print (sorted(b))   
#for loop
for i in range(92,100):
    print(i)    
#while loop
i=int(input("Enter a number: "))
#if input is not number then print invalid input
if not isinstance(i, int):
    print("Invalid input")
print ("While loop") 
while i<100:
    print(i)
    i+=1
#reverse while loop
print ("Reverse while loop")
while i>=92:
    print(i)
    i-=1
#floor and ceil of numbers
import math
a=5.7
print(math.ceil(a),math.floor(a))
#string modification
str='i am rahul'
print(str.endswith('ul'))
print(str.capitalize())
print(str.replace('rahul','tushi'))
print (str.split(' '))
print(str.find('am'))
print(str.count('a'))

#for N=5 we need to print alphabates in one row without space .
N=5
a=['a','b','c','d','e']
for i in range(N):
    print(a[i],end='')
#print even and odd numbers from 1 to 10    
a=[1,2,3,4,5,6,7,8,9,10]
for i in range (0,len(a)):
    if a[i] % 2==0:
        print('even number is ', a[i])
    else:
        print ('odd number is ', a[i])

#enter 3 movies and add them into a list or tupple and print them
a=[]
for i in range (0,3):
     a.append(input("enter movie name: "))
print(a)
print(type(a))
