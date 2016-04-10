#if swift(>=3.0)
    public final class StreamSequence: Sequence {
        public let stream: Stream
        public let deadline: Double

        public init(for stream: Stream, timingOut deadline: Double) {
            self.stream = stream
            self.deadline = deadline
        }

        public func makeIterator() -> AnyIterator<Data> {
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

        public init(for stream: Stream, timingOut deadline: Double) {
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
