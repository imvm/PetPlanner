//
//  VaccineLogsPage.swift
//  PetPlanner
//
//  Created by Ian Manor on 20/12/20.
//

import SwiftUI

struct VaccineLogsPage: View {
    @Binding var vaccineLogs: [VaccineLog]

    var body: some View {
        PlannerPage {
            Form {
                Section(header: header) {}
                ForEach(vaccineLogs.indices) { index in
                    Section {
                        TextRow(label: "Name", value: $vaccineLogs[index].name)
                        DateRow(label: "Date", value: $vaccineLogs[index].date)
                        // TODO: Revaccine date reminders
                        DateRow(label: "Revaccine date", value: $vaccineLogs[index].revaccineDate)
                    }
                }
            }
        }
    }

    var header: some View {
        HStack {
            Text("Vaccine Logs")
            Spacer()
            if !vaccineLogs.isEmpty {
                Button {
                } label: {
                    Image(systemName: "square.and.pencil")
                }
            }
            Button {
                vaccineLogs.append(VaccineLog())
            } label: {
                Image(systemName: "plus")
            }
        }
    }
}
