public protocol AsyncHost {
    func accept(timingOut deadline: Double, completion: ((Void) throws -> AsyncStream) -> Void)
}

extension AsyncHost {
    public func accept(completion: ((Void) throws -> AsyncStream) -> Void) {
        accept(timingOut: .never, completion: completion)
    }
}
