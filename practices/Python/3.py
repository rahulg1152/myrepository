# #Python program for list and array
# marks_list = [85, 92, 78, 96, 88]
# print(marks_list[0:6])
# print(marks_list[1:])
# print(marks_list[:2])
# print(marks_list[-1:])
# print(marks_list[:-2])
# print (len(marks_list))
# #print count of list
# print(marks_list.count(1))
# #printing list of my favorite movies
# #m_list=["Kal ho na ho","Black","Troy"]
# m_list=[input("your first favorite movie: "),input("Enter your 2nd favorite movie: "),input("Enter your 3rd favorite movie: ")]
# print ("My favorite movies are: ", m_list)
#wap for palindrome checking
list1=[input("enter your list of element: "),input("enter your list of element: "),input("enter your list of element: ")]
print(type(list1))
print(list1)
list2=list1.copy()
list2.reverse()
print(type(list2))
if list1==list2:
    print("The list is palindrome")
else:
    print("The list is not palindrome") 

#WAP for counting grades in a tuple
grades_tuple = ('A', 'B', 'A', 'C', 'B', 'A', 'D')
print(type(grades_tuple))
print (grades_tuple.count('A'))

#WAP for storing those tuple in a list
list1=['A', 'B', 'A', 'C', 'B', 'A', 'D']
print(type(list1))
print(list1.sort())
print (list1)