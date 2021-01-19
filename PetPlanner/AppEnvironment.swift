//
//  AppEnvironment.swift
//  PetPlanner
//
//  Created by Ian Manor on 20/12/20.
//

import ComposableArchitecture

struct AppEnvironment {
    var mainQueue: AnySchedulerOf<DispatchQueue>
}

enum AppAction: Equatable {
    case addPlanner(Planner)
    case tapPlannerRow(index: Int)
}

struct AppState: Equatable {
    var planners: [Planner] = []
    var selectedPlanner: Planner?
    var showSettings = false
    var id = 1
}

let appReducer = Reducer<AppState, AppAction, AppEnvironment> { state, action, environment in
    switch action {
    case let .addPlanner(planner):
        state.planners.append(planner)
        return .none
    case let .tapPlannerRow(index: index):
        state.selectedPlanner = state.planners[index]
        return .none
    }
}
