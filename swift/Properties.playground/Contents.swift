import Foundation

struct FixedLength
{
    var startingValue : Int
    let length : Int
}

// Stored Properties //

var fixedlenght = FixedLength(startingValue:10,length: 5)

// as the starting value is variable we can change it and this is called variable stored property

fixedlenght.startingValue = 20

print(fixedlenght.startingValue)
print(fixedlenght.length)

// on the other hand length is a constant which cannot be changed so it is called constant stored property

// fixedlenght.length = 100 // throw error

// In struct we can modify the variable property if the instance of the particular struct is assigned to a variable but this is not true if it is assigned to a constant, below is the example

let tempLength = FixedLength(startingValue: 5, length: 10)

 // tempLength.startingValue = 20 // will throw error we cannot modify the startingValue even it is variable stored property

// WHY ????

// because sturct is value type, When an instance of a value type is marked as a constant, so are all of its properties.

// In Case of Class :
/*The same isn’t true for classes, which are reference types. If you assign an instance of a reference type to a constant, you can still change that instance’s variable properties.*/

// for example refer to class playground




