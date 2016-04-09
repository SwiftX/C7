public protocol Handling {
    associatedType Event
    func handle(event: Event)
}

