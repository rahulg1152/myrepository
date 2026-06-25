#My first python practice in vscode
print("Hello, World!")

a= [1, 2, 3]
b=('a', 'b', 'c')
print(a,b)
print(type(a),type(b));

c=[98,23,94,9]
print(sorted(c))
d=['69','59','78','08']
#lets merge a nd d
e=a+d
print(e)
print(type(e))
#if we need to convert a list numbers into char
f=[str(x) for x in e]
print(f)