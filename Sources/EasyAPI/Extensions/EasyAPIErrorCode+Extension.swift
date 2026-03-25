//
//  EasyAPIErrorCode+Extension.swift
//  EasyAPI
//
//  Created by Khant Phone Naing  on 25/03/2026.
//

import Foundation

internal extension EasyAPIErrorCode {
    var localizedKey: String.LocalizationValue {
        switch self {
        case .networkUnavailable:
            return "error.network.unavailable"
        case .networkTimeout:
            return "error.network.timeout"
        case .networkConnectionLost:
            return "error.network.connectionLost"
        case .sslError:
            return "error.network.ssl"
        case .dnsResolutionFailed:
            return "error.network.dns"
            
        case .invalidURL:
            return "error.url.invalid"
        case .malformedURL:
            return "error.url.malformed"
            
        case .invalidRequest:
            return "error.request.invalid"
        case .requestTimeout:
            return "error.request.timeout"
        case .requestCancelled:
            return "error.request.cancelled"
            
        case .invalidResponse:
            return "error.response.invalid"
        case .httpError:
            return "error.response.http"
        case .unauthorized:
            return "error.response.unauthorized"
        case .forbidden:
            return "error.response.forbidden"
        case .notFound:
            return "error.response.notFound"
        case .serverError:
            return "error.response.server"
        case .serviceUnavailable:
            return "error.response.serviceUnavailable"
            
        case .decodingError:
            return "error.data.decoding"
        case .encodingError:
            return "error.data.encoding"
        case .invalidJSON:
            return "error.data.jsonInvalid"
        case .dataCorrupted:
            return "error.data.corrupted"
        case .unknownError:
            return "error.unknown"
        }
    }
}
