
public enum JSON {

    public enum Number {
        case integer(Int)
        case double(Double)
    }
    
    case object([String: JSON])
    case array([JSON])
    case number(JSON.Number)
    case string(String)
    case boolean(Bool)
    case null
}
