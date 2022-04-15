import Foundation

func checkpoint01() {
    let celsius = 36.9
    let fahrenheit = celsius * 9.0 / 5.0 + 32.0
    print("Celsius: \(celsius)°C")
    print("Fahrenheit: \(fahrenheit)°F")
}

func checkpoint02() {
    let array = ["one", "two", "three", "four", "three", "two", "one"]
    let set = Set(array)
    print(array.count)
    print(set.count)
}

func checkpoint03() {
    for i in 1...100 {
        if i % 3 == 0 && i % 5 == 0 {
            print("FizzBuzz")
        } else if i % 3 == 0 {
            print("Fizz")
        } else if i % 5 == 0 {
            print("Buzz")
        } else {
            print(i)
        }
    }
}

// Checkpoint 4
enum SquareRootErrors: Error {
    case outOfBounds
    case noRoot
}

func intSquareRoot(for number: Int) throws -> Int {
    var squareRoot = 0

    if number < 1 || number > 10_000 {
        throw SquareRootErrors.outOfBounds
    }
    
    while squareRoot * squareRoot < number {
        squareRoot += 1

        if squareRoot * squareRoot == number {
            return squareRoot
        }
    }

    throw SquareRootErrors.noRoot
}

func checkpoint04() {
    for i in 0...25 {
        do {
            try print(intSquareRoot(for: i))
        } catch SquareRootErrors.outOfBounds {
            print("The input must be between 1 and 1,000 both inclusive.")    
        } catch SquareRootErrors.noRoot {
            print("There is no square root for \(i).")
        } catch {
            print("There was an error.")
        }
    }
}

// Checkpoint 5
func checkpoint05() {
    let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

    let processedNumbers = luckyNumbers.filter {
        !$0.isMultiple(of: 2)
    }.sorted {
        $0 < $1
    }.map {
        "\($0) is a lucky number" 
    }
    
    for number in processedNumbers {
        print(number)
    }
}

// Checkpoint 6
struct Car {
    static let minGear = 1
    static let maxGear = 10

    let model: String
    let seats: Int
    private(set) var currentGear = 0

    init(model: String, seats: Int) {
        self.model = model
        self.seats = seats
    }

    mutating func increaseGear() {
        if currentGear < Self.maxGear {
            currentGear += 1
        }
    }

    mutating func decreaseGear() {
        if currentGear > Self.minGear {
            currentGear -= 1
        }
    }
}

func checkpoint06() {
    var forester = Car(model: "Subaru Forester", seats: 5)
    forester.increaseGear()
    forester.increaseGear()
    forester.increaseGear()
    forester.increaseGear()
    forester.decreaseGear()
    print(forester.model)
    print(forester.seats)
    print(forester.currentGear)
}

// Checkpoint 7
class Animal {
    var legs: Int    

    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    init() {
        super.init(legs: 4)
    }

    func speak() {
        print("Bark!")
    } 
}

class Corgi: Dog {
    override func speak() {
        print("Coorr!")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Poood!")
    }
}

class Cat: Animal {
    var isTame: Bool

    init(isTame: Bool) {
        self.isTame = isTame
        super.init(legs: 4)
    }
    
    func speak() {
        print("Meow!")
    }
}

class Persian: Cat {
    override func speak() {
        print("Perss!")
    }
}

class Lion: Cat {
    override func speak() {
       print("Roar!") 
    }
}

func checkpoint07() {
    let dog = Dog()
    print(dog.legs)
    dog.speak()

    let corgi = Corgi()
    corgi.speak();

    let poodle = Poodle()
    poodle.speak()

    let cat = Cat(isTame: true)
    print(cat.legs)
    print(cat.isTame)
    cat.speak()
    
    let persian = Persian(isTame: true)
    persian.speak()

    let lion = Lion(isTame: false)
    lion.speak()
}

// Checkpoint 8
protocol Building {
    var rooms: Int { get set }
    var cost: Int { get set }
    var agentName: String { get set }

    func printSalesSummary()
}

extension Building {
    func printSalesSummary() {
        print("The building has \(rooms) rooms, costs $\(cost), and sold by \(agentName).")
    }
}

struct House: Building {
    var rooms: Int
    var cost: Int
    var agentName: String
    
    func printSalesSummary() {
        print("The house has \(rooms) rooms, costs $\(cost), and sold by \(agentName).")
    }
}

struct Office: Building {
    var rooms: Int
    var cost: Int
    var agentName: String
    
    func printSalesSummary() {
        print("The office building has \(rooms) rooms, costs $\(cost), and sold by \(agentName).")
    }
}

func checkpoint08() {
    let house = House(rooms: 4, cost: 500_000, agentName: "Joe Doe") 
    house.printSalesSummary()

    let office = Office(rooms: 8, cost: 3_250_000, agentName: "Mary Jane")
    office.printSalesSummary()
}

// Checkpoint 9
func randomElement(of intArray: [Int]?) -> Int {
    intArray?.randomElement() ?? Int.random(in: 1...100)
}

func checkpoint09() {
    print(randomElement(of: [101, 102, 103, 104, 105, 106, 107, 108, 109, 110]))
    print(randomElement(of: nil))
}

// Call site

// checkpoint01()
// checkpoint02()
// checkpoint03()
// checkpoint04()
// checkpoint05()
// checkpoint06()
// checkpoint07()
// checkpoint08()
checkpoint09()
