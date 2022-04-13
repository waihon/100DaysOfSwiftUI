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

// Call site

// checkpoint01()
// checkpoint02()
// checkpoint03()
// checkpoint04()
// checkpoint05()
checkpoint06()
