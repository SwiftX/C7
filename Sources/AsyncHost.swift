public protocol AsyncHost {
    func accept(timingOut deadline: Double, result: (Void throws -> AsyncStream) -> Void)
}
