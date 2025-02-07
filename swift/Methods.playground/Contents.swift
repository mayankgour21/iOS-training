import Foundation

struct User
{
    var name : String = "User Name"
    var email : String = "user.name@gmail.com"
    
    /* func changeName(_ name : String)->()
    {
        self.name = name
    } */
    
    // NOTE : Structures and enumerations are value types. By default, the properties of a value type can’t be modified from within its instance methods.
    // Reason : When an instance method of a value type is called, (self) is implicitly treated as a constant (let), meaning the instance itself and its properties are immutable within that method.
    // What to do know : use mutating keyword explicitly before the func
    
    mutating func changeName (_ name : String) ->()
    {
        self.name = name
    }
    // mutating the self itself with the new instance of same type using the methods
    mutating func changeTheUser (_ newName : String, _ newEmail : String)
    {
        self = User(name : newName,email : newEmail)
    }
    
}

var user1 = User()

user1.name = "Mayank Gour"

user1.changeName("Nakul Gour")

print(user1.name)


let user2 = user1

// user2.changeName("Mouly Tiwari") // Note that you can’t call a mutating method on a constant of structure type, because its properties can’t be changed, even if they’re variable properties


// mutating the self itself with the new instance of same type using the methods
user1.changeTheUser("Naman Patel","naman.patel@gmail.com")
print(user1)

// same example for the enum

enum TriState
{
    case off,low,high
    
    mutating func toggle()
    {
        switch self
        {
        case .off : self = .high
        case .low : self = .off
        case .high: self = .low
        }
    }
}

var lightSwitch = TriState.high

lightSwitch.toggle()
print(lightSwitch)


struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1


    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }


    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }


    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

var player1 = Player(name: "Alice")

player1.complete(level: 1)

print("Current level for \(player1.playerName): \(player1.tracker.currentLevel)")

print("Highest unlocked level: \(LevelTracker.highestUnlockedLevel)")



