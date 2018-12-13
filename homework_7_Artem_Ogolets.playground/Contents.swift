//Урок 7. Графы
//Оголец Артем
  
import UIKit
import PlaygroundSupport

// Задание 1. Матрица смежности.

let adjacencyList = AdjacencyList<String>()

let uzhnoSakhalinsk = adjacencyList.createVertex(data: "Uzhno Sakhalinsk")
let tokyo = adjacencyList.createVertex(data: "Tokyo")
let moscow = adjacencyList.createVertex(data: "Moscow")
let kaliningrad = adjacencyList.createVertex(data: "Kaliningrad")

adjacencyList.add(.undirected, from: uzhnoSakhalinsk, to: moscow, distance: 9286)
adjacencyList.add(.undirected, from: uzhnoSakhalinsk, to: tokyo, distance: 1278)
adjacencyList.add(.undirected, from: tokyo, to: moscow, distance: 7474)
adjacencyList.add(.undirected, from: moscow, to: kaliningrad, distance: 1250)

print(adjacencyList.description)


// Задача 3.Написать функцию обхода графа в ширину.

// Визуальная схема графа

//              E
//            /
//  A       C
//    \   /   \
//      B      F
//        \
//         D

let nodeA = BFSNode(value: "A", neighbours: [], visited: false)
let nodeB = BFSNode(value: "B", neighbours: [], visited: false)
let nodeC = BFSNode(value: "C", neighbours: [], visited: false)
let nodeD = BFSNode(value: "D", neighbours: [], visited: false)
let nodeE = BFSNode(value: "E", neighbours: [], visited: false)
let nodeF = BFSNode(value: "F", neighbours: [], visited: false)

nodeA.addNeighbour(node: nodeB)
nodeB.addNeighbour(node: nodeC)
nodeB.addNeighbour(node: nodeD)
nodeC.addNeighbour(node: nodeE)
nodeC.addNeighbour(node: nodeF)

BFSNode.breadthFirstSearch(first: nodeA)
