//
//  ResponseInterceptor.swift
//  EasyAPI
//
//  Created by Khant Phone Naing  on 25/03/2026.
//

import Foundation

public protocol ResponseInterceptor: Sendable {
    func intercept(
        data: Data,
        response: URLResponse,
        request: URLRequest,
        session: URLSession
    ) async throws -> (Data, URLResponse)
}
