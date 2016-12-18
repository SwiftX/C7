public protocol Handling {
    associatedtype Event
    func handle(event: Event)
}

