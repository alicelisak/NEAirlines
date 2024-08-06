//
//  User.swift
//  NortheastAirlinesApp
//
//  Created by Alice Lisak on 7/11/24.
//

import Foundation

struct User: Codable {
    let id: String
    let firstname: String
    let middlename: String
    let lastname: String
    let email: String
    let password: String
    let gender: String
    let dateOfBirth: Date
    let joined: TimeInterval
    let phonenumber: String
    let loyaltynumber: Int
    
}
