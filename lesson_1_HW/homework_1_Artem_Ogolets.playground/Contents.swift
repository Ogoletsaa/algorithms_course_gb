import Foundation

//MARK: Задача 14.
print("task 14")

//Функция для проверки на автоморфность числа
func isItAutomorphic(insertedNumber: Int) -> Int?{
    
    let intCounter = "\(insertedNumber)".count
    let decimalToInt = NSDecimalNumber(decimal: pow(10, intCounter)).intValue //Квадрат числа и перевод с типа Decimal в Int
    let squareOfNumber = insertedNumber * insertedNumber
    let number = insertedNumber
    
    if squareOfNumber % decimalToInt  == insertedNumber {
        //print ("\(insertedNumber) is automorphic number")
        
        print(number)
        return (number)
        
    } else {
        //print("\(insertedNumber) is not automorphic number")
        return nil
    }
    
}
//isItAutomorphic(insertedNumber: 25)

//Функция для нахождения всех автоморфных чисел до требуемого числа
func automorphFinder(enteredNumber: Int) {
    var i = 0
    
    repeat {
        i += 1
        isItAutomorphic(insertedNumber: i)
        
    } while i  <= enteredNumber
}

automorphFinder(enteredNumber: 629)


//MARK: Задача 13.
print("\ntask 13")

func rand(maxNumber: Int){
    print(Int.random(in: 0..<maxNumber))
}

func myCustomRandomNumber(maxNumber: Int){
    let maxSymbols = "\(maxNumber)".count
    let calender = Calendar.current
    var randomNumber = 0
    
    repeat {
        randomNumber = calender.component(.nanosecond, from: Date()) % NSDecimalNumber(decimal: pow(10, maxSymbols)).intValue
    } while randomNumber >= maxNumber
    
    print(randomNumber)
}

rand(maxNumber: 56)

myCustomRandomNumber(maxNumber: 100)

//MARK: Задача 12.
print("\ntask 12")

func maxOfThreeNums(a: Int, b: Int, c: Int) {
    if a > b && a > c {
        print(a)
    } else if b > a && b > c {
        print(b)
    } else {
        print(c)
    }
}

maxOfThreeNums(a: -3, b: -1, c: -4 )
