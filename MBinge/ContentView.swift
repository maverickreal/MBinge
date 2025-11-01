//
//  ContentView.swift
//  MBinge
//
//  Created by Aditya Saxena on 31/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		TabView {
			Tab (Constants.homeTabStr, systemImage: Constants.homeTabIconStr) {
				Text(Constants.homeTabStr)
			}
			Tab (Constants.upcomingTabStr, systemImage: Constants.upcomingTabIconStr) {
				Text(Constants.upcomingTabStr)
			}
			Tab (Constants.searchTabStr, systemImage: Constants.searchTabIconStr) {
				Text(Constants.searchTabStr)
			}
			Tab (Constants.downloadTabStr, systemImage: Constants.downloadTabIconStr) {
				Text(Constants.downloadTabStr)
			}
		}
    }
}

#Preview {
	ContentView().preferredColorScheme(.dark)
}
