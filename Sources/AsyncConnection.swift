public protocol AsyncConnection: AsyncStream {
    func open(timingOut deadline: Double, completion: (() throws -> AsyncConnection) -> Void) throws
}

extension AsyncConnection {
    public func open(completion: (() throws -> AsyncConnection) -> Void) throws {
        try open(timingOut: .never, completion: completion)
    }
}
