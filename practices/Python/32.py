#string commands
#string concatenation
first_name = "John"

last_name = "Smith"
full_name = first_name + " " + last_name
print(full_name)
print(first_name+last_name) #concatenates without a space
#string repetition
print("Hello" * 3) 
#string indexing
print(full_name[0]) #prints the first character
print(full_name[5]) #prints the sixth character
#string slicing
print(full_name[0:4]) #prints the first four characters
print(full_name[5:]) #prints from the sixth character to the end
#string methods
print(full_name.upper()) #prints the full name in uppercase
print(full_name.lower()) #prints the full name in lowercase
print(full_name.replace("John", "Jane")) #replaces "John" with "Jane"
print(full_name.split()) #splits the full name into a list of words
#String Slicing with Steps
a= "\rShrajal is bestfriend.\nhe is very\t good at coding."
print(str(a)) #prints the string as it is with \r and \n and \t
# import time
# for i in range(0, 5):
#     print(f"Time {i}", end="\n ")
#     time.sleep(1)
print(a[0:7])
print(a[0:])
print(a.endswith("al"))

#practice
#WAP input firstname and output length of that firstname
#str1= input("Enter the First Name: " )
#print("Length of your first name is "+ str(len(str1)))

print(str.count(a.upper(),"A"))

#conditional statements
from datetime import datetime
age = int(input("enter age of the candidate and check the eligibility: "))
if int(age)>= 18: print ("eligible for category a")
elif int(age) <= 18 and int(age) > 15: print("eligible for category a-")

#WAP for school grade system
marks=int(input("Enter your Marks: "))
if marks >=90: print("Grade A")
elif marks >=80 and marks <90:
     print ("Grabde B")
elif marks >=70 and marks <80: 
     print ("Grade C")
elif marks >=60 and marks <70: 
     print ("Grade D")
elif marks >=50 and marks <60: 
     print ("Grade E")
elif marks <50: print ("Grade F")
else: print("Failed")

#Practice Problem
#wap to check number input i even or odd 
num1 = int (input("enter your number to check even or odd: "))
if num1%2==0: print ("Even")
else: print ("Odd")

#WAP to check greatest of multiple numbers
num1=int(input("enter first number:"))
num2=int(input("enter second number:"))
num3=int(input("enter third number:"))
if num1 > num2 :
     if num1> num3 : print("num1 is greatest") 
elif num2 > num1 :
     if num2 > num3 : print("num2 is greatest") 
elif num3 > num1 :
     if num3 > num2 : print("num3 is greatest")

