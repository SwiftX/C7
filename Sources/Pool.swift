public protocol Pool {
    associatedtype Poolable
    func borrow() -> Poolable?
    func takeBack(poolable: Poolable)
    func with<Type>(handler: (poolable: Poolable) throws -> Type?) throws -> Type?
}

