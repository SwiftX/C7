//
//  Connection.swift
//  C7
//
//  Created by Scott Byrns on 4/1/16.
//
//

public protocol Connection {
    
    associatedtype StatusType
    
    func open() throws
    func close() -> Bool
    
    var connectionInfo: ConnectionInfo { get }
    var status: StatusType { get }
    var mostRecentError: ErrorProtocol? { get }

}