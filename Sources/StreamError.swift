public enum StreamError: Error {
    case closedStream(data: Data)
    case timeout(data: Data)
}
