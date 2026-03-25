//
//  EasyAPI+Config.swift
//  EasyAPI
//
//  Created by Khant Phone Naing  on 25/03/2026.
//

import Foundation

public struct EasyAPIConfig: Sendable {
    public let baseURL: String
    public let defaultHeaders: [String: String]
    public let requestTimeout: TimeInterval
    
    public init(baseURL: String, defaultHeaders: [String : String] = [:], requestTimeout: TimeInterval = 30) {
        self.baseURL = baseURL
        self.defaultHeaders = defaultHeaders
        self.requestTimeout = requestTimeout
    }
}

public extension EasyAPIConfig {
    static let `default` = EasyAPIConfig(
        baseURL: "https://api.example.com",
        defaultHeaders: [
            "Content-Type": "application/json"
        ],
        requestTimeout: 30
    )
}
