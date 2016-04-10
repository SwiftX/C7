public protocol AsyncSending {
    func send(data: Data, timingOut deadline: Double, result: (Void throws -> Void) -> Void)
    func flush(timingOut deadline: Double, result: (Void throws -> Void) -> Void)
}

public protocol AsyncReceiving {
    func receive(upTo byteCount: Int, timingOut deadline: Double, result: (Void throws -> Data) -> Void)
}

public protocol AsyncSendingStream: Closable, AsyncSending {}
public protocol AsyncReceivingStream: Closable, AsyncReceiving {}
public protocol AsyncStream: AsyncSendingStream, AsyncReceivingStream {}

extension AsyncSending {
    public func send(data: Data, result: (Void throws -> Void) -> Void) {
        send(data, timingOut: .never, result: result)
    }
    public func flush(result: (Void throws -> Void) -> Void) {
        flush(timingOut: .never, result: result)
    }
}

extension AsyncReceiving {
    public func receive(upTo byteCount: Int, result: (Void throws -> Data) -> Void) {
        receive(upTo: byteCount, timingOut: .never, result: result)
    }
}
