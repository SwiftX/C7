import Foundation

protocol File {
    var filename: String { get }
    var contentType: String { get }
    var modifyDate: NSDate { get }
    var data: Data { get  }
}
