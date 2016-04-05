public protocol Connection: Stream {   
    init(to: URI)
    var uri: URI { get }
    func open() throws
}
