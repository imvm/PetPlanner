//
//  ContentView.swift
//  PetPlanner
//
//  Created by Ian Manor on 19/12/20.
//

import SwiftUI

struct PlannerView: View {
    @Binding var planner: Planner

    init(planner: Binding<Planner>) {
        self._planner = planner
    }

    var body: some View {
        PageView(pages: [
            PetInformationPage(petInformation: $planner.petInformation, tutorInformation: $planner.tutorInformation).typeErased,
                VaccineLogsPage(vaccineLogs: $planner.vaccineLogs).typeErased,
                ParasiteControlPage(parasiteControlLogs: $planner.internalParasiteControlLogs).typeErased,
                ParasiteControlPage(parasiteControlLogs: $planner.externalParasiteControlLogs).typeErased,
                PlannerPage { notes }.typeErased,
            ],
            pageIndicatorTintColor: Color(.systemBackground),
            currentPageIndicatorTintColor: Color(.secondarySystemBackground)
        )
        .navigationBarTitle(Text(planner.name), displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showActionSheet()
                } label: {
                    Image(systemName: "square.and.arrow.up")
                }
            }
        }
    }

    var notes: some View {
        Form {
            Section(header: Text("Notes")) {
                TextEditor(text: $planner.notes)
            }
        }
    }

    func showActionSheet() {
        let url = URL(string: "https://www.petplannerapp.com")!
        let activityViewController = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityViewController, animated: true, completion: nil)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlannerView(planner: .init(id: 1))
//    }
//}
