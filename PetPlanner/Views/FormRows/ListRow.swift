//
//  SetRow.swift
//  PetPlanner
//
//  Created by Ian Manor on 20/12/20.
//

import SwiftUI

struct ListRow: View {
    var label: String
    var placeholder: String
    @Binding var list: [String]

    var body: some View {
        VStack(alignment: .leading) {
            NavigationLink(destination: EditableList(placeholder: placeholder, list: $list)) {
                Text(label)
            }
            if !list.isEmpty {
                Text(list.joined(separator: ", "))
                    .padding(.vertical, 5)
            }
        }
    }
}

struct EditableList: View {
    @EnvironmentObject var interfaceState: InterfaceState
    var placeholder: String
    @Binding var list: [String]

    var body: some View {
        Form {
            ForEach(list.indices) { index in
                HStack {
                    Text(list[index])
                    Spacer()
                    Button {
                        list.remove(at: index)
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    interfaceState.showTextFieldAlert(title: "Add new \(placeholder):") {
                        list.append($0)
                    }
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}
