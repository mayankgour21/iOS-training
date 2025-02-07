import Foundation

// two kinds of initializers for class types to help ensure all stored properties receive an initial value.
// 1) Designated Initializer

// Designated initializers are the primary initializers for a class. A designated initializer fully initializes all properties introduced by that class and calls an appropriate superclass initializer to continue the initialization process up the superclass chain.



// 2) Convenience Initializer
 
// Convenience initializers are secondary, supporting initializers for a class. You can define a convenience initializer to call a designated initializer from the same class as the convenience initializer with some of the designated initializer’s parameters set to default values. You can also define a convenience initializer to create an instance of that class for a specific use case or input value type.

/*
Rule 1
A designated initializer must call a designated initializer from its immediate superclass.

Rule 2
A convenience initializer must call another initializer from the same class.

Rule 3
A convenience initializer must ultimately call a designated initializer.
*/

class Vehicle{
    var numberOfWheels : Int
    var description: String {
        return "Number of Wheels : \(numberOfWheels)"
    }
    init()
    {
        numberOfWheels = 0
    }
}

class BiCycle: Vehicle{
    
    override init()
    {
        super.init() // this will first call the superclass initializer (i.e the phase 1) after the ending of phase 1 modification can be done on superclass stored vairable only not constant
        numberOfWheels = 2
    }
}

var myCycle = BiCycle()

print(myCycle.description)


class MountainBike : BiCycle{
    
    var hasGear = true
    var numberOfGears : Int
    
    override init()
    {
        numberOfGears = 10
        // super.init() i.e implicitly calls the superclass init

    }
}
