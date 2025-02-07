import Foundation

struct User
{
    let name: String?
    let age: Int?
}

let newUser : User

newUser = User(name: "Mayank", age: nil)

let newUser2 = User(name : nil, age : nil)

// 1 ) if let //


/*
if let name = newUser.name {  // if the value is not nill
    print("Name of the user : \(name)")
}
else
{
    print("Name of the user is not available") // if the value is nill
}

if let age = newUser.age {
    print("Age of the user : \(age)")
}
else
{
    print("Age of the user is not available")
}
*/

// adding the last name to the user if the user contains a value in name
/*
if var fullname = newUser.name
{
    fullname += " Gour"
    print(fullname)
}
*/

// Drawback :
// print(fullname) error cannot find in the scope because in the if let optional binding the variable or constant is only available inside the scope
// Constants and variables created with optional binding in an if statement are available only within the body of the if statement



// 2) gaurd or Early Exit //


func getUserName (_ user : User)
{
    guard var nameOfUser = user.name else {return}
    
    print("Name of the User : \(nameOfUser)")
    nameOfUser += " Gour"
    print("Full Name of the User : \(nameOfUser)")
}

getUserName(newUser)
getUserName(newUser2)

//If the guard statement’s condition is met, code execution continues after the guard statement’s closing brace.
// Important : Any variables or constants that were assigned values using an optional binding as part of the condition are available for the rest of the code block that the guard statement appears in.
/*
If that condition isn’t met, the code inside the else branch is executed. That branch must transfer control to exit the code block in which the guard statement appears. It can do this with a control transfer statement such as return, break, continue, or throw, or it can call a function or method that doesn’t return, such as fatalError(_:file:line:).
 
 Using a guard statement for requirements improves the readability of your code, compared to doing the same check with an if statement
*/


// 3) Nil coalescing //

// Nil Coalescing Operator : ??
//Use the nil-coalescing operator (??) to supply a default value in case the Optional instance is nil
/*
let defaultName : String = "User Name"

let name1 = newUser.name ?? defaultName
let name2 = newUser2.name ?? defaultName
let ageOfUser2 = newUser2.age ?? 0
print(name1)
print(name2)
print("Age of the User 2 : \(ageOfUser2)")
*/

// Chaining Nil-Coalescing operator
// Example

let imagePaths = ["star": "/glyphs/star.png",
                  "portrait": "/images/content/portrait.jpg",
                  "spacer": "/images/shared/spacer.gif",
                  "checkmyguest" : "/images/shared/checkmyguest.gif"]
/*
let defaultImagePath = "/images/shared/oyoRooms.gif"
let shapePath = imagePaths["traum"] ?? imagePaths["checkmyguest"] ?? defaultImagePath

print(shapePath)
 */

// 4) Force unwrap or Unconditional Unwrapping

// When we are certain that an instance contains a value then we can force unwrap the value using postfix operator (!)

/*
let isImagePathValid = imagePaths["checkmyguest"]!.hasSuffix(".gif")

print(isImagePathValid)
*/

// Note : Unconditionally unwrapping a nil instance with ! triggers a runtime error.
// For example
/*
 let isImageValid = imagePaths["traum"]!.hasSuffix(".gif")
 
 print(isImageValid)
 */


