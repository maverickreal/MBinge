//
//  HorizontalListView.swift
//  MBinge
//
//  Created by Aditya Saxena on 01/11/25.
//

import SwiftUI

struct HorizontalListView: View {
	let header: String
	let titles: Array<Title>
	
    var body: some View {
		VStack(alignment: .leading) {
			Text(header).font(.title)
			
			ScrollView(.horizontal) {
				LazyHStack {
					ForEach(titles) {
						title in
						AsyncImage(url: URL(string: title.posterPath ?? ""),
								   content: {
										image in
										image
											.resizable()
											.scaledToFit()
											.clipShape(RoundedRectangle(cornerRadius: 10))
									},
									placeholder: {
										ProgressView()
									}
								).frame(width: 150, height: 200)
					}
				}
			}
		}
		.frame(height: 300)
		.padding(5)
    }
}

#Preview {
	HorizontalListView(header: Constants.trendMovieStr, titles: Title.previewTitles)
}
