public protocol Host {
    func accept(timingOut deadline: Double) throws -> Stream
}
