//
//  PlannerCard.swift
//  PetPlanner
//
//  Created by Ian Manor on 20/12/20.
//

import SwiftUI

struct PlannerCard: View {
    @State var planner: Planner

    var body: some View {
        Card {
            HStack {
                Text(planner.name)
                Spacer()
            }
            .padding(.all, 20)
        }
    }
}

struct AddPlannerCard: View {
    var body: some View {
        Card(color: .white,
             borderColor: .blue,
             borderWidth: 2,
             borderDashSize: 8) {
            HStack {
                Spacer()
                Image(systemName: "plus")
                Spacer()
            }
            .padding(.all, 20)
        }
    }
}
