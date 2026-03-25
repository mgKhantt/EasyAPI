//
//  Data+Extension.swift
//  EasyAPI
//
//  Created by Khant Phone Naing  on 25/03/2026.
//

import Foundation

public extension Data {
    /// Converts the current JSON data into a model of the specified type.
    func fromJSON<T: Decodable>(_ type: T.Type) throws -> T {
        return try JSONDecoder().decode(T.self, from: self)
    }
    
    /// Converts data into a formatted JSON string.
    /// Returns the raw string or an error message if parsing fails.
    var prettyPrintedJSONString: String {
        guard !self.isEmpty else {
            return "No response body content"
        }
        
        guard let object = try? JSONSerialization.jsonObject(with: self),
              let data = try? JSONSerialization.data(withJSONObject: object, options: .prettyPrinted),
              let string = String(data: data, encoding: .utf8) else {
            return String(data: self, encoding: .utf8) ?? "Unable to decode response body content"
        }
        return string
    }
}
