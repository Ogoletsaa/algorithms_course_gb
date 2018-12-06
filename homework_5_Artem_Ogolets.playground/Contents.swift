//Урок 5. Динамические структуры данных
//Оголец Артем

//Задача 2. Является ли введенная скобочная последовательность правильной
print("Task 3")
func isValidBrackest(brackets: String) -> Bool {
    if brackets.count == 0 { return true }
        
    var stack: [Character] = [Character]()
        
    for char in brackets {
        if char == "(" || char == "[" || char == "{" { stack.append(char) }
        else {
            switch char {
            case ")":
                if stack.last == "(" { stack.removeLast() }
                else                 { stack.append(char) }
            case "]":
                if stack.last == "[" { stack.removeLast() }
                else                 { stack.append(char) }
            case "}":
                if stack.last == "{" { stack.removeLast() }
                else                 { stack.append(char) }
            default:
                print("default")
            }
        }
    }
    return stack.count == 0 ? true : false
}

print(isValidBrackest(brackets: "()"))
print(isValidBrackest(brackets: "({"))


//Задача 3. Реализовать алгоритм перевода из инфиксной записи арифметического выражения в постфиксную.
print("\nTask 3")

class Stack<T> {
    
    private var top: Int
    private var items: [T]
    var size:Int
    
    init() {
        top = -1
        items = [T]()
        size = 7
    }
    
    init(size: Int) {
        top = -1
        items = [T]()
        self.size = size
    }
    
    func push(_ item: T) -> Bool {
        if !isFull() {
            items.append(item)
            top += 1
            return true
        }
        return false
    }
    
    func pop() -> T? {
        if !isEmpty() {
            top -= 1
            return items.removeLast()
        }
        return nil
    }
    
    func peek() -> T? {
        if !isEmpty() {
            return items.last
        }
        return nil
    }
    
    func isEmpty() -> Bool {
        return top == -1
    }
    
    func isFull() -> Bool {
        return top == (size - 1)
    }
    
    func count() -> Int {
        return (top + 1)
    }
    
}

func infixToPostfixEvaluation(_ equation: String) -> String {
    var result: String = ""
    let stack: Stack = Stack<Character>(size: equation.count)
    
    for char in equation {
        switch char {
        case "+", "-", "*", "/":
            if char == "-" || char == "+" {
                if stack.isEmpty() {
                    stack.push(char)
                } else {
                    switch stack.peek()! {
                    case "+", "-", "/", "*":
                        while !stack.isEmpty() && (stack.peek()! == "+" || stack.peek()! == "-" || stack.peek()! == "*" || stack.peek()! == "/")  {
                            result.append(stack.pop()!)
                        }
                        stack.push(char)
                    default:
                        stack.push(char)
                    }
                }
            } else {
                if stack.isEmpty() {
                    stack.push(char)
                } else {
                    switch stack.peek()! {
                    case "*", "/":
                        while (stack.peek()! == "*" || stack.peek()! == "/") && !stack.isEmpty() {
                            result.append(stack.pop()!)
                        }
                        stack.push(char)
                    default:
                        stack.push(char)
                    }
                }
            }
        case "(", "{", "[":
            stack.push(char)
        case ")", "}", "]":
            while stack.peek() != "(" && stack.peek() != "{" && stack.peek() != "[" && !stack.isEmpty() {
                result.append(stack.pop()!)
            }
            stack.pop()
        default:
            
            result.append(char)
        }
    }
    while !stack.isEmpty() {
        if stack.peek()! == "(" || stack.peek()! == "{" || stack.peek()! == "[" {
            stack.pop()
        } else {
            result.append(stack.pop()!)
        }
    }
    
    return result
}

print(infixToPostfixEvaluation("4+5*3+5"))

//Задача 4. Реализовать очередь.
print("\nTask 4")
struct Queue <T> {
    var data = [T] ()
    
    subscript (_ data: Int ...) -> Int {
        let x = 0
        for index in data where index < self.data.count {
            self.data[index]
        }
        return x
    }
    
    mutating func add (_ element: T) {
        data.append (element)
    }
    
    mutating func remove () -> T? {
        if !data.isEmpty {
            return data.removeFirst ()
        } else {
            return nil
        }
    }
    
}

// Tests
var queueStack = Queue <Int> ()
let queueArray = [4,3,5,8,7]

for i in 0...4 {
    queueStack.add(queueArray[i])
}

print ("\(queueStack)")
print ("\(queueStack.data)")

for _ in 0...2 {
    queueStack.remove()
}

print ("\(queueStack)")
print ("\(queueStack.data)")
