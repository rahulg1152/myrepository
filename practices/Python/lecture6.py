#printing even or odd for input number
def fun_number(num):
    if num%2==0:
        str1= "Even"
        print(str1)
    elif num%2 > 0:
        str1= "Odd"
        print(str1)
     
    return str1
    print("argument number is ",str1)

fun_number(-0)

def show_value(num):
     return num

for i in range(1,show_value(11),1):
    print(i);

def recu_fun(num):
    if num==0:
        return 
    else: 
        print(num)
        recu_fun(num)

recu_fun(0)

#Pratice for sum of n natural numbers using recursion
def fun_sum(num):
    if num==0:
        return 0
    else:
        num=num + fun_sum(num-1)
    return num

result = fun_sum(15)
print(result)


