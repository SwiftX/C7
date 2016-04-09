public protocol Queuing {
    associatedType Item
    mutating func enqueue(item: Item)
    mutating func dequeue() throws -> Item
}

