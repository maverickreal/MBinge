//
//  DataFetcher.swift
//  MBinge
//
//  Created by Aditya Saxena on 05/11/25.
//

import Foundation

struct DataFetcher {
	let tmdbBaseUrl = APIConfig.shared?.tmdbBaseURL
	let tmdbAPIKey = APIConfig.shared?.tmdbAPIKey
	
	func fetchTitles (for media: String) async throws -> Array<Title> {
		print("#@!1 \(tmdbAPIKey) \(tmdbBaseUrl)")
		guard let baseUrl = tmdbBaseUrl else {
			throw NetworkError.missingConfig
		}
		
		guard let apiKey = tmdbAPIKey else {
			throw NetworkError.missingConfig
		}
		
		guard let fetchTitlesURL = URL(string: baseUrl)?
			.appendingPathComponent("3/trending/\(media)/day")
			.appending(queryItems: [
				URLQueryItem(name: "api_key", value: apiKey)
			]) else {
			throw NetworkError.URLBuildFailed
		}
		print(fetchTitlesURL)
		
		let (data, urlResponse) = try await URLSession.shared.data(from: fetchTitlesURL)
		
		guard let response = urlResponse as? HTTPURLResponse, response.statusCode == 200 else {
			throw NetworkError.invalidHttpresponse
		}
		
		let decoder = JSONDecoder()
		decoder.keyDecodingStrategy = .convertFromSnakeCase
		
		var titles = try decoder
			.decode(ApiObject.self,
					from: data)
			.results
		Utils.addPosterPath(to: &titles)
		
		return titles
	}
}
