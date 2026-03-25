//
//  JSONDecoder+Extension.swift
//  EasyAPI
//
//  Created by Khant Phone Naing  on 25/03/2026.
//

import Foundation

internal extension JSONDecoder {
    func safeDecode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T {
        do {
            return try self.decode(type, from: data)
        } catch {
            throw EasyAPIError.decoding(.decodingError, underlying: error)
        }
    }
}
