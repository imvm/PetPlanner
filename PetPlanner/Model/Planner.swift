//
//  Planner.swift
//  PetPlanner
//
//  Created by Ian Manor on 20/12/20.
//

import Foundation

public struct Planner: Identifiable, Codable, Equatable {
    public static func == (lhs: Planner, rhs: Planner) -> Bool {
        lhs.id == rhs.id
    }

    public let id: Int
    var petInformation = PetInformation()
    var tutorInformation = TutorInformation()
    var vaccineLogs: [VaccineLog] = []
    var internalParasiteControlLogs: [ParasiteControlLog] = []
    var externalParasiteControlLogs: [ParasiteControlLog] = []
    var notes = ""

    var name: String {
        petInformation.name.isEmpty ? "Unnamed" : petInformation.name
    }

    init(id: Int, petName: String = "") {
        self.id = id
        self.petInformation.name = petName
    }
}
