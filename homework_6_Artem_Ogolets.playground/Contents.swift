//Урок 6. Деревья
//Оголец Артем
  
import UIKit
import PlaygroundSupport

// Задача 1. Реализовать простейшую хэш-функцию. На вход функции подается строка, на выходе сумма кодов символов.
print("Task 1")
func hashFunction(value: String) -> Int {
    
    
    return value.count
}
print(hashFunction(value: "user_ID"))


let charactersID = [1115,3348,2262,2273,1124,1152,2251,3314,3341,1166]

// Функция, выдающая массив с двумя последними цифрами  ID работников
func lastTwoEmployeeId() -> String {
    var twoNumsArray = [Int]()
    
    for i in 0...charactersID.count - 1 {
        let lastTwoNums = charactersID[i] % 100
        twoNumsArray.append(lastTwoNums)
    }
    
    twoNumsArray.sort()
    
    return "\(twoNumsArray)"
}

print(lastTwoEmployeeId())


// Задача 2. Переписать программу, реализующее двоичное дерево поиска.
print("\nTask 2")
// Мое дерево
//         18
//      /      \
//    15       20
//   /   \    /   \
//  13   16  19    24

class Tree {
    let value: Int
    var leftChild: Tree?
    var rightChild: Tree?

    init (value: Int, leftChild: Tree?, rightChild: Tree?) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

// 3rd lvl
let thirteenRootNode = Tree(value: 13, leftChild: nil, rightChild: nil)
let sixteenRootNode = Tree(value: 16, leftChild: nil, rightChild: nil)
let seventeenRootNode = Tree(value: 19, leftChild: nil, rightChild: nil)
let twentyfourRootNode = Tree(value: 24, leftChild: nil, rightChild: nil)

// 2nd lvl
let fifteenRootNode = Tree(value: 15, leftChild: thirteenRootNode, rightChild: sixteenRootNode)
let nineteenRootNode = Tree(value: 20, leftChild: seventeenRootNode, rightChild: twentyfourRootNode)

// 1nd lvl
let eighteenRootNode = Tree(value: 18, leftChild: fifteenRootNode, rightChild: nineteenRootNode)

// Search functions
func inTheTreeSearchBool(searchValue: Int, node: Tree?) -> Bool {
    
    if node == nil {
        return false
    }
    
    if node?.value == searchValue {
        return true
    } else {
        return inTheTreeSearchBool(searchValue: searchValue, node: node?.leftChild) || inTheTreeSearchBool(searchValue: searchValue, node: node?.rightChild)
    }
}

func inTheTreeSearchModified(searchValue: Int, node: Tree?) -> String {
    
    if node == nil {
        return "Значение \(searchValue) не найдено в дереве!"
    }
    
    if searchValue == eighteenRootNode.value {
        return "Значение \(searchValue) является корнем дерева!"
    }

    if node?.value == searchValue {
        return "Значение \(searchValue) находится в дереве!"

    } else if node!.value > searchValue {
        return inTheTreeSearchModified(searchValue: searchValue, node: node?.leftChild)

    } else if node!.value < searchValue{
        return inTheTreeSearchModified(searchValue: searchValue, node: node?.rightChild)
    } else {
        return "Искомое значение не находится в дереве!"
    }
}




inTheTreeSearchBool(searchValue: 24, node: eighteenRootNode) // Функция выполняет поиск за 6 итерации
inTheTreeSearchModified(searchValue: 24, node: eighteenRootNode) // Функция выполняет поиск числа за 3 итерации

print(inTheTreeSearchModified(searchValue: 18, node: eighteenRootNode))
print(inTheTreeSearchModified(searchValue: 15, node: eighteenRootNode))
print(inTheTreeSearchModified(searchValue: 14, node: eighteenRootNode))
