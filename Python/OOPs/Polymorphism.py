class Shapes:
    def __init__(self,name):
        self.name = name

    def area(self):
        print("Formula for the area is ")

    def __str__(self):
        return self.name

class Triangle(Shapes):
    def __init__(self):
        super().__init__("Triangle")

    def area(self):
        print("(1/2)*b*h")
        
    
class Square(Shapes):
    def __init__(self):
        super().__init__("Square")

    def area(self):
        print("a*a")

class Circle(Shapes):
    def __init__(self):
        super().__init__("Circle")

    def area(self):
        print("pi*r*r")

shape = Shapes("");
shape.area();
print(shape);
a1 = Square();
print(a1);
a1.area();
a2 = Triangle();
a2.area();
print(a2);
