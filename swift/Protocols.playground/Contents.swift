import Foundation

//protocol Togglable {
//    mutating func toggle()
//}
//
//enum OnOffSwitch: Togglable {
//    case off, on
//     mutating func toggle() {
//        switch self {
//        case .off:
//            self = .on
//        case .on:
//            self = .off
//        }
//    }
//}
//var lightSwitch = OnOffSwitch.off
//lightSwitch.toggle()


protocol Named
{
    var name: String { get }
}

protocol Aged
{
    var age: Int { get }
}

struct Person : Named,Aged
{
    var name: String
    var age: Int
}

class Human : Named,Aged
{
    var name: String
    var age: Int
    var occupation: String
    
    init(name: String, age: Int, occupation: String)
    {
        self.name = name
        self.age = age
        self.occupation = occupation
    }
}

func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
}

//wishHappyBirthday(to: Person(name: "Alice", age: 25))
wishHappyBirthday(to: Human(name: "Mayank", age: 21, occupation: "Software Developer"))

