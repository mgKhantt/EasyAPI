//
//  JSONLoader.swift.swift
//  EasyAPI
//
//  Created by Khant Phone Naing  on 25/03/2026.
//

import Foundation

/// A utility class for loading and parsing JSON data from a Bundle, typically used for Mocking.
public struct JSONLoader {
    
    // MARK: - API Methods
    
    /// Loads a single entity from a specified JSON file.
    public static func loadDTO<T: Decodable>(
        _ type: T.Type,
        fromJSON name: String,
        in bundle: Bundle
    ) throws -> T {
        // 1. Load raw JSON data
        let data = try loadJSON(named: name, in: bundle)
        
        // 2. Verify the JSON root object is a dictionary format
        guard let mockResponse = data as? [String: Any] else {
            throw JSONLoaderError.invalidJSONFormat(filename: name)
        }
        
        // 3. Convert back to Data for final decoding
        let jsonData = try JSONSerialization.data(withJSONObject: mockResponse, options: [])
        return try JSONMapper.decodeDTO(type, from: jsonData)
    }
    
    /// Loads an array of entities from a specified JSON file.
    public static func loadDTOList<T: Decodable>(
        _ type: [T].Type,
        fromJSON name: String,
        in bundle: Bundle
    ) throws -> [T] {
        // 1. Load raw JSON data
        let data = try loadJSON(named: name, in: bundle)
        
        // 2. Verify the JSON root is a dictionary and contains a "data" array
        guard let mockResponse = data as? [String: Any],
              let dataArray = mockResponse["data"] as? [[String: Any]] else {
            throw JSONLoaderError.invalidDataFormat(filename: name)
        }
        
        // 3. Parse each element in the array
        var entities: [T] = []
        for item in dataArray {
            let jsonData = try JSONSerialization.data(withJSONObject: item, options: [])
            let entity = try JSONMapper.decodeDTO(T.self, from: jsonData)
            entities.append(entity)
        }
        return entities
    }
    
    // MARK: - Base JSON Reading
    
    /// Loads a JSON object from a specified file in the bundle.
    private static func loadJSON(named name: String, in bundle: Bundle) throws -> Any {
        // 1. Get file URL
        guard let url = bundle.url(forResource: name, withExtension: "json") else {
            throw JSONLoaderError.fileNotFound(filename: name)
        }
        
        print("[APIClient][Mock][JSONLoader] 📦 Mock Data: \(name).json (bundle: \(bundle.bundlePath))")
        
        // 2. Read and parse data
        do {
            let data = try Data(contentsOf: url)
            
            // 3. Attempt to parse as [String: Any]
            if let jsonDict = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                return jsonDict
            } else {
                throw JSONLoaderError.invalidJSONFormat(filename: name)
            }
        } catch {
            throw JSONLoaderError.jsonParsingFailed(filename: name, underlyingError: error)
        }
    }
}
