public protocol AsyncSending {
    associatedtype Sent
    func send(_ data: Sent, timingOut deadline: Double, completion: (Void throws -> Void) -> Void)
    func flush(timingOut deadline: Double, completion: (Void throws -> Void) -> Void)
}

public protocol AsyncReceiving {
    associatedtype Received
    func receive(upTo byteCount: Int, timingOut deadline: Double, completion: (Void throws -> Received) -> Void)
}

public protocol AsyncSendingStream: Closable, AsyncSending {}
public protocol AsyncReceivingStream: Closable, AsyncReceiving {}
public protocol AsyncStream: AsyncSendingStream, AsyncReceivingStream {
    associatedtype Interchanged
    func send(_ data: Interchanged, timingOut deadline: Double, completion: (Void throws -> Void) -> Void)
    func receive(upTo byteCount: Int, timingOut deadline: Double, completion: (Void throws -> Interchanged) -> Void)
}

extension AsyncSending {
    public func send(_ data: Sent, completion: (Void throws -> Void) -> Void) {
        send(data, timingOut: .never, completion: completion)
    }
    public func flush(completion: (Void throws -> Void) -> Void) {
        flush(timingOut: .never, completion: completion)
    }
}

extension AsyncReceiving {
    public func receive(upTo byteCount: Int, completion: (Void throws -> Received) -> Void) {
        receive(upTo: byteCount, timingOut: .never, completion: completion)
    }
}

public protocol AsyncBinaryStream: AsyncStream {
    func send(_ data: Data, timingOut deadline: Double, completion: (Void throws -> Void) -> Void)
    func receive(upTo byteCount: Int, timingOut deadline: Double, completion: (Void throws -> Data) -> Void)
    func flush(timingOut deadline: Double, completion: (Void throws -> Void) -> Void)
}
