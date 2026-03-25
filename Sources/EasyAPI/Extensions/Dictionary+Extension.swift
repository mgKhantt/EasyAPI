//
//  File.swift
//  EasyAPI
//
//  Created by Khant Phone Naing  on 25/03/2026.
//

import Foundation

public extension Dictionary where Key == String, Value == Any {
    /// Converts the dictionary into an array of `URLQueryItem`, suitable for URL query parameters.
    ///
    /// This property is commonly used to build query strings for GET or POST requests.
    ///
    /// Example:
    /// ```swift
    /// let params: [String: Any] = ["userId": 123, "name": "Alice"]
    /// let queryItems = params.asQueryItems
    /// // Result: [URLQueryItem(name: "userId", value: "123"), URLQueryItem(name: "name", value: "Alice")]
    /// ```
    var asQueryItems: [URLQueryItem] {
        map { URLQueryItem(name: $0.key, value: "\($0.value)") }
    }
}
