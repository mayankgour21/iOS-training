import Foundation

/*struct shoes
 {
 let brand : ShoesBrand
 let sizeType : ShoesSizeType
 let size : Double
 }
 /*
  enum ShoesBrand
  {
  case nike,
  adidas,
  pvma,
  sketchers
  
  var chooseBrand : String
  {
  switch self
  {
  case .nike :
  return "Nike"
  case .pvma :
  return "Puma"
  case .adidas :
  return "Adidas"
  case . sketchers :
  return "Sketchers"
  }
  
  }
  }
  */
 enum ShoesSizeType
 {
 case uk,us,eu,cm,inch
 }
 /*
  var getNewShoeBrand : ShoesBrand = .pvma
  let shoe1 = shoes(brand: .nike, sizeType: .us, size: 42)
  let shoe2 = shoes(brand: .pvma,sizeType: .uk, size : 9)
  
  print(getNewShoeBrand.chooseBrand)
  */
 
 // Iterating over the enumeration cases
 
 enum ShoesBrand : CaseIterable
 {
 case nike,
 adidas,
 pvma,
 sketchers
 }
 
 let numOfBrandsAvailable = ShoesBrand.allCases.count
 print(numOfBrandsAvailable)
 
 
 // printing all the cases of the shoeBrand
 
 for shoeBrand in ShoesBrand.allCases
 {
 print(shoeBrand)
 }
 */


// Associated Value : Different case of enum can have different type and is not prepopulated
// Associated values are set when you create a new constant or variable based on one of the enumeration’s cases, and can be different each time you do so.
/*
enum Barcode
{
    case upc(Int,Int,Int,Int)
    case qr(String)
}

//var productBarcode = Barcode.upc(8,2342,2344,3)
var productBarcode:Barcode
productBarcode = .upc(8,2324,2342,2)
print(type(of: productBarcode))
productBarcode = .qr("&#$(#%@")

switch productBarcode
{
case .upc(let num1,let num2,let num3, let checknum):
    print( "UPC: \(num1) \(num2) \(num3) \(checknum)")
case .qr(let qrcode) :
    print("QR: \(qrcode)")
}

*/
// Raw Value : All the case of enum will have same type and is prepopulated with default value


enum ASCIIControlCharacter : Character
{
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
    case space = " "
}

// Implicit Assigned Raw Value {For Int or String}
// For Integer
enum Month : Int
{
    case january = 1, february, march, April, May, June, July, August, September, October, November, December
}


print(Month.December.rawValue)

// For String
enum ShoesBrand : String
{
        case nike,
        adidas,
        pvma,
        sketchers
}

print(ShoesBrand.pvma.rawValue)


// Initializing from a Raw value

if let month = Month(rawValue: 10)  // month will be of type Month?
{
    switch month
    {
        case .january: print("New years first month")
        default :
        print("other month of the year")
    }
    
}
else
{
    print("Month doestnot exist")
}


// Recursive Enumerations
enum FileSystemObject
{
    case file (name : String,size : Int)
    case directory(name : String,directoryContents : [FileSystemObject])
}
// Note : The [FileSystemObject] type for directoryContents is not stored directly inside the enum; instead, it is managed as a reference. Arrays in Swift use a heap-allocated buffer to store their elements. This provides the required indirection for the recursive structure to work.

/* enum FileSystemObject
{
    case file (name : String,size : Int)
    case directory(name : String,directoryContents : FileSystemObject)
} */
 // above example will throw compilation error because here FileSystemObject allocates memory directly so we have to use indirect keyword

/* indirect enum FileSystemObject   // Applies to whole enum cases
{
    case file (name : String,size : Int)
    case directory(name : String,directoryContents : FileSystemObject)
} */

    //  OR //
/* enum FileSystemObject          // Applied to particular case
{
    case file (name : String,size : Int)
    indirect case directory(name : String,directoryContents : FileSystemObject)
} */


var rootDirec : FileSystemObject
let file1 : FileSystemObject = .file(name : "file1",size : 10)
let file2 : FileSystemObject = .file(name : "file2",size : 10)

let pubg : FileSystemObject = .file(name : "PUBG", size : 1000)
let valorant : FileSystemObject = .file(name : "Valorant", size : 1000)
let gamesDirec : FileSystemObject = .directory(name: "Games", directoryContents: [pubg,valorant])
let desktop : FileSystemObject = .directory(name: "Desktop", directoryContents: [gamesDirec])
rootDirec = .directory(name : "root",directoryContents: [file1,file2,desktop])


func printFileStructure (_ fileSystem : FileSystemObject) -> Void
{
    switch fileSystem
    {
    case .file(let name , let size):
        print("-> \(name)")
    case .directory(let name, let contents):
        if contents.isEmpty
        {
            print(name)
        }
        else
        {
            print(name)
            contents.forEach { printFileStructure($0) }
        }
    }
}

printFileStructure(rootDirec)

