//Урок 3. Поиск в массиве. Простые сортировки.
//Оголец Артем

import UIKit

//1. Попробовать оптимизировать пузырьковую сортировку.

//var arrayOne = [4,19,3,2,1,12,6,16,8]
var arrayOne = [4,19,3,2,1,12,6,16,8]
var arrayTwo = [4,19,3,2,1,12,6,16,8]
var arrayFour = [4,19,3,2,1,12,6,16,8]

func bubbleSort (unsortedArray: inout [Int]) -> [Int] {
    var counter = 0
    
    for i in 0..<unsortedArray.count {
        for j in 1..<unsortedArray.count{
            if unsortedArray[j] < unsortedArray[j - 1] {
                let largerValue = unsortedArray[j - 1]
                print(unsortedArray)
                unsortedArray[j - 1] = unsortedArray[j]
                unsortedArray[j] = largerValue
                counter += 1
                
            }
        }
    }
    print(unsortedArray)
    print("\nNuber of itterations is : \(counter)")
    return unsortedArray
}

func shakerSort (unsortedArray: inout [Int]) -> [Int]{
    var counter = 0
    
    for i in 0..<unsortedArray.count {
        for j in 1..<unsortedArray.count {
            if unsortedArray[j] < unsortedArray[j - 1] {
                let largerValue = unsortedArray[j - 1]
                unsortedArray[j - 1] = unsortedArray[j]
                unsortedArray[j] = largerValue
                counter += 1
            }
        }
    }
    print(unsortedArray)
    print("\nNuber of itterations is : \(counter)")
    return unsortedArray
}

func bubbleSortAdvanced (unsortedArray: inout [Int]) -> [Int] {
    var isSwapped = true
    var counter = 0
    
    while isSwapped == true {
        isSwapped = false
        
        for index in 0 ..< unsortedArray.count - 1{
            if unsortedArray[index] > unsortedArray[index + 1] {
                unsortedArray.swapAt(index, index + 1)
                counter += 1
                isSwapped = true
            }
        }
    }
    print("\nNuber of itterations is : \(counter)")
    return unsortedArray
}

func timeElapsed(operation: Any) -> Double{
    let startTime = CFAbsoluteTimeGetCurrent()
    operation
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    return Double(timeElapsed)
}

print(bubbleSort(unsortedArray: &arrayOne))
print(shakerSort(unsortedArray: &arrayOne))
print(bubbleSortAdvanced(unsortedArray: &arrayTwo))

//timeElapsed(operation: bubbleSort(unsortedArray: &arrayOne))
//timeElapsed(operation: bubbleSortAdvanced(unsortedArray: &arrayTwo))

print("\n")

//3. Реализовать бинарный алгоритм поиска в виде функции

var arrayThree = [1,2,4,6,8,9,10,13,14,16,17,19,29,21,24,25,27,29,30,31]

func binarySearch(searchValue: Int, array: [Int]) -> Bool {
    
    let minIndex = 0
    let maxIndex = array.count - 1
    let midIndex = maxIndex / 2
    let midValue = array[midIndex]
    
    print("[\(array[minIndex]),\(array[maxIndex])]")
    
    if searchValue < array[minIndex] || searchValue > array[maxIndex] {
        print ("\(searchValue) is not in array")
        return false
    }
    
    if searchValue > midValue {
        let divide = Array(array[midIndex + 1...maxIndex])
        return binarySearch(searchValue: searchValue, array: divide)
    }
    
    if searchValue < midValue {
        let divide = Array(array[minIndex...midIndex - 1])
        return binarySearch(searchValue: searchValue, array: divide)
    }
    
    if searchValue == midValue {
        print("\(searchValue) is in the array")
        return true
    }
    return false
}

binarySearch(searchValue: 9, array: arrayThree)


