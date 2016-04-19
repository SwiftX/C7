public final class Drain: DataRepresentable, BinaryStream {
    
    public typealias Received = Data
    public typealias Sent = Data
    
    var buffer: Data
    public var closed = false

    public var data: Data {
        if !closed {
            return buffer
        }
        return []
    }

    public convenience init() {
        self.init(for: [])
    }

    public init<T: BinaryStream>(for stream: T, timingOut deadline: Double = .never) {
        var buffer: Data = []

        if stream.closed {
            self.closed = true
        }

        while !stream.closed {
            if let chunk = try? stream.receive(upTo: 1024, timingOut: deadline) {
                buffer.bytes += chunk.bytes
            } else {
                break
            }
        }

        self.buffer = buffer
    }

    public init(for buffer: Data) {
        self.buffer = buffer
    }

    public convenience init(for buffer: DataRepresentable) {
        self.init(for: buffer.data)
    }

    public func close() throws {
        guard !closed else {
            throw ClosableError.alreadyClosed
        }
        closed = true
    }

    public func receive(upTo byteCount: Int, timingOut deadline: Double = .never) throws -> Data {
        if byteCount >= buffer.count {
            try close()
            return buffer
        }

        let data = buffer[0..<byteCount]
        buffer.removeFirst(byteCount)

        return Data(data)
    }

    public func send(_ data: Data, timingOut deadline: Double = .never) throws {
        buffer += data.bytes
    }

    public func flush(timingOut deadline: Double = .never) throws {
        buffer = []
    }
}
