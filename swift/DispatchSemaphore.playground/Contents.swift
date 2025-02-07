import Foundation

import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

var value : Int = 2

let semaphore = DispatchSemaphore(value : 1)

let concurrentQueue = DispatchQueue(label: "queue",attributes: .concurrent)

for j in 0...4
{
    concurrentQueue.async
    {
        print("\(j) thread is waiting")
        semaphore.wait()
        print("\(j) thread wait finished")
        value = j
        print("Value : \(value)")
        print("\(j) thread is done")
        semaphore.signal()
        
    }
}
