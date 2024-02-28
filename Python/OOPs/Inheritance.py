#Parent Class
class Person:
    def __init__(self,id,name):
        self.id = id
        self.name = name
    
    def details(self):
        print("My name is {}".format(self.name))
        print("IdNumber: {}".format(self.idnumber))
    
#Child Class
class Employee(Person):
    def __init__(self,id,name,salary,post):
        self.salary = salary
        self.post   = post

        Person.__init__(self,id,name)  # invoking super class
    
    def details(self):
        print("IdNumber: {}".format(self.id))
        print("My name is {}".format(self.name))
        print("Post : {}".format(self.post))


E1 = Employee(101,"Rahul",25000,"Intern")
E1.details()
