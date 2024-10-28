//
//  UserModel.swift
//  BodyFit
//
//  Created by Jumman Hossen on 28/10/24.
//

import Foundation

struct UserModel: Identifiable {
    let id: UUID = UUID()
    var email: String
    var password: String
    var name: String
}
