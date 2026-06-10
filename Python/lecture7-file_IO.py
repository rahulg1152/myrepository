#WAP for creating a file using python
r=open ("test_file.txt","w")
r.write("hi evryone, \nwe are learning File IO \n using Java.\n i like programming in python")
r.close()


#or 

with open ("test_file.txt","w") as r:
    r.write("hi evryone, \nwe are learning File IO \n using Java.\n i like programming in python 22 33 44 55")


#WAP for replacing all "java" with "python" in the above file
with open ("test_file.txt","r") as r:
    data=r.read()
    data=data.replace("java","python")

with open ("test_file.txt","w") as r:
    r.write(data)   

#wap to find even and odd numbers from file and print them
with open ("test_file.txt","r") as r:
    data=r.read()
    numbers=data.split()
    even_numbers=[]
    odd_numbers=[]
    for num in numbers:
        if num.isdigit():
            if int(num)%2==0:
                even_numbers.append(num)
            else:
                odd_numbers.append(num)