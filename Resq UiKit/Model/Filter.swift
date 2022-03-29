//
//  Filter.swift
//  Resq UiKit
//
//  Created by Bryan Khufa on 28/07/21.
//

import Foundation

enum AgeEnum {
    case all
    case adult
    case puppy
}

enum GenderEnum {
    case all, male, female
}

struct DogFilter: Codable{
    var byGender = ""
    var byAge = ""
    var byLocation = ""
}
