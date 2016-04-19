public protocol Host {
    associatedtype StreamType: Stream
    func accept(timingOut deadline: Double) throws -> StreamType
}

extension Host {
    func accept() throws -> StreamType {
        return try accept(timingOut: .never)
    }
}

public protocol BinaryHost: Host {
    associatedtype BinaryStreamType: BinaryStream
    func accept(timingOut deadline: Double) throws -> BinaryStreamType
}
