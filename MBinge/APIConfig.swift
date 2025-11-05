//
//  APICOonfig.swift
//  MBinge
//
//  Created by Aditya Saxena on 04/11/25.
//

import Foundation

struct APIConfig: Decodable {
	let tmdbBaseURL: String
	let tmdbAPIKey: String
	
	static let shared: APIConfig? = {
		do {
			return try loadConfig()
		} catch {
			print("Failed loading API config! \(error)")
			return nil
		}
	}()

	private static func loadConfig() throws -> APIConfig {
		guard let url = Bundle.main.url(forResource: ".API_CONFIG", withExtension: "json") else {
			throw APIConfigError.FileNotFound
		}
		
		do {
			let data = try Data(contentsOf: url)
			return try JSONDecoder().decode(APIConfig.self, from: data)
		} catch let err as DecodingError {
			throw APIConfigError.decodingFaliure(innerError: err)
		} catch {
			throw APIConfigError.DataLoadingFailure(innerError: error)
		}
	}
}
