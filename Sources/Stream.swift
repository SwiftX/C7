public protocol Sending: AsyncSending {
    func send(data: Data, timingOut deadline: Double) throws
    func flush(timingOut deadline: Double) throws
}

public protocol Receiving: AsyncReceiving {
    func receive(upTo byteCount: Int, timingOut deadline: Double) throws -> Data
}

public protocol SendingStream: Closable, Sending {}
public protocol ReceivingStream: Closable, Receiving {}
public protocol Stream: SendingStream, ReceivingStream {}

extension Sending {
    public func send(data: Data, timingOut deadline: Double, result: (Void throws -> Void) -> Void) {
        result { try self.send(data, timingOut: deadline) }
    }

    public func flush(timingOut deadline: Double, result: (Void throws -> Void) -> Void) {
        result { try self.flush(timingOut: deadline) }
    }
}

extension Receiving {
    public func receive(upTo byteCount: Int, timingOut deadline: Double, result: (Void throws -> Data) -> Void) {
        result { try self.receive(upTo: byteCount, timingOut: deadline) }
    }
}
