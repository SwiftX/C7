public protocol AsyncHost {
    associatedtype AsyncStreamType: AsyncStream
    func accept(timingOut deadline: Double, completion: (Void throws -> AsyncStreamType) -> Void)
}

extension AsyncHost {
    public func accept(completion: (Void throws -> AsyncStreamType) -> Void) {
        accept(timingOut: .never, completion: completion)
    }
}

public protocol AsyncBinaryHost: AsyncHost {
    associatedtype AsyncBinaryStreamType: AsyncBinaryStream
    func accept(timingOut deadline: Double, completion: (Void throws -> AsyncBinaryStreamType) -> Void)
}
