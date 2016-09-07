public struct Query {
    public var fields: [String: QueryField]

    public init(_ fields: [String: QueryField]) {
        self.fields = fields
    }
}

extension Query: ExpressibleByDictionaryLiteral {
    public init(dictionaryLiteral elements: (String, QueryField)...) {
        var fields: [String: QueryField] = [:]

        for (key, value) in elements {
            fields[key] = value
        }

        self.fields = fields
    }
}

extension Query: Sequence {
    #if swift(>=3.0)
        public func makeIterator() -> DictionaryIterator<String, QueryField> {
            return fields.makeIterator()
        }
    #else
        public func generate() -> DictionaryGenerator<String, QueryField> {
            return fields.generate()
        }
    #endif

    public var count: Int {
        return fields.count
    }

    public var isEmpty: Bool {
        return fields.isEmpty
    }

    public subscript(name: String) -> QueryField {
        get {
            return fields[name] ?? []
        }

        set(field) {
            fields[name] = field
        }
    }
}
