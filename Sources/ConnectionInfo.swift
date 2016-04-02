//
//  ConnectionInfo.swift
//  C7
//
//  Created by Scott Byrns on 4/1/16.
//
//
public protocol ConnectionInfo {
    var host: String? { get }
    var port: Int? { get }
    var connectionName: String? { get }
    var username: String? { get }
    var password: String? { get }
}
