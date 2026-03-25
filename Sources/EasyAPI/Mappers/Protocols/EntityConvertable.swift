//
//  File.swift
//  EasyAPI
//
//  Created by Khant Phone Naing  on 25/03/2026.
//

import Foundation

public protocol EntityConvertible {
    associatedtype EntityType
    
    func toEntity() -> EntityType
}
