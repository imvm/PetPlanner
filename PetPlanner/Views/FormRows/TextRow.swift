//
//  TextRow.swift
//  PetPlanner
//
//  Created by Ian Manor on 20/12/20.
//

import SwiftUI

struct TextRow: View {
    var label: String
    @Binding var value: String

    var body: some View {
        HStack {
            Text(label)
            TextField(label, text: $value)
                .multilineTextAlignment(.trailing)
        }
    }
}
