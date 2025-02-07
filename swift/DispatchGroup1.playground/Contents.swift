import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//let concurrentQueue = DispatchQueue(label: "com.queue.Concurrent", attributes: .concurrent)
//
//func performAsyncTaskIntoConcurrentQueue(with completion: @escaping () -> ()) {
//    concurrentQueue.async {
//        for i in 1...5 {
//            if Thread.isMainThread {
//                print("\(i) task running in main thread")
//            } else{
//                print("\(i) task running in other thread")
//            }
//            concurrentQueue.async {
//                let imageURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/07/Huge_ball_at_Vilnius_center.jpg")!
//                let _ = try! Data(contentsOf: imageURL)
//                print("\(i) finished downloading")
//            }
//        }
//        
//        DispatchQueue.main.async {
//            completion()
//        }
//    }
//}
//
//print("###### Download all images asynchronously and notify on completion ######")
//print("############")
//print("############\n")
//
//performAsyncTaskIntoConcurrentQueue(with: {
//    print("\n############")
//    print("############")
//    print("###### All images are downloaded")
//})

let concurrentQueue = DispatchQueue(label: "com.queue.Concurrent", attributes: .concurrent)

func performAsyncTaskIntoConcurrentQueue(with completion: @escaping () -> ()) {
        let group = DispatchGroup()
        for i in 1...5 {
            group.enter()
            concurrentQueue.async {
                let imageURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/07/Huge_ball_at_Vilnius_center.jpg")!
                let _ = try! Data(contentsOf: imageURL)
                print("###### Image \(i) Downloaded ######")
                group.leave()
            }
        }
        
        /* Either write below code or group.notify() to execute completion block
         group.wait()
         DispatchQueue.main.async {
         completion()
         }
         */
        
        group.notify(queue: DispatchQueue.main) {
            completion()
        }
}

print("###### Download all images asynchronously and notify on completion ######")
print("############")
print("############\n")

performAsyncTaskIntoConcurrentQueue(with: {
    print("\n############")
    print("############")
    print("###### All images are downloaded")
})

