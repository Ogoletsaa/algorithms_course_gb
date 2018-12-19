//Урок 8. Сложные сортировки
//Оголец Артем
  
import UIKit
import PlaygroundSupport

// Задание 1. Сортировка подсчетом.


// hundredArray, tenThousandsArray находятся в Sources -> Arrays.swift
print(tenThousandsArray.count)
//millionArray

var millionArray = [Int]()

var i = 1
while i <= 100 {
    millionArray += tenThousandsArray
    i = i + 1
}
print(millionArray.count)

func countingSort(array: [Int], maxValue: Int) -> [Int] {
    
    // array of 0's at indices 0...maxValue
    var numCounts = Array(repeating: 0, count: maxValue + 1)
    
    // populate numCounts
    for num in array {
        numCounts[num] += 1
    }
    
    // populate the final sorted array
    var sortedArray = Array(repeating: 0, count: array.count)
    var currentSortedIndex = 0
    
    // for each num in numCounts
    for (num, count) in numCounts.enumerated() {
        
        // for the number of times the item occurs
        for _ in 0..<count {

            // add it to the sorted array
            sortedArray[currentSortedIndex] = num
            currentSortedIndex += 1
        }
    }
    
    return sortedArray
}

// Задание 2. Быстрая Сортировка.

func quickSort<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
    let pivot = a[low]
    var i = low - 1
    var j = high + 1
    
    while true {
        repeat { j -= 1 } while a[j] > pivot
        repeat { i += 1 } while a[i] < pivot
        
        if i < j {
            a.swapAt(i, j)
        } else {
            return j
        }
    }
}

//Bubble sort
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
    return unsortedArray
}

//Sorting time counter
func printTimeElapsedWhenRunningCode(title:String, operation:()->()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    print("Time elapsed for \(title): \(timeElapsed)s")
}

//100
printTimeElapsedWhenRunningCode(title: "hundredArray countingSort()") {
    countingSort(array: hundredArray, maxValue: 9)
}

printTimeElapsedWhenRunningCode(title: "hundredArray quickSort()") {
    quickSort(&hundredArray, low: 0, high: hundredArray.count - 1)
}

printTimeElapsedWhenRunningCode(title: "hundredArray bubbleSort()") {
    bubbleSortAdvanced(unsortedArray: &hundredArray)
}

//10000
printTimeElapsedWhenRunningCode(title: "tenThousandsArray countingSort()") {
    countingSort(array: tenThousandsArray, maxValue: 9)
}

printTimeElapsedWhenRunningCode(title: "tenThousandsArray quickSort()") {
    quickSort(&tenThousandsArray, low: 0, high: tenThousandsArray.count - 1)
}

printTimeElapsedWhenRunningCode(title: "tenThousandsArray bubbleSort()") {
    bubbleSortAdvanced(unsortedArray: &tenThousandsArray)
}

//1000000
printTimeElapsedWhenRunningCode(title: "millionArray countingSort()") {
    countingSort(array: hundredArray, maxValue: 9)
}

printTimeElapsedWhenRunningCode(title: "millionArray quickSort()") {
    quickSort(&millionArray, low: 0, high: millionArray.count - 1)
}

printTimeElapsedWhenRunningCode(title: "millionArray bubbleSort()") {
    bubbleSortAdvanced(unsortedArray: &millionArray)
}
