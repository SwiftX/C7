public protocol Sending: AsyncSending {
    func send(_ data: Data, timingOut deadline: Double) throws
    func flush(timingOut deadline: Double) throws
}

public protocol Receiving: AsyncReceiving {
    func receive(upTo byteCount: Int, timingOut deadline: Double) throws -> Data
}

public protocol SendingStream: Closable, Sending {}
public protocol ReceivingStream: Closable, Receiving {}
public protocol Stream: SendingStream, ReceivingStream {}

extension Sending {
    public func send(_ data: Data, timingOut deadline: Double, completion: ((Void) throws -> Void) -> Void) {
        completion { try self.send(data, timingOut: deadline) }
    }

    public func flush(timingOut deadline: Double, completion: ((Void) throws -> Void) -> Void) {
        completion { try self.flush(timingOut: deadline) }
    }
}

extension Sending {
    public func send(_ data: Data) throws {
        try send(data, timingOut: .never)
    }
    
    public func flush() throws {
        try flush(timingOut: .never)
    }
}

extension Receiving {
    public func receive(upTo byteCount: Int, timingOut deadline: Double, completion: ((Void) throws -> Data) -> Void) {
        completion { try self.receive(upTo: byteCount, timingOut: deadline) }
    }
}

extension Receiving {
    public func receive(upTo byteCount: Int) throws -> Data {
        return try receive(upTo: byteCount, timingOut: .never)
    }
}