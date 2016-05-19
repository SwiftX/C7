public enum JSON {
    case object([String: JSON])
    case array([JSON])
    case integer(Int)
    case double(Double)
    case string(String)
    case boolean(Bool)
    case null
}
