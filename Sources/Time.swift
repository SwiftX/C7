#if os(Linux)
import Glibc
#else
import Darwin.C
var mtid = mach_timebase_info_data_t()
#endif

public var now: Int {
    #if os(Linux)
    var ts = timespec()
    clock_gettime(CLOCK_MONOTONIC, &ts)
    return Int(ts.tv_sec) * 1000 + Int(ts.tv_nsec) / 1000000
    #else
    if mtid.denom == 0 {
        mach_timebase_info(&mtid)
    }
    let ticks = mach_absolute_time()
    return Int(ticks * UInt64(mtid.numer) / UInt64(mtid.denom) / 1000000)
    #endif
}

public extension Int {
    /// Interval of `self` from now.
    var fromNow: Int {
        return now + self
    }
}

public protocol TimeRepresentable {
    var millisecond: Int { get }
    var second: Int { get }
    var minute: Int { get }
    var hour: Int { get }
}

extension TimeRepresentable {
    public var milliseconds: Int {
        return 1
    }
    public var second: Int {
        return millisecond * 1000
    }
    public var seconds: Int {
        return 1000
    }
    public var minute: Int {
        return millisecond * 60000
    }
    public var minutes: Int {
        return 60000
    }
    public var hour: Int {
        return millisecond * 3600000
    }
    public var hours: Int {
        return 3600000
    }
}

extension Int: TimeRepresentable {
    public var millisecond: Int {
        return self
    }
}

public let never = -1
