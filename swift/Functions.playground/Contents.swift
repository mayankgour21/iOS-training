import Foundation

func noArgNoReturn()
{
    "I dont have any arguments and no return"
}
noArgNoReturn()

 func addValue (num : Int)
{
    let newValue = num + 2
}

addValue(num : 2)

func addValueAndReturn (num : Int) -> Int
{
    num + 4
}

addValueAndReturn(num: 5)

func customAdd(num1 : Int, num2 : Int) -> Int{
    num1 + num2
}

// Note //
// Function called with external variable names i.e num1 : 10 , num2 : 12
//customAdd(10,12)  this gives error of missing argumnet label
customAdd(num1: 10, num2: 12)

let customAdded = customAdd(num1: 22, num2: 3)

// Function to be called without exteral variable names
// use _ before the label of the argument while defining the function
func customSubtract (_ num1 : Int, _ num2 : Int) -> Int
{
    num1 - num2
}

let customSubtracted = customSubtract(10, 5)

// let customSubtracted2 = customSubtract(num1 : 20,num2 : 5) // Also cannot use extra label naming while calling the function
/*
 func doSomething(_ arg1 : String, arg2 : Int) -> String
 {
 let const1 = arg1 + String(arg2)
 return const1
 }
 
 doSomething("Hello", arg2 : 11)
 */

// Variadic Parameters
// A variadic parameter accepts zero or more values of a specified type.
/*
func calAvg (_ numbers : Double...) -> Double
{
    print("Going to calculate average")
    var sum : Double = 0
    
    for num in numbers
    {
        sum += num
    }
    
    let avg = sum/Double(numbers.count)
    print("\(avg) Average calculated !")
    return avg
    
}

let avg = calAvg(2,4.5,3,6.7)

// Functions with multiple variadic parameters

func printAllParameters (_ numbers : Int..., names : String...)
{
    print("Printing first parameter")
    for num in numbers
    {
        print(num)
    }
    print("Printing second parameter")
    for naam in names
    {
        print(naam)
    }
}

printAllParameters(1,2,4,69,names : "Mayank","Mouly","Naman")
*/

// Lets try to modify the parameter inside the functions

func modifyParameter(_ num : inout Int) -> Int
{
    num = num + 5
    return num
}
var number = 10
print("Number before modification : \(number)")
modifyParameter(&number)
print("Number after modification : \(number)")


// swap two numbers
// Use of In-Out Parameters

var num1 = 55
var num2 = 66

func swapTwoNumber (_ num1 : inout Int, _ num2 : inout Int)
{
    var temp : Int = num1
    num1 = num2
    num2 = temp
}

print("Before swapping : Num1 \(num1) , Num2 \(num2)")
swapTwoNumber(&num1, &num2)
print("After swapping : Num1 \(num1) , Num2 \(num2)")


// Using Function Types

func addTwoNumber (_ num1 : Int, _ num2 : Int) -> Int  // function type = (Int,Int)->Int
{
    return num1 + num2
}

func multiplyTwoNumber (_ num1 : Int, _ num2 : Int) -> Int // function typw = (Int,Int)->Int
{
    return num1*num2
}

func printHelloWorld() { // function type = ()->Void
    print("hello, world")
}

/*
var mathFunctions : (Int,Int) -> Int = addTwoNumber

print("Result : \(mathFunctions(2,3))")

mathFunctions = multiplyTwoNumber

print("Result : \(mathFunctions(2,3))")
*/

// Function Type as Parameter Types

func printMathResult(_ mathFunctions : (Int,Int)->Int,_ num1 : Int,_ num2 : Int)
{
    print("Result : \(mathFunctions(num1,num2))")
}

printMathResult(addTwoNumber,4,5)
printMathResult(multiplyTwoNumber, 4 , 5)

// Function Type as Return Types

func stepBackward (_ input : Int) -> Int
{
    return input - 1
}

func stepForward (_ input : Int) -> Int
{
    return input + 1
}

func chooseStepFunction(backwardd: Bool) -> (Int) -> Int
{
    if backwardd
    {
        return stepBackward
    }
    
    return stepForward
}

var currVal = 5

var moveTowardZero = chooseStepFunction(backwardd: currVal > 0)
print(currVal)
while (currVal != 0)
{
    currVal = moveTowardZero(currVal)
    print(currVal)
}
