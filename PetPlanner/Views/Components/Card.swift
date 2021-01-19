//
//  Card.swift
//  PetPlanner
//
//  Created by Ian Manor on 20/12/20.
//

import SwiftUI

struct Card<Content: View> : View {
    var color: Color
    var content: () -> Content
    var borderColor: Color
    var borderWidth: CGFloat
    var borderDashSize: CGFloat?

    init(color: Color = Color(.systemGroupedBackground),
         borderColor: Color = .clear,
         borderWidth: CGFloat = 0,
         borderDashSize: CGFloat? = nil,
         content: @escaping () -> Content) {
        self.color = color
        self.content = content
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.borderDashSize = borderDashSize
    }

    var body: some View {
        content()
        .background(color)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: color.opacity(0.3), radius: 20, x: 0, y: 10)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(style: StrokeStyle(lineWidth: borderWidth, dash: dash))
                .foregroundColor(borderColor)
        )
    }

    var dash: [CGFloat] {
        guard let size = borderDashSize else { return [] }
        return [size]
    }
}
