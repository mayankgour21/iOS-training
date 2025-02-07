import Foundation

var coordinate = (4,5)

switch coordinate
{
case (let x, 0) :
    print("Lies on X axis with X at \(x)")
case(0,let y) :
    print("Lies on Y axis with Y at \(y)")
case(let x, let y) :
    print("Lies somewhere else at \(x) , \(y)")
}

coordinate = (4,4)
switch coordinate
{
case (let x, let y) where x == y :
    print("Lies on line x = y")
case (let x, let y) where x == -y :
    print("Lies on the line x = -y")
case (let x, let y):
    print("Lies at some arbitary point")
}
