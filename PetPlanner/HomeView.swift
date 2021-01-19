//
//  HomeView.swift
//  PetPlanner
//
//  Created by Ian Manor on 20/12/20.
//

import SwiftUI
import ComposableArchitecture

extension Binding: Identifiable where Value == Planner {
    public var id: Int { wrappedValue.id }
}

struct HomeView: View {
    @EnvironmentObject var interfaceState: InterfaceState
    let store: Store<AppState, AppAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                ScrollView {
                    LazyVStack {
                        ForEach(viewStore.planners.indices) { index in
                            Button {
                                viewStore.send(.tapPlannerRow(index: index))
//                                selectedPlanner = Binding(get: {
//                                    planners[index]
//                                }, set: {
//                                    planners[index] = $0
//                                })
                            } label: {
                                PlannerCard(planner: viewStore.planners[index])
                                    .padding(.horizontal, 20)
                            }
                        }
                        Button {
                            interfaceState.showTextFieldAlert(title: "Add new pet:", placeholder: "Pet name") { petName in
                                viewStore.send(.addPlanner(Planner(id: id, petName: petName)))
                                id += 1
                            }
                        } label: {
                            AddPlannerCard()
                                .padding(.horizontal, 20)
                        }
                    }
                }
//                .alert
//                .sheet(isPresented: viewStore.binding) {
//                    SettingsView()
//                }
//                .navigation(item: $selectedPlanner) {
//                    PlannerView(planner: $0)
//                }
//                .navigationBarTitle(Text("My Pets"), displayMode: .large)
//                .toolbar {
//                    ToolbarItem(placement: .navigationBarTrailing) {
//                        Button {
//                            showSettings = true
//                        } label: {
//                            Image(systemName: "gear")
//                        }
//                    }
//                }
            }
        }
    }
}
