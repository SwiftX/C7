#if os(Linux)
    import Glibc
    var ts = timespec()
#else
    import Darwin.C
    var factor: Double = {
        var mtid = mach_timebase_info_data_t()
        mach_timebase_info(&mtid)
        return Double(mtid.numer) / Double(mtid.denom) / 1E9
    }()
#endif

/// Absolute time in seconds
public func now() -> Double {
    #if os(Linux)
        clock_gettime(CLOCK_MONOTONIC, &ts)
        return Double(ts.tv_sec) + Double(ts.tv_nsec) / 1E9
     #else
        return Double(mach_absolute_time()) * factor
    #endif
}

extension Double {
    /// Interval of `self` from now.
    public func fromNow() -> Double {
        return now() + self
    }
}

public protocol TimeUnitRepresentable {
    var seconds: Double { get }
}

extension TimeUnitRepresentable {
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

extension Double: TimeUnitRepresentable {
    public var seconds: Double {
        return self
    }
}

extension Int: TimeUnitRepresentable {
    public var seconds: Double {
        return Double(self)
    }
}

extension Double {
    public static var never: Double {
        return -1
    }
}
