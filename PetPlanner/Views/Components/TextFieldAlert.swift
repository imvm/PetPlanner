//
//  TextFieldAlert.swift
//  PetPlanner
//
//  Created by Ian Manor on 20/12/20.
//

import SwiftUI

struct TextFieldAlert<Presenting>: View where Presenting: View {
    @EnvironmentObject var interfaceState: InterfaceState
    @State var text: String = ""
    @Binding var isShowing: Bool
    let placeholder: String
    let presenting: Presenting
    let title: String
    let action: (String) -> Void

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                presenting.disabled(isShowing)
                if isShowing {
                    alert(size: proxy.size)
                }
            }
        }
    }

    func alert(size: CGSize) -> some View {
        Card(borderColor: Color(.lightGray), borderWidth: 1) {
            VStack {
                Text(title)
                TextField(placeholder, text: $text)
                Divider()
                HStack {
                    Button {
                        interfaceState.dismissTextFieldAlert()
                        action(text)
                    } label: {
                        Text("Done").bold()
                    }
                    .padding(.trailing, 30)
                    Rectangle()
                        .frame(width: 1, height: 25)
                        .foregroundColor(Color(.lightGray))
                    Button {
                        interfaceState.dismissTextFieldAlert()
                    } label: {
                        Text("Cancel")
                    }
                    .padding(.leading, 30)
                }
            }
            .frame(width: size.width * 0.6)
            .padding(.all, 10)
        }
    }
}

extension View {
    func textFieldAlert(isShowing: Binding<Bool>,
                        placeholder: String,
                        title: String,
                        action: @escaping (String) -> Void) -> some View {
        TextFieldAlert(isShowing: isShowing,
                       placeholder: placeholder,
                       presenting: self,
                       title: title,
                       action:  action)
    }
}
