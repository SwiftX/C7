public protocol Worker {
    func perform(job: Job) throws
}

