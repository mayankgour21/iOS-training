import Foundation


// Initializer Delegation for Value Type : i.e Structure and Enum

struct Point
{
    var x : Int = 0
    var y : Int = 0
}

struct Size
{
    var width : Double = 0.00
    var length : Double = 0.00
}

struct Rectangle
{
    var origin = Point()
    var size = Size()
    
    init()
    {
        
    }
    
    init (origin : Point, size : Size)
    {
        self.origin = origin
        self.size = size
    }
    
    init (centre : Point, size : Size)
    {
        let xOrigin = centre.x - Int(size.width / 2)
        let yOrigin = centre.y - Int(size.length / 2)
        
        self.init(origin : Point(x : xOrigin, y :  yOrigin),size : size) // calling(delegate) self init here
    }
}

let rect = Rectangle(centre : Point(x: 3, y : 3), size : Size(width : 5,length : 5))

print(rect.origin)
