#if os(Linux)
import Glibc
#else
import Darwin.C
#endif

import Foundation

public enum StringError: Error {
    
    case invalidString
    
    case utf8EncodingFailed
}

extension String {
    
    public init(cString: UnsafePointer<Int8>, length: Int) {
        var buffer = [Int8](repeating: 0, count: length + 1)
        strncpy(&buffer, cString, length)
        self = String(cString: buffer)
    }
    
    public var data: Data {
        return self.data(using: .utf8) ?? Data()
    }
    
    public var bytes: Bytes {
        return Array(self.utf8)
    }
}

extension UInt8 {
    
    public func hexadecimal() -> String {
        let hexadecimal =  String(self, radix: 16, uppercase: true)
        return (self < 16 ? "0" : "") + hexadecimal
    }
}
