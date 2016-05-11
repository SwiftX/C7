public protocol AsyncHost {
    func accept(timingOut deadline: Double, completion: (() throws -> AsyncStream) -> Void)
}

extension AsyncHost {
    public func accept(completion: (() throws -> AsyncStream) -> Void) {
        accept(timingOut: .never, completion: completion)
    }
}
