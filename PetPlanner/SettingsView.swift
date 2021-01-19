//
//  LoginView.swift
//  PetPlanner
//
//  Created by Ian Manor on 20/12/20.
//

import SwiftUI
import AuthenticationServices

struct SettingsView: View {
    var body: some View {
        Form {
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Text("Keep data in sync:")
                        .bold()
                    Spacer()
                    signInWithAppleButton
                    Spacer()
                }
                Spacer()
            }
        }
    }

    var signInWithAppleButton: some View {
        SignInWithAppleButton(.signIn) { request in

        } onCompletion: { result in

        }
        .signInWithAppleButtonStyle(.black)
        .frame(width: 200, height: 40)
    }
}
