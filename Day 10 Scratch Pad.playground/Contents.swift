import UIKit

// ================================= How to create your own Struct ============================
// There is a standard in swift that the struct name must start with a capital letter
// All variables inside are camelCase
struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary(){
        print("\(title) (\(year)) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)


//print(red.title)
//print(wings.artist)
//
//red.printSummary()
//wings.printSummary()



struct Employee {
    // These are called properties of the struct
    let name: String
    
    // This five the variable a default value unless overridden when a new instance of employee is called
    var vacationRemaining = 14
    
    // When trying to write to the internal data of a struct with a function you have to use this word mutating to make this happen
    // This function is called a method
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining")
        }
    }
}

// Archer is an instance of this struct
//           This section is the initializer of the struct
//var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
//archer.takeVacation(days: 4)
//print(archer.vacationRemaining)






// ======================================================== How to compute property valuess dynamically =====================================
struct Employee2 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    // This is a computed property. You can't write to it as it is now.
    // To write to this you have to provide it a getter and a setter
    var vacationRemaining: Int {
        get{
            vacationAllocated - vacationTaken
        }
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
    
    
}

//var goofy = Employee2(name: "Goofy", vacationAllocated: 14)
//goofy.vacationTaken += 4
//goofy.vacationRemaining = 5
//print(goofy.vacationAllocated)



// ============================================ How to take action when a property changes =====================================
// property observers
struct Game {
    var score = 0 {
        // Each time the property is changed, this small piece of code runs
        didSet {
            print("Score is now \(score)")
        }
    }


}
//
//var game = Game()
//game.score += 10
//game.score -= 3
//game.score += 1


struct App {
    var contacts = [String]() {
        // The newValue variable is automatic in Swift for the willSet method
        willSet {
            print("Current value is \(contacts)")
            print("New value will be: \(newValue)")
        }
        
        // The oldValue is automatic in Swift for the didSet method
        // This is used more frequently than willSet
        didSet {
            print("There are now \(contacts.count) contacts")
            print("Old value was \(oldValue)")
        }
    }
}


var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")


// ============================================= How to create cusom initializers ==========================================
struct Player {
    let name: String
    let number : Int
    
    // When writing a custom initializer, make sure to intialize all parameters
    // The default initializer that swift usses when you decalre a new instance of your stuct will go away when
    // you create a custom initializer.
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}


let player = Player(name: "Megan R")
print(player.number)
