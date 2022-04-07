import Foundation

func checkpoint01() {
    let celsius = 36.9
    let fahrenheit = celsius * 9.0 / 5.0 + 32.0
    print("Celsius: \(celsius)°C")
    print("Fahrenheit: \(fahrenheit)°F")
}

checkpoint01()

func checkpoint02() {
    let array = ["one", "two", "three", "four", "three", "two", "one"]
    let set = Set(array)
    print(array.count)
    print(set.count)
}

checkpoint02()

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

checkpoint03()
