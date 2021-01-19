//
//  PetPlannerApp.swift
//  PetPlanner
//
//  Created by Ian Manor on 19/12/20.
//

import SwiftUI
import ComposableArchitecture

@main
struct PetPlannerApp: App {
    @ObservedObject var interfaceState = InterfaceState()
    let store = Store<AppState, AppAction>(
            initialState: AppState(),
            reducer: appReducer,
            environment: AppEnvironment(
            mainQueue: DispatchQueue.main.eraseToAnyScheduler()
        )
    )

    var body: some Scene {
        WindowGroup {
            WithViewStore(store) { viewStore in
                HomeView(store: store)
                    .textFieldAlert(
                        isShowing: $interfaceState.isShowingTextFieldAlert,
                        placeholder: interfaceState.alertPlaceholder,
                        title: interfaceState.alertTitle,
                        action: interfaceState.alertAction
                    )
                    .environmentObject(interfaceState)
            }
        }
    }
}
