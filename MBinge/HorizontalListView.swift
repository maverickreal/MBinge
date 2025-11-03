//
//  HorizontalListView.swift
//  MBinge
//
//  Created by Aditya Saxena on 01/11/25.
//

import SwiftUI

struct HorizontalListView: View {
	let header: String
	let titles = [Constants.testTitleURL3, Constants.testTitleURL2, Constants.testTitleURL];
	
    var body: some View {
		VStack(alignment: .leading) {
			Text(header).font(.title)
			
			ScrollView(.horizontal) {
				LazyHStack {
					ForEach(titles,
							id: \.self,
							content: {
								title in
								AsyncImage(url: URL(string: title),
										   content: {
												image in
												image
													.resizable()
													.scaledToFit()
													.clipShape(RoundedRectangle(cornerRadius: 10))},
											placeholder: {
												ProgressView()
											})
								.frame(width: 150, height: 200)
					})
				}
			}
		}
		.frame(height: 300)
		.padding(5)
    }
}

#Preview {
	HorizontalListView(header: Constants.trendMovieStr)
}
