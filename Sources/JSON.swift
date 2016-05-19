public enum JSON {
    case object([String: JSON])
    case array([JSON])
    case number(Double)
    case string(String)
    case boolean(Bool)
    case null
}
