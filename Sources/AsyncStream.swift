public protocol AsyncSending {
    func send(_ data: Data, timingOut deadline: Double, completion: (() throws -> Void) -> Void)
    func flush(timingOut deadline: Double, completion: (() throws -> Void) -> Void)
}

public protocol AsyncReceiving {
    func receive(upTo byteCount: Int, timingOut deadline: Double, completion: (() throws -> Data) -> Void)
}

public protocol AsyncSendingStream: Closable, AsyncSending {}
public protocol AsyncReceivingStream: Closable, AsyncReceiving {}
public protocol AsyncStream: AsyncSendingStream, AsyncReceivingStream {}

extension AsyncSending {
    public func send(_ data: Data, completion: (() throws -> Void) -> Void) {
        send(data, timingOut: .never, completion: completion)
    }
    public func flush(completion: (() throws -> Void) -> Void) {
        flush(timingOut: .never, completion: completion)
    }
}

extension AsyncReceiving {
    public func receive(upTo byteCount: Int, completion: (() throws -> Data) -> Void) {
        receive(upTo: byteCount, timingOut: .never, completion: completion)
    }
}
