public enum Number {
    case int(Int)
    case int8(Int8)
    case int16(Int16)
    case int32(Int32)
    case int64(Int64)

    case uint(UInt)
    case uint8(UInt8)
    case uint16(UInt16)
    case uint32(UInt32)
    case uint64(UInt64)

    case float(Float)
    case double(Double)
}

extension Number {
    init(_ value: Int) {
        self = .int(value)
    }

    init(_ value: Int8) {
        self = .int8(value)
    }

    init(_ value: Int16) {
        self = .int16(value)
    }

    init(_ value: Int32) {
        self = .int32(value)
    }

    init(_ value: Int64) {
        self = .int64(value)
    }

    init(_ value: UInt) {
        self = .uint(value)
    }

    init(_ value: UInt8) {
        self = .uint8(value)
    }

    init(_ value: UInt16) {
        self = .uint16(value)
    }

    init(_ value: UInt32) {
        self = .uint32(value)
    }

    init(_ value: UInt64) {
        self = .uint64(value)
    }

    init(_ value: Float) {
        self = .float(value)
    }

    init(_ value: Double) {
        self = .double(value)
    }
}

extension Int {
    init(_ number: Number) {
        switch number {
        case .int(let n): self.init(n)
        case .int8(let n): self.init(n)
        case .int16(let n): self.init(n)
        case .int32(let n): self.init(n)
        case .int64(let n): self.init(n)

        case .uint(let n): self.init(n)
        case .uint8(let n): self.init(n)
        case .uint16(let n): self.init(n)
        case .uint32(let n): self.init(n)
        case .uint64(let n): self.init(n)

        case .float(let n): self.init(n)
        case .double(let n): self.init(n)
        }
    }
}

extension Int8 {
    init?(_ number: Number) {
        switch number {
        case let .int(value)    where value <= Int(Int8.max):    self.init(value)
        case let .int8(value):                                   self.init(value)
        case let .int16(value)  where value <= Int16(Int8.max):  self.init(value)
        case let .int32(value)  where value <= Int32(Int8.max):  self.init(value)
        case let .int64(value)  where value <= Int64(Int8.max):  self.init(value)
        case let .uint(value)   where value <= UInt(Int8.max):   self.init(value)
        case let .uint8(value):                                  self.init(value)
        case let .uint16(value) where value <= UInt16(Int8.max): self.init(value)
        case let .uint32(value) where value <= UInt32(Int8.max): self.init(value)
        case let .uint64(value) where value <= UInt64(Int8.max): self.init(value)
        case let .float(value)  where value <= Float(Int8.max):  self.init(value)
        case let .double(value) where value <= Double(Int8.max): self.init(value)
        default: return nil
        }
    }
}

extension Int16 {
    init(_ number: Number) {
        switch number {
        case .int(let n): self.init(n)
        case .int8(let n): self.init(n)
        case .int16(let n): self.init(n)
        case .int32(let n): self.init(n)
        case .int64(let n): self.init(n)

        case .uint(let n): self.init(n)
        case .uint8(let n): self.init(n)
        case .uint16(let n): self.init(n)
        case .uint32(let n): self.init(n)
        case .uint64(let n): self.init(n)

        case .float(let n): self.init(n)
        case .double(let n): self.init(n)
        }
    }
}

extension Int32 {
    init(_ number: Number) {
        switch number {
        case .int(let n): self.init(n)
        case .int8(let n): self.init(n)
        case .int16(let n): self.init(n)
        case .int32(let n): self.init(n)
        case .int64(let n): self.init(n)

        case .uint(let n): self.init(n)
        case .uint8(let n): self.init(n)
        case .uint16(let n): self.init(n)
        case .uint32(let n): self.init(n)
        case .uint64(let n): self.init(n)

        case .float(let n): self.init(n)
        case .double(let n): self.init(n)
        }
    }
}

extension Int64 {
    init(_ number: Number) {
        switch number {
        case .int(let n): self.init(n)
        case .int8(let n): self.init(n)
        case .int16(let n): self.init(n)
        case .int32(let n): self.init(n)
        case .int64(let n): self.init(n)

        case .uint(let n): self.init(n)
        case .uint8(let n): self.init(n)
        case .uint16(let n): self.init(n)
        case .uint32(let n): self.init(n)
        case .uint64(let n): self.init(n)

        case .float(let n): self.init(n)
        case .double(let n): self.init(n)
        }
    }
}

extension UInt {
    init(_ number: Number) {
        switch number {
        case .int(let n): self.init(n)
        case .int8(let n): self.init(n)
        case .int16(let n): self.init(n)
        case .int32(let n): self.init(n)
        case .int64(let n): self.init(n)

        case .uint(let n): self.init(n)
        case .uint8(let n): self.init(n)
        case .uint16(let n): self.init(n)
        case .uint32(let n): self.init(n)
        case .uint64(let n): self.init(n)

        case .float(let n): self.init(n)
        case .double(let n): self.init(n)
        }
    }
}

extension UInt8 {
    init(_ number: Number) {
        switch number {
        case .int(let n): self.init(n)
        case .int8(let n): self.init(n)
        case .int16(let n): self.init(n)
        case .int32(let n): self.init(n)
        case .int64(let n): self.init(n)

        case .uint(let n): self.init(n)
        case .uint8(let n): self.init(n)
        case .uint16(let n): self.init(n)
        case .uint32(let n): self.init(n)
        case .uint64(let n): self.init(n)

        case .float(let n): self.init(n)
        case .double(let n): self.init(n)
        }
    }
}

extension UInt16 {
    init(_ number: Number) {
        switch number {
        case .int(let n): self.init(n)
        case .int8(let n): self.init(n)
        case .int16(let n): self.init(n)
        case .int32(let n): self.init(n)
        case .int64(let n): self.init(n)

        case .uint(let n): self.init(n)
        case .uint8(let n): self.init(n)
        case .uint16(let n): self.init(n)
        case .uint32(let n): self.init(n)
        case .uint64(let n): self.init(n)

        case .float(let n): self.init(n)
        case .double(let n): self.init(n)
        }
    }
}

extension UInt32 {
    init(_ number: Number) {
        switch number {
        case .int(let n): self.init(n)
        case .int8(let n): self.init(n)
        case .int16(let n): self.init(n)
        case .int32(let n): self.init(n)
        case .int64(let n): self.init(n)

        case .uint(let n): self.init(n)
        case .uint8(let n): self.init(n)
        case .uint16(let n): self.init(n)
        case .uint32(let n): self.init(n)
        case .uint64(let n): self.init(n)

        case .float(let n): self.init(n)
        case .double(let n): self.init(n)
        }
    }
}

extension UInt64 {
    init(_ number: Number) {
        switch number {
        case .int(let n): self.init(n)
        case .int8(let n): self.init(n)
        case .int16(let n): self.init(n)
        case .int32(let n): self.init(n)
        case .int64(let n): self.init(n)

        case .uint(let n): self.init(n)
        case .uint8(let n): self.init(n)
        case .uint16(let n): self.init(n)
        case .uint32(let n): self.init(n)
        case .uint64(let n): self.init(n)

        case .float(let n): self.init(n)
        case .double(let n): self.init(n)
        }
    }
}

extension Float {
    init(_ number: Number) {
        switch number {
        case .int(let n): self.init(n)
        case .int8(let n): self.init(n)
        case .int16(let n): self.init(n)
        case .int32(let n): self.init(n)
        case .int64(let n): self.init(n)

        case .uint(let n): self.init(n)
        case .uint8(let n): self.init(n)
        case .uint16(let n): self.init(n)
        case .uint32(let n): self.init(n)
        case .uint64(let n): self.init(n)

        case .float(let n): self.init(n)
        case .double(let n): self.init(n)
        }
    }
}

extension Double {
    init(_ number: Number) {
        switch number {
        case .int(let n): self.init(n)
        case .int8(let n): self.init(n)
        case .int16(let n): self.init(n)
        case .int32(let n): self.init(n)
        case .int64(let n): self.init(n)

        case .uint(let n): self.init(n)
        case .uint8(let n): self.init(n)
        case .uint16(let n): self.init(n)
        case .uint32(let n): self.init(n)
        case .uint64(let n): self.init(n)

        case .float(let n): self.init(n)
        case .double(let n): self.init(n)
        }
    }
}
