//
//  PlannerPage.swift
//  PetPlanner
//
//  Created by Ian Manor on 20/12/20.
//

import SwiftUI

struct PlannerPage<Content: View>: View {
    var backgroundColor = Color.orange
    var content: () -> Content

    var body: some View {
        Card(content: page)
            .padding(.all, 15)
    }

    func page() -> some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                content()
                Spacer()
            }
            Spacer()
        }
    }
}
