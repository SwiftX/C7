public struct CaseInsensitiveString {
    public let string: String

    public init(_ string: String) {
        self.string = string
    }
}

extension CaseInsensitiveString: Hashable {
#if swift(>=3.0)
    public var hashValue: Int {
        return string.lowercased().hashValue
    }
#else
    public var hashValue: Int {
        return string.lowercaseString.hashValue
    }
#endif
}

#if swift(>=3.0)
    public func == (lhs: CaseInsensitiveString, rhs: CaseInsensitiveString) -> Bool {
        return lhs.string.lowercased() == rhs.string.lowercased()
    }
#else
    public func == (lhs: CaseInsensitiveString, rhs: CaseInsensitiveString) -> Bool {
        return lhs.string.lowercaseString == rhs.string.lowercaseString
    }
#endif

extension CaseInsensitiveString: StringLiteralConvertible {
    public init(stringLiteral string: String) {
        self.init(string)
    }

    public init(extendedGraphemeClusterLiteral string: String){
        self.init(string)
    }

    public init(unicodeScalarLiteral string: String){
        self.init(string)
    }
}

extension CaseInsensitiveString: CustomStringConvertible {
    public var description: String {
        return string
    }
}

extension String {
    var caseInsensitive: CaseInsensitiveString {
        return CaseInsensitiveString(self)
    }
}

public protocol CaseInsensitiveStringRepresentable {
    var caseInsensitiveString: CaseInsensitiveString { get }
}

extension String: CaseInsensitiveStringRepresentable {
    public var caseInsensitiveString: CaseInsensitiveString {
        return CaseInsensitiveString(self)
    }
}
