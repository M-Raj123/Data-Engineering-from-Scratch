class Base:
    def __init__(self):
        self._a = 2    # protected member
        self.__c = 10  # private member
    
    def getValue(self):
        return self.__c

    def setValue(self,val):
        self.__c = val 


class Derived(Base):
    def __init__(self):

        Base.__init__(self)
        print("Calling protected member of base class : ", self._a )

        self._a = 3
        print("modified value : ", self._a )


o1 = Base()
o2 = Derived()

print("Base object1 protected member : " , o1._a)
print("Base object1 private member : " , o2.getValue())
print("Derived object2 : " , o2._a)


'''
output:
Calling protected member of base class :  2
modified value :  3
Base object1 protected member :  2
Base object1 private member :  10
Derived object2 :  3
'''
