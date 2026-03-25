//
//  JSONLoader+Extension.swift
//  EasyAPI
//
//  Created by Khant Phone Naing  on 25/03/2026.
//

import Foundation

public extension JSONLoader {
    enum JSONLoaderError: LocalizedError {
        case fileNotFound(filename: String)
        case invalidJSONFormat(filename: String)
        case invalidDataFormat(filename: String)
        case jsonParsingFailed(filename: String, underlyingError: Error)
        
        public var errorDescription: String? {
            switch self {
            case .fileNotFound(let filename):
                return "找不到 JSON 文件: \(filename).json"
            case .invalidJSONFormat(let filename):
                return "JSON 文件格式无效，不是字典格式: \(filename).json"
            case .invalidDataFormat(let filename):
                return "JSON 数据格式无效，缺少 data 数组: \(filename).json"
            case .jsonParsingFailed(let filename, let underlyingError):
                return "JSON 解析失败: \(filename).json - \(underlyingError.localizedDescription)"
            }
        }
    }
}
