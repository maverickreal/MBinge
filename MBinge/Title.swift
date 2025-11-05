//
//  Title.swift
//  MBinge
//
//  Created by Aditya Saxena on 03/11/25.
//

import Foundation

struct Title: Decodable, Identifiable {
	var id: Int?
	var title: String?
	var name: String?
	var overview: String?
	var posterPath: String?
	
	static var previewTitles = [
		Title(id: 1,
			  title: "BeetleJuice",
			  name: "BeetleJuice",
			  overview: "A movie about BeetleJuice",
			  posterPath: Constants.testTitleURL),
		Title(id: 2,
			  title: "Pulp Fiction",
			  name: "Pulp Fiction",
			  overview: "A movie about Pulp Fiction",
			  posterPath: Constants.testTitleURL2),
		Title(id: 3,
			  title: "The Dark Knight",
			  name: "The Dark Knight",
			  overview: "A movie about the Dark Knight",
			  posterPath: Constants.testTitleURL3)
	]
}

struct ApiObject: Decodable {
	var results: Array<Title> = []
}
