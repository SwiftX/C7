public protocol Queuing {
    associatedtype Item
    mutating func enqueue(item: Item)
    mutating func dequeue() throws -> Item
}

