//
//  JSONLoader.swift
//  BodyFit
//
//  Created by Jumman Hossen on 28/10/24.
//

//import Foundation
//
//class JSONLoader {
//    static func loadUserData() -> User? {
//        guard let url = Bundle.main.url(forResource: "User", withExtension: "json") else {
//            print("User.json file not found.")
//            return nil
//        }
//        
//        do {
//            let data = try Data(contentsOf: url)
//            print("Success: User.json file loaded.")
//            let user = try JSONDecoder().decode(User.self, from: data)
//            print("Success: User data decoded successfully.")
//            return user
//        } catch {
//            print("Error decoding User.json: \(error)")
//            return nil
//        }
//    }
//}
