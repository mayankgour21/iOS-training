import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//DispatchQueue.main.async {
//    print(Thread.isMainThread ? "Executing on main thread" : "Not executing on main thread")
//}
//
//
//DispatchQueue.global().async {
//    print(Thread.isMainThread ? "Executing on main thread" : "Executing on global concurrent queue")
//}


//DispatchQueue.global(qos: .background).async
//{
//    for i in 11...21
//    {
//        print(i)
//    }
//}
//
//DispatchQueue.global(qos: .userInteractive).async
//{
//    for i in 0...10
//    {
//        print(i)
//    }
//}

//let customQueue : DispatchQueue = DispatchQueue(
//label: <#T##String#>,
//qos: <#T##DispatchQoS#>,
//attributes: <#T##DispatchQueue.Attributes#>,
//autoreleaseFrequency: <#T##DispatchQueue.AutoreleaseFrequency#>,
//target: <#T##DispatchQueue?#>)


//let a = DispatchQueue(label : "A")
//let b = DispatchQueue(label : "B", attributes: .concurrent,target: a)
//
//a.async
//{
//    for i in 0...5
//    {
//        print(i)
//    }
//}
//a.async
//{
//    for i in 6...10
//    {
//        print(i)
//    }
//}
//b.async
//{
//    for i in 11...15
//    {
//        print(i)
//    }
//}
//b.async
//{
//    for i in 16...20
//    {
//        print(i)
//    }
//}

import Foundation

var value: Int = 2

DispatchQueue.main.async {
    for i in 0...3 {
        value = i
        print("\(value) ✴️")
    }
}

for i in 4...6 {
    value = i
    print("\(value) ✡️")
}

DispatchQueue.main.async {
    value = 9
    print(value)
}

