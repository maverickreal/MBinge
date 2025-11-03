//
//  View+Extensions.swift
//  MBinge
//
//  Created by Aditya Saxena on 01/11/25.
//

import SwiftUI

extension Text {
    func ghostButton() -> some View {
        self
            .frame(width: 100, height: 50)
            .foregroundStyle(.buttonText)
            .bold()
            .background(
                RoundedRectangle(
                    cornerRadius: 25,
                    style: .circular
                )
                .stroke(.buttonBorder, lineWidth: 1.5)
            )
    }
}
