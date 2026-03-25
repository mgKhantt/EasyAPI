//
//  File.swift
//  EasyAPI
//
//  Created by Khant Phone Naing  on 25/03/2026.
//

import Foundation

public protocol ResponseConvertible {
    associatedtype DTO: Decodable & EntityConvertible
    
    func extractEntity() throws -> DTO.EntityType
}
