public protocol AsyncHost {
    func accept(timingOut deadline: Double, result: (Void throws -> AsyncStream) -> Void)
}

extension AsyncHost {
    public func accept(result: (Void throws -> AsyncStream) -> Void) {
        accept(timingOut: .never, result: result)
    }
}
