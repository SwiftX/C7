#if os(Linux)
    import Glibc
#else
    import Darwin.C
    var mtid = mach_timebase_info_data_t()
#endif

/// Milliseconds from January 1, 1970.
public func now() -> Int64 {
    #if os(Linux)
        var ts = timespec()
        clock_gettime(CLOCK_MONOTONIC, &ts)
        return Int(ts.tv_sec) * 1000 + Int(ts.tv_nsec) / 1000000
    #else
        if mtid.denom == 0 {
            mach_timebase_info(&mtid)
        }
        let ticks = mach_absolute_time()
        return Int64(ticks * UInt64(mtid.numer) / UInt64(mtid.denom) / 1000000)
    #endif
}

extension Int64 {
    /// Interval of `self` from now.
    public func fromNow() -> Int64 {
        return now() + Int64(self.toIntMax())
    }
}

public protocol TimeRepresentor {
    var millisecond: Int64 { get }
}

extension TimeRepresentor {
    public var milliseconds: Int64 {
        return 1
    }
    public var second: Int64 {
        return millisecond * 1000
    }
    public var seconds: Int64 {
        return 1000
    }
    public var minute: Int64 {
        return millisecond * 60000
    }
    public var minutes: Int64 {
        return 60000
    }
    public var hour: Int64 {
        return millisecond * 3600000
    }
    public var hours: Int64 {
        return 3600000
    }
}

extension Int: TimeRepresentor {
    public var millisecond: Int64 {
        return Int64(self.toIntMax())
    }
}

extension Int64 {
    public static var never: Int64 {
        return -1
    }
}
