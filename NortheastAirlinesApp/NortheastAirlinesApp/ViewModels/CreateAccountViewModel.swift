//
//  CreateAccountViewModel.swift
//  NortheastAirlinesApp
//
//  Created by Alice Lisak on 7/10/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class CreateAccountViewModel: ObservableObject{
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmpassword: String = ""
    @Published var firstname: String = ""
    @Published var middlename: String = ""
    @Published var lastname: String = ""
    @Published var confirmPassword: String = ""
    @Published var phonenumber: String = ""
    @Published var loyaltynumber: Int = Int(arc4random_uniform(99999))
    @Published var errorMessage = ""
    
    let genderOptions = ["Male", "Female", "Other"]
    @Published var selectedGender: String = "Male"
    @Published var dateOfBirth = Date()
    
    init() {}
    
    func register() {
        guard validate() else{
            return
        }
        Auth.auth().createUser(withEmail: email, password: password){ [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userId)
        }
    }
    private func insertUserRecord(id: String){
        let newUser = User(
                        id: id,
                        firstname: firstname,
                        middlename: middlename,
                        lastname: lastname,
                        email: email,
                        password: password,
                        gender: selectedGender,
                        dateOfBirth: dateOfBirth,
                        joined: Date().timeIntervalSince1970,
                        phonenumber: phonenumber,
                        loyaltynumber: loyaltynumber
        )
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary()) {error in
                if let error = error {
                    print("Error writing document: \(error)")
                } else {
                    print("Document successfully written!")
                }
            }
    
    }

    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Please fill in all fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Please enter valid email"
            return false
        }
        
        guard password.count >= 6 else {
            return false
        }
        guard confirmpassword == password else {
            return false
        }
        guard !lastname.trimmingCharacters(in: .whitespaces).isEmpty,
              !phonenumber.trimmingCharacters(in: .whitespaces).isEmpty,
              !firstname.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            return false
        }
        
        return true
    }
    
}
