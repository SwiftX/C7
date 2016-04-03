public protocol Connection : Stream {
    var uri: URI? { get }
    func open() throws
}
