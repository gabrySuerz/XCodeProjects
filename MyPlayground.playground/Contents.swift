//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print(str)

var numero = 18.0

let label = "Stringa"
let larghezza = 90
let margin = 10
let padding = 20
let larghezzaLabel = label + String(larghezza)

let altraLabel = "Larghezza label: \(larghezza + margin * 2 + padding * 2) cm totali"

var myArray = ["A", "B", "C", "D"]
/// Svuota array 
// myArray = []
var mySecondArray = [Int](repeating: 2, count: 5)
mySecondArray.append(1)
mySecondArray.append(1000000000000)

var myDictionary = [String: Int]()
myDictionary = [:]


/*func calcolaStat(punteggi: ([Int])->(minimo: Int, massimo: Int, somma: Int) {
    let min = punteggi.max()
    let max = punteggi.min()
    //let sum =
}*/

print ("-------------")

let individualScore = [75, 43, 103, 87, 12]
for score in individualScore {
    print (score)
}

print ("-------------")

func returnFifteen () -> Int {
    var y = 10;
    func add() {
        y += 5
    }
    add()
    return y
}
print (returnFifteen())

print ("-------------")

func returnFirstElement() -> (([Int]) -> Int) {
    func addOne(number: [Int]) -> Int {
        return number.first!
    }
    return addOne
}

var firstElementReturned = returnFirstElement()
print (firstElementReturned([7, 8, 9, 10]))

print ("-------------")

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

func isOdd(number: Int) -> Bool {
    let testNumber = number % 2
    return testNumber == 1
}

let numbersToTest = [21, 9, 12]

print (hasAnyMatches(list: numbersToTest, condition: lessThanTen))
print (hasAnyMatches(list: numbersToTest, condition: isOdd))

print ("-------------")

print (numbersToTest.map({
    (number: Int) -> Int in
    return 3 * number
}))

print (numbersToTest.map({
    number in 3 * number }).sorted{$0 > $1})
print (numbersToTest.map({ $0 * 3 }).sorted{$0 > $1})

print ("-------------")

class Shape {
    var numberOfSides = 0
    let myCostant: String
    
    func simpleDescription() -> String {
        return "Shape sides: \(numberOfSides)"
    }
    
    init(sides: Int,  name: String) {
        self.numberOfSides = sides
        self.myCostant = name
    }
    
    deinit {
        numberOfSides = 0
    }
    
    func calculatePerimeter(sides: [Int])->Int{
        var perimeter = 0
        for side in sides {
            perimeter += side
        }
        return perimeter
    }
}

var myShape = Shape(sides: 4, name: "Trapezio")
print(myShape.simpleDescription())
print(myShape.calculatePerimeter(sides: [12,24,34,18]))

print ("-------------")

class Square: Shape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(sides: 4, name: name)
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "Square side length: \(sideLength)"
    }
}

print ("-------------")

class TriangoloEquilatero: Shape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(sides: 3, name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return sideLength * 3.0
        }
        
        set (value){
            sideLength = value / 3.0
        }
    }
}

print ("-------------")

class TriangoloQuadrato {
    var square: Square {
        willSet{
            triangle.sideLength = newValue.sideLength
        }
    }
    
    var triangle: TriangoloEquilatero {
        willSet{
            square.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = TriangoloEquilatero(sideLength: size, name: name)
    }
}

var tq = TriangoloQuadrato(size: 10, name: "scratatatun")
print(tq.square.area())
print(tq.square.sideLength)
tq.square.sideLength = 80
print(tq.triangle.sideLength)

print ("-------------")

enum Rank: Int {
    case primo = 1
    case secondo, terzo, quarto, quinto, sesto, settimo, ottavo, nono, decimo, fante, donna, re;
    func desc()->String{
        switch self {
        case .fante:
            return "Jack"
        case .donna:
            return "Queen"
        case .re:
                return "King"
        default:
            return String(self.rawValue)
        }
    }
}

let posizioneDiArrivo = Rank.primo
let posizioneDiArrivoNum = posizioneDiArrivo.rawValue
print("\(posizioneDiArrivo.desc()) \(posizioneDiArrivoNum)")

print ("-------------")

enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:00 pm")
let failure = ServerResponse.failure("Black Hole Sun")

switch failure {
case let .result(alba, tramonto):
    print("L'alba sorge alle \(alba) e tramonta alle \(tramonto)")
case let .failure(death):
    print(death)
}

print ("-------------")

enum Suit {
    case picche, cuori, quadri, fiori
    
    func desc() -> String{
        switch self {
        case .picche:
            return "Picche"
        case .cuori:
            return "Hearts"
        case .quadri:
            return "Diamonds"
        case .fiori:
            return "Clubs"
        }
    }
}

struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        return "The \(rank.desc()) of \(suit.desc())"
    }
}

print(Card(rank: Rank.re, suit: Suit.cuori).simpleDescription())

var kingofDiamondsCard = Card(rank: Rank.re, suit: Suit.quadri)
var kingofDiamonds = kingofDiamondsCard
kingofDiamonds.suit = Suit.fiori
print(kingofDiamonds.simpleDescription())

print ("-------------")



