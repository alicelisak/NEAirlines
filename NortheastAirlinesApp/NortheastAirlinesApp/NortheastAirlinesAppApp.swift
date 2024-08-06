//
//  NortheastAirlinesAppApp.swift
//  NortheastAirlinesApp
//
//  Created by Alice Lisak on 6/6/24.
//

import SwiftUI
import Firebase

@main
struct NortheastAirlinesAppApp: App {
    //@StateObject var dataManager = DataManager()
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            CustomTabBar()
            
        }
    }
}
