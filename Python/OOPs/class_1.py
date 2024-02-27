class A():
    a = 3
    def hello(self):
        print(self.a)

class Person:
    def __init__(self,name):
        self.name = name
    def tellname(self):
        print("The name is {}".format(self.name))

p1 = Person("Rajapaul")
p2 = Person("Raghu")
p1.tellname()
p2.tellname()

obj = A()
obj.hello()

'''
ERROR : 
line 3 : obj.hello()
TypeError: hello() takes 0 positional arguments but 1 was given  // didn't passed self in argument 
line 4 : print(a) 
NameError: name 'a' is not defined // didn't use self.a
'''
