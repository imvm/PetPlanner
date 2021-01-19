//
//  AvatarImage.swift
//  PetPlanner
//
//  Created by Ian Manor on 20/12/20.
//

import SwiftUI

struct AvatarImage: View {
    var imageData: Data?
    var systemName: String

    var body: some View {
        imageView
            .frame(width: 150, height: 150)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .strokeBorder(style: StrokeStyle(lineWidth: 1))
                    .foregroundColor(.gray)
            )
    }

    @ViewBuilder
    var imageView: some View {
        if let imageData = imageData, let image = UIImage(data: imageData) {
            Image(uiImage: image)
                .resizable()
        } else {
            Image(systemName: systemName)
        }
    }
}
