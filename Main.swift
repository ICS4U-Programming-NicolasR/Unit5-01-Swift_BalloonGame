public class Spike {
    var xPosition: Int

    public static let Y_POSITION = 80

    // Constructor
    public init(xPosition: Int) {
        self.xPosition = xPosition
    }

    // check if the balloon is popped if so write to the variable
    public func popBalloon(_ balloon: Balloon) {
        if xPosition == balloon.xPosition && Spike.Y_POSITION == balloon.yPosition {
            balloon.isPopped = true
        }
    }

    // move the spike
    public func moveSpikeHorizontally(_ spaces: Int) {
        xPosition += spaces
    }
}

public class Balloon {
    // initialize the variables
    var xPosition: Int
    var yPosition: Int
    var isPopped: Bool
    var id: Int

    // initialize a new balloon
    public init(xPosition: Int, yPosition: Int, id: Int) {
        self.xPosition = xPosition
        self.yPosition = yPosition
        self.isPopped = false
        self.id = id
    }

    // move the balloon
    public func moveBalloon(xSpaces: Int, ySpaces: Int) {
        self.xPosition += xSpaces
        self.yPosition += ySpaces
    }
}


class Main {
    static func main() {
        // create two balloons
        let balloon1 = Balloon(xPosition: 75, yPosition: 49, id: 1)
        let balloon2 = Balloon(xPosition: 30, yPosition: 110, id: 2)
        // create a spike
        let spike1 = Spike(xPosition: 51)

        // print the positions before and after moving the balloons
        print("Balloon1: \(balloon1.xPosition),\(balloon1.yPosition)")
        print("Balloon2: \(balloon2.xPosition),\(balloon2.yPosition)")

        balloon1.moveBalloon(xSpaces: 20, ySpaces: -49)
        spike1.popBalloon(balloon1)

        print("Moved!")
        print("Balloon1: \(balloon1.xPosition),\(balloon1.yPosition)")
        print("Balloon2: \(balloon2.xPosition),\(balloon2.yPosition)")

        print("Balloon1: \(balloon1.xPosition),\(balloon1.yPosition)")
        print("Balloon2: \(balloon2.xPosition),\(balloon2.yPosition)")

        balloon2.moveBalloon(xSpaces: 21, ySpaces: -30)
        spike1.popBalloon(balloon2)

        print("Moved!")
        print("Balloon1: \(balloon1.xPosition),\(balloon1.yPosition)")
        print("Balloon2: \(balloon2.xPosition),\(balloon2.yPosition)")

        // move the spike and display before and after position
        print("\(spike1.xPosition),\(Spike.Y_POSITION)")
        spike1.moveSpikeHorizontally(40)
        print("Moved!")
        spike1.popBalloon(balloon1)
        spike1.popBalloon(balloon2)
        // display if a balloon is popped.
        print("\(spike1.xPosition),\(Spike.Y_POSITION)")
        if balloon1.isPopped || balloon2.isPopped {
            print("Popped!")
        }
    }
}

Main.main()
