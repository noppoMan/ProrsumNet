//
//  Data.swift
//  Prorsum
//
//  Created by Yuki Takei on 2016/11/28.
//
//

import Foundation

extension Data {

    public static var empty: Data {
        return Data()
    }
}

public protocol DataRepresentable {
    var data: Data { get }
}

extension Data : DataRepresentable {
    public var data: Data {
        return self
    }
}
