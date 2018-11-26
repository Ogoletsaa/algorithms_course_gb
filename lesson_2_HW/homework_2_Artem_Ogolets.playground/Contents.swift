//Урок 2. Асимптотическая сложность алгоритма. Рекурсия.
//Оголец Артем

import UIKit

//1. Реализовать функцию перевода из 10 системы в двоичную используя рекурсию.

//Функция без рекурсии
func convertToBinary(decimal: Int) -> String {
    var y = ""
    var n = ""
    var x = decimal
    
    while x != 0 {
    y = "\(x % 2)"
    n += y
    x /= 2
    }
    return "\(n)"
}

//Функция с рекурсией
func convertToBinaryWithRecursion(decimal: Int) -> String {
    let finalValue = "\(decimal % 2)"

    return decimal != 0 ? finalValue + "\(convertToBinaryWithRecursion(decimal: decimal / 2))" : finalValue
}

print (convertToBinary(decimal: 2444))
print(convertToBinaryWithRecursion(decimal: 2444))

//2. Реализовать функцию возведения числа a в степень b

//Функция без рекурсии
func powerOfInt(baseNum: Int, power: Int) -> String {
    var int = 1
    var powerNumber = baseNum
    
    guard power > 0 else { return "Power number must be a povitive number!"}
    while int != power {
        powerNumber = powerNumber * baseNum
        int += 1
    }
    return "\(powerNumber)"
}

//Функция с рекурсией
func powerOfIntWithRecursion(baseNum: Int, power: Int) -> Int {

    if power == 0 { return 1}
    if power < 0 { return powerOfIntWithRecursion(baseNum: 1 / baseNum, power: -power)}
    if power > 0 { return baseNum * powerOfIntWithRecursion(baseNum: baseNum, power: power - 1)}
    return powerOfIntWithRecursion(baseNum: baseNum * baseNum, power: power / 2)
}

print(powerOfInt(baseNum: 3, power: 4))
print(powerOfIntWithRecursion(baseNum: 3, power: 4))

//3. Исполнитель Калькулятор преобразует целое число, записанное на экране. У исполнителя две команды, каждой команде присвоен номер.

func calcRecursion(value: Int) -> Int{
    
    if value <= 20 {
       return calcRecursion(value: value + 1) + calcRecursion(value: value * 2)
    } else {
        return 1
        }
    }

print(calcRecursion(value: 3))
