public protocol Host {
    func accept(timingOut deadline: Double) throws -> Stream
}

extension Host {
    func accept() throws -> Stream {
        return try accept(timingOut: .never)
    }
}
