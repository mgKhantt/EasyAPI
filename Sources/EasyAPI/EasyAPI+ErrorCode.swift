//
//  EasyAPI+ErrorCode.swift
//  EasyAPI
//
//  Created by Khant Phone Naing  on 25/03/2026.
//

import Foundation

public enum EasyAPIErrorCode: Int, Sendable {
    // MARK: - Network Related Errors 1000-1999
    
    /// No network connection available
    case networkUnavailable = 1000
    
    /// Network request timed out
    case networkTimeout = 1001
    
    /// Network connection was lost
    case networkConnectionLost = 1002
    
    /// SSL certificate validation failed
    case sslError = 1003
    
    /// DNS resolution failed
    case dnsResolutionFailed = 1004
    
    // MARK: - URL Related Errors 2000-2999
    
    /// Invalid URL address
    case invalidURL = 2000
    
    /// Malformed URL format
    case malformedURL = 2001
    
    // MARK: - Request Related Errors 3000-3999
    
    /// Invalid request parameters
    case invalidRequest = 3000
    
    /// Request timed out
    case requestTimeout = 3001
    
    /// Request was cancelled
    case requestCancelled = 3002
    
    // MARK: - Response Related Errors 4000-4999
    
    /// Invalid server response
    case invalidResponse = 4000
    
    /// HTTP protocol error
    case httpError = 4001
    
    /// Unauthorized access (login required)
    case unauthorized = 4002
    
    /// Access forbidden (insufficient permissions)
    case forbidden = 4003
    
    /// The requested resource does not exist
    case notFound = 4004
    
    /// Internal server error
    case serverError = 4005
    
    /// Service is temporarily unavailable
    case serviceUnavailable = 4006
    
    // MARK: - Data Parsing Errors 5000-5999
    
    /// Data decoding failed
    case decodingError = 5000
    
    /// Data encoding failed
    case encodingError = 5001
    
    /// Invalid JSON format
    case invalidJSON = 5002
    
    /// Data is corrupted or incomplete
    case dataCorrupted = 5003
    
    // MARK: - Unknown Errors
    
    /// Unknown error occurred
    case unknownError = 9999
}
