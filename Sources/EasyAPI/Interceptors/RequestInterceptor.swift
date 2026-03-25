//
//  RequestInterceptor.swift
//  EasyAPI
//
//  Created by Khant Phone Naing  on 25/03/2026.
//

import Foundation

public protocol RequestInterceptor: Sendable {
    func intercept(_ request: URLRequest) async throws -> URLRequest
}
