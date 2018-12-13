import Foundation

open class AdjacencyList<T: Hashable> {
    
    public var adjacencyDict : [Vertex<T>: [Edge<T>]] = [:]
    public init() {}
    
    fileprivate func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, distance: Double?) {
        let edge = Edge(source: source, destination: destination, distance: distance)
        adjacencyDict[source]?.append(edge)
    }
    
    fileprivate func addUndirectedEdge(vertices: (Vertex<Element>, Vertex<Element>), distance: Double?) {
        let (source, destination) = vertices
        addDirectedEdge(from: source, to: destination, distance: distance)
        addDirectedEdge(from: destination, to: source, distance: distance)
    }
}

extension AdjacencyList: Graphable {
    
    public typealias Element = T
    
    public func createVertex(data: Element) -> Vertex<Element> {
        let vertex = Vertex(data: data)
        
        if adjacencyDict[vertex] == nil {
            adjacencyDict[vertex] = []
        }
        
        return vertex
    }
    
    public func add(_ type: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, distance: Double?) {
        switch type {
        case .directed:
            addDirectedEdge(from: source, to: destination, distance: distance)
        case .undirected:
            addUndirectedEdge(vertices: (source, destination), distance: distance)
        }
    }
    
    public func distance(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double? {
        guard let edges = adjacencyDict[source] else {
            return nil
        }
        
        for edge in edges {
            if edge.destination == destination {
                return edge.distance
            }
        }
        
        return nil
    }
        
    public func edges(from source: Vertex<Element>) -> [Edge<Element>]? {
        return adjacencyDict[source]
    }
    
    public var description: CustomStringConvertible {
        var result = ""
        for (vertex, edges) in adjacencyDict {
            var edgeString = ""
            for (index, edge) in edges.enumerated() {
                if index != edges.count - 1 {
                    edgeString.append("\(edge.destination), ")
                } else {
                    edgeString.append("\(edge.destination)")
                }
            }
            result.append("\(vertex) ---> [ \(edgeString) ] \n ")
        }
        return result
    }
}
