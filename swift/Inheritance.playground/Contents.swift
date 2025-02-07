import Foundation

enum Wheeler : String
{
    case twoWheeler,fourWheeler
}
class Vehicle
{
    var maxSpeed : Int = 0
    var typeOfWheeler : Wheeler = .twoWheeler
    var numOfWheels : Int
    var numOfGears : Int
    var description : String
    {
        return "Max speed is \(maxSpeed)"
    }
    
    init (maxSpeed : Int)
    {
        self.maxSpeed = maxSpeed
        self.numOfGears = 0
        self.numOfWheels = 0
    }
    
    func makeSound()
    {
        // to override by child class
    }
}

class Bike : Vehicle
{
    
    override var numOfWheels : Int
    {
        get
        {
            return 2
        }
        set
        {
            super.numOfGears = newValue/2 + 2
        }
    }
    
    override func makeSound() {
        print("Brhumm.. Brhumm..")
    }
    
}

class Car : Vehicle
{
    override var numOfWheels : Int
    {
        didSet
        {
            numOfGears = numOfWheels + 1
            print("Changing the old number of wheels : \(oldValue) and Setting the new value of gears to : \(numOfGears)")
            
        }
    }
    
    override var typeOfWheeler: Wheeler
        {
            
            // If you provide a setter as part of a property override, you must also provide a                             getter for that override. If you don’t want to modify the inherited property’s                                  value within the overriding getter, you can simply pass through the inherited value                           by returning super.someProperty from the getter, where someProperty is the name                                 of the property you are overriding.
            get
            {
                return super.typeOfWheeler
            }
            set
            {
                switch newValue {
                case .twoWheeler:
                    print("Car cannot be Two wheeler ")
                case .fourWheeler:
                    print("Set to \(newValue)")
                    numOfWheels = 4
                }
            }
        }
    
    override func makeSound() {
        print("Jhuk Jhuk...")
    }
}



var newBike = Bike(maxSpeed: 100)

print(newBike.description)
newBike.numOfWheels = 4
print(newBike.numOfGears)

let WagnoR = Car(maxSpeed: 180)

print(WagnoR.description)
WagnoR.makeSound()


WagnoR.typeOfWheeler = .fourWheeler
