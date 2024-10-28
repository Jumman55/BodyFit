//
//   AuthViewModel.swift
//  BodyFit
//
//  Created by Jumman Hossen on 28/10/24.
//

import Foundation

// ViewModel for handling user authentication actions
class AuthViewModel: ObservableObject {
    // Published properties for binding with the LoginView
    @Published var email: String = ""       // User's email input
    @Published var password: String = ""    // User's password input
    
    // Placeholder login function (implement actual logic later)
    func login() {
        print("Logging in with email: \(email) and password: \(password)")
        // Add authentication logic here (e.g., API call)
    }
    
    // Placeholder signup function (implement actual logic later)
    func signup() {
        print("Signing up with email: \(email) and password: \(password)")
        // Add signup logic here (e.g., API call or database storage)
    }
}
