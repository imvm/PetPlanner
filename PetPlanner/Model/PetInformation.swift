//
//  PetInformation.swift
//  PetPlanner
//
//  Created by Ian Manor on 20/12/20.
//

import Foundation
import UIKit

struct PetInformation: Codable {
    var imageData: Data?
    var name = ""
    var species = ""
    var breed = ""
    var birthDate = Date()
    var sex = ""
    var chipNumber = ""
    var allergies: [String] = []
}
