//
//  Errors.swift
//  MBinge
//
//  Created by Aditya Saxena on 05/11/25.
//

import Foundation

enum APIConfigError: Error, LocalizedError {
	case FileNotFound
	case DataLoadingFailure(innerError: Error)
	case decodingFaliure(innerError: Error)
	
	var errorDescription: String? {
		switch self {
			case .FileNotFound:
				return "API configuration file not found!"
			case .DataLoadingFailure(innerError: let innerError):
				return "Failed to load API configuration data! \(innerError.localizedDescription)"
			case .decodingFaliure(innerError: let innerError):
				return "Failed to decode API configuration data! \(innerError.localizedDescription)"
		}
	}
}

enum NetworkError: Error, LocalizedError {
	case badUrlResponse(innerError: Error)
	case missingConfig
	case URLBuildFailed
	case invalidHttpresponse
	
	var errorDescription: String? {
		switch self {
			case .badUrlResponse(innerError: let innerError):
				return "Failed parsing the URL response! \(innerError.localizedDescription)"
				
			case .missingConfig:
				return "Missing API configuration!"

			case .URLBuildFailed:
				return "Failed to build the URL!"
				
			case .invalidHttpresponse:
				return "Invalid HTTP response!"
		}
	}
}
