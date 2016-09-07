#if os(Linux)

import XCTest
@testable import C7Tests

XCTMain([
    testCase(ExampleTests.allTests)
])

#endif