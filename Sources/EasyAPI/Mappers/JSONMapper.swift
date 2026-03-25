//
//  JSONMapper.swift
//  EasyAPI
//
//  Created by Khant Phone Naing  on 25/03/2026.
//

import Foundation

import Foundation

/// JSON Parsing Utility
public enum JSONMapper {
    /// Decodes any type that conforms to the `Decodable` protocol.
    /// - Parameters:
    ///   - type: The target type conforming to `Decodable`.
    ///   - jsonData: The raw JSON data to decode.
    /// - Returns: The decoded object of the specified type.
    /// - Note: This does not depend on `ResponseConvertible` and returns the DTO (Data Transfer Object) directly.
    public static func decodeDTO<T: Decodable>(_ type: T.Type, from jsonData: Data) throws -> T {
        return try JSONDecoder().decode(T.self, from: jsonData)
    }
}
