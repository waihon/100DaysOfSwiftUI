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
    // var found = false

    if number < 1 || number > 10_000 {
        throw SquareRootErrors.outOfBounds
    }

    // while !found && (squareRoot * squareRoot < number) {
    while squareRoot * squareRoot < number {
        squareRoot += 1

        if squareRoot * squareRoot == number {
            return squareRoot
        }
    }

    throw SquareRootErrors.noRoot
}

// Call site

// checkpoint01()

// checkpoint02()

// checkpoint03()

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
