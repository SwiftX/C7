public protocol Scheduling {
    associatedtype Event
    func schedule(event: Event)
}

