#if os(Linux)
    import Glibc
#else
    import Darwin.C
    var mtid = mach_timebase_info_data_t()
#endif

/// Milliseconds from January 1, 1970.
public func now() -> Double {
    #if os(Linux)
        var ts = timespec()
        clock_gettime(CLOCK_MONOTONIC, &ts)
        let milliseconds = Int(ts.tv_sec) * 1000 + Int(ts.tv_nsec) / 1000000
        // TODO: Paulo, make better :)
        return Double(milliseconds) / 1000
     #else
        if mtid.denom == 0 {
            mach_timebase_info(&mtid)
        }
        let ticks = mach_absolute_time()
        let milliseconds = Int64(ticks * UInt64(mtid.numer) / UInt64(mtid.denom) / 1000000)
        // TODO: Paulo, make better :)
        return Double(milliseconds) / 1000
    #endif
}

extension Double {
    /// Interval of `self` from now.
    public func fromNow() -> Double {
        return now() + self
    }
}

public protocol TimeRepresentor {
    var seconds: Double { get }
}

extension TimeRepresentor {
    public var millisecond: Double {
        return 1.second * 1000
    }
    public var milliseconds: Double {
        return self.seconds * 1000
    }
    public var second: Double {
        return 1.seconds
    }
    public var minute: Double {
        return 1.second * 60
    }
    public var minutes: Double {
        return self.seconds * 60
    }
    public var hour: Double {
        return 1.minute * 60
    }
    public var hours: Double {
        return self.minutes * 60
    }
}

extension Double: TimeRepresentor {
    public var seconds: Double {
        return self
    }
}

extension Double {
    public static var never: Double {
        return -1
    }
}
