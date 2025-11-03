//
//  HomeView.swift
//  MBinge
//
//  Created by Aditya Saxena on 01/11/25.
//

import SwiftUI

struct HomeView: View {
	var heroTestTitle = Constants.testTitleURL
	
	var body: some View {
		GeometryReader {
			geo in
			ScrollView(.vertical) {
				LazyVStack {
					AsyncImage(
						url: URL(string: self.heroTestTitle),
						content: { image in
							image
								.resizable()
								.scaledToFit()
								.overlay(
									LinearGradient(
										stops: [Gradient.Stop(color: .clear, location: 0.8),
												Gradient.Stop(color: .gradient, location: 1)],
										startPoint: .top,
										endPoint: .bottom
									)
								)
						},
						placeholder: {
							ProgressView()
						}
					)
					.frame(width: geo.size.width, height: geo.size.height*0.8)
					
					HStack {
						Button(
							action: {
								
							},
							label: {
								Text(Constants.vidPlayStr)
									.ghostButton()
							}
						)
						
						Button(
							action: {
								
							},
							label: {
								Text(Constants.downloadTabStr)
									.ghostButton()
							}
						)
					}

					HorizontalListView(header: Constants.topRatedMovieStr)
					HorizontalListView(header: Constants.trendMovieStr)
					HorizontalListView(header: Constants.topRatedTVStr)
					HorizontalListView(header: Constants.trendTVStr)
				}
			}
		}
	}
}

#Preview {
	HomeView()
}
