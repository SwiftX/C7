public enum JSON {
    public enum Number {
        case integer(Int)
        case unsignedInteger(UInt)
        case double(Double)
    }
    case object([String: JSON])
    case array([JSON])
    case number(JSON.Number)
    case string(String)
    case boolean(Bool)
    case null
}

extension JSON.Number {
    // TODO: We could make these public, but people might prefer not to.
    private var double: Double {
        switch self {
        case let .double(d):
            return d
        case let .integer(i):
            return Double(i)
        case let .unsignedInteger(u):
            return Double(u)
        }
    }

    private var int: Int? {
        switch self {
        case let .double(d):
            return Int(d)
        case let .integer(i):
            return i
        case let .unsignedInteger(u):
            if u < UInt(Int.max) {
                return Int(u)
            } else {
                return nil
            }
        }
    }

    private var uint: UInt? {
        switch self {
        case let .double(d) where d >= 0:
            return UInt(d)
        case let .integer(i) where i >= 0:
            return UInt(i)
        case let .unsignedInteger(u):
            return u
        default:
            return nil
        }
    }
}

extension JSON.Number: Equatable { }
public func ==(lhs: JSON.Number, rhs: JSON.Number) -> Bool {
    switch lhs {
    case .integer(let l):
        return l == rhs.int
    case .unsignedInteger(let l):
        return l == rhs.uint
    case .double(let l):
        return l == rhs.double
    }
}

extension JSON: Equatable { }
public func ==(lhs: JSON, rhs: JSON) -> Bool {
    switch (lhs, rhs) {
    case (.null, .null): return true
    case (.boolean(let l), .boolean(let r)): return l == r
    case (.string(let l), .string(let r)): return l == r
    case (.number(let l), .number(let r)): return l == r
    case (.array(let l), .array(let r)): return l == r
    case (.object(let l), .object(let r)): return l == r
    default: return false
    }
}

//
// TODO: refactor with
// https://github.com/apple/swift-evolution/blob/master/proposals/0080-failable-numeric-initializers.md
//

extension Int {
    public init?(_ number: JSON.Number) {
        switch number {
        case let .integer(value)                                         : self.init(value)
        case let .unsignedInteger(value) where value <= UInt(Int.max)    : self.init(value)
        case let .double(value)          where value <= Double(Int32.max): self.init(value)
        default: return nil
        }
    }
}

extension UInt {
    public init?(_ number: JSON.Number) {
        switch number {
        case let .integer(value)         where value > 0                  : self.init(value)
        case let .unsignedInteger(value)                                  : self.init(value)
        case let .double(value)          where value <= Double(UInt32.max): self.init(value)
        default: return nil
        }
    }
}

extension Double {
    public init(_ number: JSON.Number) {
        switch number {
        case let .integer(value)        : self.init(value)
        case let .unsignedInteger(value): self.init(value)
        case let .double(value)         : self.init(value)
        }
    }
}
