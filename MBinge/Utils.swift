//
//  Utils.swift
//  MBinge
//
//  Created by Aditya Saxena on 06/11/25.
//

struct Utils {
	enum ContentCategory {
		case movie
		case tv
		
		var raw: String {
			switch self {
				case .movie: return "movie"
				case .tv: return "tv"
			}
		}
	}
	
	static func addPosterPath (to titles: inout Array<Title>) {
		for idx in titles.indices {
			if let path = titles[idx].posterPath {
				titles[idx].posterPath = Constants.posterURLStart + path
			}
		}
	}
}
