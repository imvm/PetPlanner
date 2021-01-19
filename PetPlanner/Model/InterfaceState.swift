//
//  InterfaceState.swift
//  PetPlanner
//
//  Created by Ian Manor on 20/12/20.
//

import Foundation

class InterfaceState: ObservableObject {
    @Published var isShowingTextFieldAlert = false
    @Published var alertTitle = ""
    @Published var alertPlaceholder = ""
    @Published var alertAction: (String) -> Void = { _ in }

    func showTextFieldAlert(title: String, placeholder: String = "", alertAction: @escaping (String) -> Void) {
        alertTitle = title
        alertPlaceholder = placeholder
        self.alertAction = alertAction
        isShowingTextFieldAlert = true
    }

    func dismissTextFieldAlert() {
        alertTitle = ""
        alertPlaceholder = ""
        alertAction = { _ in }
        isShowingTextFieldAlert = false
    }
}
