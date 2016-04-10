public protocol AsyncConnection: AsyncStream {
    func open(timingOut deadline: Double, result: (Void throws -> AsyncConnection) -> Void) throws
}

extension AsyncConnection {
    public func open(result: (Void throws -> AsyncConnection) -> Void) throws {
        try open(timingOut: .never, result: result)
    }
}
