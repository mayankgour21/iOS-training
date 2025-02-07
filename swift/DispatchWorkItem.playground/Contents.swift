import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let concurrentQueue = DispatchQueue(label: "com.queue.Concurrent", attributes: .concurrent)

func performAsyncTaskInConcurrentQueue() {
    var task:DispatchWorkItem?
    
    task = DispatchWorkItem {
        for i in 1...5 {
            if Thread.isMainThread {
                print("task running in main thread")
            } else{
                print("task running in other thread")
            }
            
            if (task?.isCancelled)! {
                break
            }
            
            let imageURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/07/Huge_ball_at_Vilnius_center.jpg")!
            let _ = try! Data(contentsOf: imageURL)
            print("\(i) finished downloading")
        }
        task = nil
    }
    
    /*
     There are two ways to execute task on queue. Either by providing task to execute parameter or
     within async block call perform() on task. perform() executes task on current queue.
     */
     concurrentQueue.async(execute: task!)
    
//    concurrentQueue.async {
//        task?.wait(wallTimeout: .now() + .seconds(1))
////         task?.wait(timeout: .now() + .seconds(2))
//        task?.perform()
//    }
    concurrentQueue.asyncAfter(deadline: .now() + .seconds(3), execute: {
        task?.cancel()
    })
    
    task?.notify(queue: concurrentQueue) {
        print("\n############")
        print("############")
        print("###### Work Item Completed")
    }
}

performAsyncTaskInConcurrentQueue()

print("###### Download all images asynchronously and notify on completion ######")
print("############")
print("############\n")
