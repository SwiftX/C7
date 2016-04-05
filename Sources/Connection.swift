public protocol Connection: Stream {   
    init(to: URI) throws
    var uri: URI { get }
    func open() throws
}
