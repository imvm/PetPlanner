//
//  PetInformationPage.swift
//  PetPlanner
//
//  Created by Ian Manor on 20/12/20.
//

import SwiftUI

struct PetInformationPage: View {
    @State var showPhotoLibrary = false
    @Binding var petInformation: PetInformation
    @Binding var tutorInformation: TutorInformation

    var body: some View {
        PlannerPage {
            VStack {
                HStack {
                    Button {
                        showPhotoLibrary = true
                    } label: {
                        AvatarImage(imageData: petInformation.imageData, systemName: "photo")
                    }
                }
                Form {
                    Section(header: Text("Pet Information")) {
                        TextRow(label: "Name", value: $petInformation.name)
                        TextRow(label: "Breed", value: $petInformation.breed)
                        DateRow(label: "Birth date", value: $petInformation.birthDate)
                        TextRow(label: "Sex", value: $petInformation.sex)
                        TextRow(label: "Chip number", value: $petInformation.chipNumber)
                        ListRow(label: "Allergies", placeholder: "allergy", list: $petInformation.allergies)
                    }
                    Section(header: Text("Tutor Information")) {
                        TextRow(label: "Tutor", value: $tutorInformation.name)
                        TextRow(label: "Address", value: $tutorInformation.address)
                        TextRow(label: "Phone number", value: $tutorInformation.phoneNumber)
                        TextRow(label: "Email", value: $tutorInformation.email)
                    }
                }
            }
        }
        .sheet(isPresented: $showPhotoLibrary) {
            ImagePicker { image in
                petInformation.imageData = image.pngData()
            }
        }
    }

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
