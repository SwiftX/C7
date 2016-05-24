public enum JSON {
    case object([String: JSON])
    case array([JSON])
    case number(Number)
    case string(String)
    case boolean(Bool)
    case null
}
