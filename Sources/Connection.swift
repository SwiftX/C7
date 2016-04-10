public protocol Connection: Stream {
    func open(timingOut deadline: Double) throws
}
