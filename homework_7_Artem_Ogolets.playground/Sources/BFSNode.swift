import Foundation

public class BFSNode<T> {
    
    public var value:T
    public var neighbours:[BFSNode]
    public var visited:Bool
    
    //Инициализация
    public init(value:T, neighbours:[BFSNode], visited:Bool) {
        self.value = value
        self.neighbours = neighbours
        self.visited = visited
    }
    
    //Фунцкия помощник для примера
    public func addNeighbour(node: BFSNode) {
        self.neighbours.append(node)
        node.neighbours.append(self)
    }


public static func breadthFirstSearch(first:BFSNode) {
    //Стартуем очередь
    var queue:[BFSNode] = []
    
    //Начинаем с корня
    queue.append(first)
    
    //Посещаем ветви в очереди
    while queue.isEmpty == false {
        if let node = queue.first {
            //Выводим все то, что посетили
            print(node.value)
            node.visited = true
            //Добовляем непосещенные соседние корни в очередь
            for neighbour in node.neighbours {
                if neighbour.visited == false {
                    queue.append(neighbour)
                }
            }
            // Извлекаем посещенные корни и продолжаем работать
            // с остатками корней, находящихся в очереди
            queue.removeFirst()
            }
        }
    }
}
