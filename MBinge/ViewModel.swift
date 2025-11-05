//
//  ViewModel.swift
//  MBinge
//
//  Created by Aditya Saxena on 06/11/25.
//

import Foundation

@Observable
class ViewModel {
	enum FetchStatus {
		case notStarted
		case fetching
		case success
		case failed(innerError: Error)
	}
	
	private(set) var homeStatus: FetchStatus = .notStarted
	private let dataFetcher = DataFetcher()
	var trendingMovies: Array<Title> = []
	
	func getTitles () async {
		homeStatus = .fetching
		
		do {
			trendingMovies = try await dataFetcher.fetchTitles (
				for: Utils.ContentCategory.movie.raw
			)
			homeStatus = .success
		} catch {
			print("Error \n\(error)")
			homeStatus = .failed(innerError: error)
		}
	}
}
