//
//  Connection.swift
//  C7
//
//  Created by Scott Byrns on 4/1/16.
//
//

public protocol Connection : Stream {
    
    var uri : URI? { get }
    func open() throws

}