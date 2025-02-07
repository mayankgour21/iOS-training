import Foundation


// Struct and Enums are value type
// A value type is a type whose value is copied when it’s assigned to a variable or constant, or when it’s passed to a function.


struct Bike
{
    var model : String
    var maxSpeed: Double
    var bikeColor : Color
}

let myBike = Bike(model : "H'ness CB 350",maxSpeed: 180,bikeColor: .red)
var anotherBike = myBike

anotherBike.maxSpeed = 200
anotherBike.bikeColor.setColorToBlack()

print(myBike.bikeColor)
print(anotherBike.bikeColor)


enum Color
{
    case red,black,yellow
    
    mutating func setColorToBlack()
    {
        self = .black
    }
}


let myColor : Color = .red
var newColor : Color = myColor

newColor.setColorToBlack( )

print(myColor)
print(newColor)

