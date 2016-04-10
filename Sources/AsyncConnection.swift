public protocol AsyncConnection: AsyncStream {
    func open(timingOut deadline: Double, result: (Void throws -> AsyncConnection) -> Void) throws
}
