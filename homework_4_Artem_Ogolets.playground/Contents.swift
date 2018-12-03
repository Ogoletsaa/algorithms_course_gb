//Урок 4. Динамическое программирование. Поиск возвратом
//Оголец Артем


// Массив со всеми возможными ходами коня
 let horseMoves = [
    [ 1, -2],
    [ 1,  2],
    [-1, -2],
    [-1,  2],
    [ 2, -1],
    [ 2,  1],
    [-2, -1],
    [-2,  1]
]

struct Node {
    let y: Int, x: Int // (x, y) координаты на доске
    let distance: Int // конечные координаты фигуры
    
    init(x: Int, y: Int, distance: Int = 0) {
        self.x = x
        self.y = y
        self.distance = distance
    }
}

extension Node: Hashable {
    
    var hashValue: Int {
        return "\(self.x)\(self.y)".hashValue
    }
    
    static func == (leftHandSide: Node, rightHandSide: Node) -> Bool {
        return leftHandSide.x == rightHandSide.x && leftHandSide.y == rightHandSide.y
    }
}

enum breadthFirstSearchError: Error {
    case shortestPathNotFound
}

 // Находим минимальное количество шагов коня
// используя метод обхода графа
func breadthFirstSearch(search: Node, destination: Node) throws -> Int {
    // Проверка - посещена ли клетка ранее или нет
    var visited = [Node: Bool]()
    
    // Создаем очередь и запускаем первый узел
    var q = Queue(array: [Node]())
    q.enqueue(search)
    
    // Работаем, пока очередь не опустеет
    while (!q.isEmpty) {
        
        // Удаляем элемент из очереди
        guard let node = q.dequeue() else { break }
        
        let x = node.x
        let y = node.y
        let distance = node.distance
        
        // Если цель достигнута, возвращаем конечные координаты
        if (x == destination.x && y == destination.y) { return distance }
        
        // Если клетка посещена, то пропускаем ее
        if visited[node] == nil {
            visited[node] = true
            
             // Проверяем все 8 возможных хода коня
            // и ставим в очередь каждый ход
            for i in 0..<horseMoves.count {
                
                  // Получаем новую текущую позицию коня
                 // на шахматной доске и ставим в очередь
                // с позицией + 1
                let position = horseMoves[i]
                let x1 = x + position[0]
                let y1 = y + position[1]
                
                if (isValid(x: x1, y: y1)) {
                    q.enqueue(Node(x: x1, y: y1, distance: distance + 1))
                }
            }
        }
    }
    throw breadthFirstSearchError.shortestPathNotFound
}

 // Проверяем, чтобы конь не выходил за пределы доски

func isValid(x: Int, y: Int) -> Bool {
    guard (x >= 0 && y >= 0 && x < horseMoves.count && y < horseMoves.count) else { return false }
    return true
}

 struct Queue<T> {
     var array = [T]()
    
     var isEmpty: Bool {
        return self.array.isEmpty
    }
    
     var count: Int {
        return self.array.count
    }
    
     mutating func enqueue(_ element: T) {
        self.array.append(element)
    }
    
     mutating func dequeue() -> T? {
        if self.isEmpty {
            return nil
        } else {
            return self.array.removeFirst()
        }
    }
    
     var front: T? {
        return self.array.first
    }
}

func totalSteps (startPositionX: Int, startPositionY: Int) -> String {
    var counter = 0
    for i in 0...7 {
        for j in 0...7 {
            if let answer = try? breadthFirstSearch(search: (Node(x: startPositionX, y: startPositionY)), destination: Node(x: i, y: j)) {
                counter += answer
                print("Текущая Х,У позиция коня [\(i),\(j)]. Шагов потрачено на перемещение с начальной позиции: \(answer) \n")
            }
        }
    
    }
    print("Всего затрачено ходов в каждую клетку, начиная каждый раз с начальной позиции: \(counter)")
    return " \(counter)"
}

totalSteps(startPositionX: 0, startPositionY: 0 )

