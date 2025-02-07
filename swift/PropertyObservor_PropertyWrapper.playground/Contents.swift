import Foundation


//struct Cuboid
//{
//    var length: Double
//    var width: Double
//    var height: Double
//    var tempProp : Int?
//    var volume : Double  // Computed Properties
//    {
//        return length * width * height
//    }
//}

//var cuboid = Cuboid(length: 4.5, width : 5.5,height : 6.5)
//
//print("Volume of cuboid is \(cuboid.volume)")

// Property Observer
// what if the value of a property get changed but the value of the computed property which depends on that property remained the same as old version but it should be the updated version whenever the property value get changed and we should not call the calculated property everytime when a stored property get changed instead it should observe and respond to the changes in a property's value

// for example

//cuboid.length = 7.5
//print("Volume of cuboid is \(cuboid.volume)")

struct Cuboid
{
    var length: Int
    {
        // NOTE : the parameter passed in the willSet i.e newValue and in didSet i.e oldValue is constant
        willSet(newLength)
        {
            print("Length is updating...")
            print("Volume will get updated to \(newLength * width * height)")
//            print("Set hone se phle ka volumne : \(volume)")
            
        }
        didSet
        {
            print("Old value : \(oldValue)")
            print("New Value : \(length) ")

            print("set hone ke baad volumne : \(volume)")
            var oldVolume = oldValue*width*height
            if(length > oldValue)
            {
                print("Volume increased by \(volume - oldVolume)")
            }
            else
            {
                print("Volume decreased by \(oldVolume - volume)")
            }
        }
    }
    var width: Int
    {
        willSet(newWidth){
            print("Width is updating...")
            print("Volume will get updated to \(length * newWidth * height)")
        }
        didSet
        {
            print("Old value : \(oldValue)")
            print("New Value : \(width) ")

            print("set hone ke baad volumne : \(volume)")
            var oldVolume = length*oldValue*height
            if(width > oldValue)
            {
                print("Volume increased by \(volume - oldVolume)")
            }
            else
            {
                print("Volume decreased by \(oldVolume - volume)")
            }
        }
    }
    var height: Int
    var tempProp : Int?
    
    // calculated property
    var volume : Int
    {
        get{
            return length * width * height
        }
        set(newVolume)
        {
            length = newVolume/3
        }
        
    }
}

var cuboid = Cuboid(length: 5, width: 4, height: 7)

print(cuboid.volume)


//cuboid.length = 6

func increaseLegthAndWidthByTen(cub : inout Cuboid)
{
    print("Function started")
    print(cub.length)
    cub.length += 10
    print(cub.length)
    print(cub.width)
    cub.width += 10
    print(cub.width)
    print("Function ending")
}

//increaseLegthAndWidthByTen(cub : &cuboid)

cuboid.volume = 60

print(cuboid.volume)
