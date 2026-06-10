#for char values we need to take double quote
print("Rahul,", "This is my first Python practice program file") 
print("this is for new line")
#for number we can directly write without double quote
print(2051988)
#print addition of my and tushi
a=28021987 + 13081993
print(a)
#want write a code to print addition of all digits of output of parameter a
sum=0
for digit in str(a):
    sum += int(digit)
print(sum)
#want to write a code for printing table of 2
for i in range(1,11):
    print(2*i);

#find a number
num = int(input("Enter a number: "))
if num > 0:
    print("The number is positive.")
elif num < 0:    print("The number is negative.")
else:    print("The number is zero.")
