//
//  HomeViewModel.swift
//  NortheastAirlinesApp
//
//  Created by Alice Lisak on 7/10/24.
//

import Foundation
import FirebaseAuth

class HomeViewModel: ObservableObject{
    @Published var currentUserId: String = ""
    @Published var selectedDate = Date()
    @Published var departingDate: Date = Date()
    @Published var arrivalDate: Date = Date().addingTimeInterval(60*60*24)
    @Published var numOfPassengers = 1
    @Published var oneWay = false
    @Published var nonStop = false
    @Published var carryOnIncluded = false
    @Published var sortBy = "Price"
    @Published var showingSameLocationError = false
    @Published var showingInvalidDateError = false
    
    let sortByOptions = ["Price", "Duration", "Departure Time"]
    let flyingOptions = ["Atlanta, ATL", "Dallas/Fort Worth, DFW", "Denver, DEN", "Chicago, ORD", "Los Angeles, LAX", "New York City, JFK", "Las Vegas, LAS", "Orlando, MCO", "Miami, MIA", "Charlotte, CLT", "Seattle/Tacoma, SEA", "Phoenix, PHX", "Newark, EWR", "San Francisco, SFO", "Houston, IAH", "Boston, BOS", "Fort Lauderdale, FLL", "Minneapolis/Saint Paul, MSP", "New York City, LGA", "Detroit, DTW", "Philadelphia, PHL", "Salt Lake City, SLC", "Washington, D.C., DCA", "San Diego, SAN", "Baltimore/Washington, BWI", "Tampa, TPA", "Austin, AUS", "Washington, D.C., IAD", "Nashville, BNA", "Chicago, MDW", "Raleigh-Durham, RDU"]
    @Published var flyingTo: String = "Newark, EWR"
    @Published var flyingFrom: String = "Boston, BOS"
      

    
    
    private var handler: AuthStateDidChangeListenerHandle?
    
    let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "  MM/dd/yyyy"
            return formatter
        }()
    
    
    init () {
        self.handler = Auth.auth().addStateDidChangeListener {[weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
        
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
        
        
    }
}
