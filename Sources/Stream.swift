public protocol Stream {
    var closed: Bool { get }
    func close() -> Bool
    func receive() throws -> Data
    func send(data: Data) throws
    func flush() throws
}

public enum StreamError: ErrorProtocol {
    case closedStream(data: Data)
    case timeout
}
