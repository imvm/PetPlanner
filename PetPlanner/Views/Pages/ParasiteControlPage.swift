//
//  ParasiteControlPage.swift
//  PetPlanner
//
//  Created by Ian Manor on 20/12/20.
//

import Combine
import SwiftUI

struct ParasiteControlPage: View {
    @Binding var parasiteControlLogs: [ParasiteControlLog]

    var body: some View {
        PlannerPage {
            Form {
                Section(header: header) {}
                ForEach(parasiteControlLogs.indices) { index in
                    Section {
                        DateRow(label: "Date", value: $parasiteControlLogs[index].date)
                        TextRow(label: "Weight", value: $parasiteControlLogs[index].weight)
                        TextRow(label: "Treatment", value: $parasiteControlLogs[index].treatment)
                    }
                }
            }
        }
    }

    var header: some View {
        HStack {
            Text("Parasite Control")
            Spacer()
            if !parasiteControlLogs.isEmpty {
                Button {
                } label: {
                    Image(systemName: "square.and.pencil")
                }
            }
            Button {
                parasiteControlLogs.append(ParasiteControlLog())
            } label: {
                Image(systemName: "plus")
            }
        }
    }
}
