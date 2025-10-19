//
//  Subject.swift
//
//  Standard class to describe item in json. 
//
//  Created by Pacheco, Hellen on 10/9/21.
//

import SwiftUI

struct Subject: Codable, Identifiable {
    var id: String
    var name: String
    var releaseDate: String
    var manufacturer: String
    var type: String
    var description: String
    var notableGames: String
    var imageName: String
}
