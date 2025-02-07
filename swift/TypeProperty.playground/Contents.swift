import Foundation

struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                // cap the new audio level to the threshold level
                currentLevel = AudioChannel.thresholdLevel
                // Note : Here the currentLevel Observable property is again setting but it will not call didSet recursively
                // to ensure that the code doesnt loop it , Swift ensures that changes to the property from within the didSet observer do not re-trigger the observer. This is a design choice to ensure predictable and non-recursive behavior for property observers.

            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                // store this as the new overall maximum input level
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}


var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 8
print(AudioChannel.maxInputLevelForAllChannels)

rightChannel.currentLevel = 12
print(AudioChannel.maxInputLevelForAllChannels)



