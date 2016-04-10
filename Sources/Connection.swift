public protocol Connection: Stream {
    func open(timingOut deadline: Double) throws
}

extension Connection {
    public func open() throws {
        try open(timingOut: .never)
    }
}
