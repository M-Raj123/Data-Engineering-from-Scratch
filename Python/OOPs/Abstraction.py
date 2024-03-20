class Base:
    
    __secret = 0

    def add(self,val):
        self.__secret+=val
        print (self.__secret)

    
obj = Base()
obj.add(4)
print(obj._Base__secret) // access the value of a hidden attribute 
