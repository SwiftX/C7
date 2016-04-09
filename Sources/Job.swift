public protocol Job {
    var name: String { get }
    func execute () throws
}

