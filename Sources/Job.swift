public protocol Job {
    var name: Stirng { get }
    func execute () throws
}

