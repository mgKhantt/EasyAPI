//
//  EasyAPI+Error.swift
//  EasyAPI
//
//  Created by Khant Phone Naing  on 25/03/2026.
//

import Foundation

public enum EasyAPIError: Error, LocalizedError {
    case network(EasyAPIErrorCode, underlying: URLError?)
    case url(EasyAPIErrorCode)
    case request(EasyAPIErrorCode)
    case response(EasyAPIErrorCode, statusCode: Int?, data: Data?)
    case decoding(EasyAPIErrorCode, underlying: Error?)
    case unknown(EasyAPIErrorCode, underlying: Error?)
    
    private var prefix: String {
        return "[EasyAPI][EasyAPIError]"
    }
    
    // MARK: - Code
    
    //Error code
    public var code: EasyAPIErrorCode {
        switch self {
            case .network(let easyAPIErrorCode, _):
                easyAPIErrorCode
            case .url(let easyAPIErrorCode):
                easyAPIErrorCode
            case .request(let easyAPIErrorCode):
                easyAPIErrorCode
            case .response(let easyAPIErrorCode, _, _):
                easyAPIErrorCode
            case .decoding(let easyAPIErrorCode, _):
                easyAPIErrorCode
            case .unknown(let easyAPIErrorCode, _):
                easyAPIErrorCode
        }
    }
    
    // MARK: - Error Description
    
    // Error Description
    public var errorDescription: String? {
        switch self {
        case .network(let code, let error):
            let err: String
            if let error = error {
                err = "(\(error.failureURLString ?? "N/A")) -> \(error.localizedDescription)"
            } else {
                err = "(N/A) -> No specific error information available"
            }
            
            switch code {
                case .networkUnavailable: return "\(prefix) Network connection is unavailable. Please check your settings and try again. err: \(err)"
                case .networkTimeout: return "\(prefix) Network request timed out. Please try again later. err: \(err)"
                case .networkConnectionLost: return "\(prefix) Network connection was lost. Please try again. err: \(err)"
                case .sslError: return "\(prefix) SSL secure connection failed. err: \(err)"
                case .dnsResolutionFailed: return "\(prefix) DNS resolution failed. Please check your network. err: \(err)"
                default: return "\(prefix) A network error occurred. Please try again later. err: \(err)"
            }
            
        case .url(let code):
            switch code {
                case .invalidURL: return "\(prefix) Invalid request URL"
                case .malformedURL: return "\(prefix) Malformed URL format"
                default: return "\(prefix) URL Error"
            }
            
        case .request(let code):
            switch code {
                case .invalidRequest: return "\(prefix) Invalid request parameters"
                case .requestTimeout: return "\(prefix) Request timed out. Please try again later"
                case .requestCancelled: return "\(prefix) Request was cancelled"
                default: return "\(prefix) Request Error"
            }
            
        case .response(_, let statusCode, let data):
            let responseString: String
            if let data = data {
                responseString = String(data: data, encoding: .utf8) ?? "\(prefix) Unable to parse response content"
            } else {
                responseString = "\(prefix) No response data"
            }
            
            // Do not display responseString for 404 errors
            if statusCode == 404 {
                return "\(prefix) Server response error. Status Code: \(statusCode ?? -1)."
            } else {
                return "\(prefix) Server response error. Status Code: \(statusCode ?? -1), Response: \(responseString)"
            }
            
        case .decoding(let code, _):
            switch code {
                case .decodingError: return "\(prefix) Data decoding failed"
                case .encodingError: return "\(prefix) Data encoding failed"
                case .invalidJSON: return "\(prefix) Invalid JSON format"
                case .dataCorrupted: return "\(prefix) The returned data is corrupted or incomplete"
                default: return "\(prefix) Data processing error"
            }
            
        case .unknown(_, let error):
            return "\(prefix) An unknown error occurred. Please try again later. \(error.debugDescription)"
        }
    }
    
    // MARK: - Response Data Access
    public var respData: Data? {
        switch self {
            case .response(_, _, let data): return data
            default: return nil
        }
    }
    
    // Returns the localized message corresponding to the specific error type.
    public static func localizedErrorDescription(_ code: EasyAPIErrorCode) -> LocalizedStringResource {
        LocalizedStringResource(
            code.localizedKey,
            bundle: .module
        )
    }
}
