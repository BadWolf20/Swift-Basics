import UIKit

struct Queue<T> {
    
    private(set) var array: [T] = []
    
    subscript(index: Int) -> T? {
        guard array.indices ~= index else { return nil }
        
        return array[index]
    }
    
    
    mutating func addToQueue(_ element: T) -> [T]{
        self.array.append(element)
        return array
    }
    
    mutating func show() -> [T]{
        return array
    }
    
    mutating func quitFromQueue() -> T {
        self.array.removeFirst()
    }
    
    
    mutating func removeAll(where condition: (T) -> Bool) {
        for (index, element) in array.enumerated().reversed() {
            if condition(element) {
                array.remove(at: index)
            }
        }
    }
    
    func filter (condition:  (T) -> Bool) -> Queue<T> {
        var filteredArray: [T] = []

        for element in array {
            if condition(element) {
                filteredArray.append(element)
            }
        }
        var filteredQueue = Queue<T>()
        filteredQueue.array = filteredArray
        return filteredQueue
    }
}


var cool = Queue<Int>()
cool.addToQueue(0)
cool.addToQueue(1)
cool.addToQueue(2)
cool.addToQueue(3)

cool.quitFromQueue()
cool.show()
cool[0]
cool[1]
cool[2]
cool[3]
cool[4]

let filteredQueue = cool.filter{$0 == 3 || $0 == 2}

print(filteredQueue.array)
