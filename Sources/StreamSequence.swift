#if swift(>=3.0)
    public final class StreamSequence<T: Stream>: Sequence {
        public let stream: T
        public let deadline: Double

        public init(for stream: T, timingOut deadline: Double = .never) {
            self.stream = stream
            self.deadline = deadline
        }

        public func makeIterator() -> AnyIterator<T.Interchanged> {
            return AnyIterator {
                if self.stream.closed {
                    return nil
                }
                return try? self.stream.receive(upTo: 1024, timingOut: self.deadline)
            }
        }
    }
#else
    public final class StreamSequence: SequenceType {
        public let stream: Stream
        public let deadline: Double

        public init(for stream: Stream, timingOut deadline: Double = .never) {
            self.stream = stream
            self.deadline = deadline
        }

        public func generate() -> AnyGenerator<Data> {
            return AnyGenerator {
                if self.stream.closed {
                    return nil
                }
                return try? self.stream.receive(upTo: 1024, timingOut: self.deadline)
            }
        }
    }
#endif
