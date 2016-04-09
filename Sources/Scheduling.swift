public protocol Scheduling {
    associatedType Event
    func schedule(event: Event)
}

