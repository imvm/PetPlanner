//
//  DateRow.swift
//  PetPlanner
//
//  Created by Ian Manor on 20/12/20.
//

import SwiftUI

struct DateRow: View {
    var label: String
    @Binding var value: Date

    var body: some View {
        DatePicker(label, selection: $value, displayedComponents: .date)
    }
}
