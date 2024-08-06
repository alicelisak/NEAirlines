//
//  SearchResultsViewModel.swift
//  NortheastAirlinesApp
//
//  Created by Alice Lisak on 7/30/24.
//

import Foundation
import FirebaseAuth

class SearchResultsViewModel: ObservableObject {
    
    @Published var sortBy = "Price"
    let sortByOptions = ["Price", "Duration", "Departure Time"]
    @Published var departureFlights = [
        Flight(isReturnFlights: false, flightNum: 8917, departureTime: "07:00", arrivalTime: "09:00", date: "12/24/2024", totalTime: "2hr 0m", cost: "150", costBusiness: "250", costFirst: "290", hasWifi: true, isNonstop: true, fromAirport: "JFK", toAirport: "LAX"),
        Flight(isReturnFlights: false, flightNum: 4537, departureTime: "10:00", arrivalTime: "14:00", date: "12/25/2024", totalTime: "4hr 0m", cost: "200", costBusiness: "250", costFirst: "290", hasWifi: false, isNonstop: true, fromAirport: "JFK", toAirport: "LAX"),
        Flight(isReturnFlights: false, flightNum: 9067, departureTime: "15:00", arrivalTime: "18:00", date: "12/26/2024", totalTime: "3hr 0m", cost: "280", costBusiness: "350", costFirst: "390", hasWifi: true, isNonstop: true, fromAirport: "JFK", toAirport: "LAX"),
        Flight(isReturnFlights: false, flightNum: 0887, departureTime: "20:00", arrivalTime: "23:00", date: "12/27/2024", totalTime: "3hr 0m", cost: "370", costBusiness: "450", costFirst: "490",hasWifi: false, isNonstop: true, fromAirport: "JFK", toAirport: "LAX"),
        Flight(isReturnFlights: false, flightNum: 02348, departureTime: "12:00", arrivalTime: "15:00", date: "12/28/2024", totalTime: "3hr 0m", cost: "380", costBusiness: "450", costFirst: "490",hasWifi: true, isNonstop: true, fromAirport: "JFK", toAirport: "LAX")
    ]
    
    @Published var returnFlights = [
        Flight(isReturnFlights: true, flightNum: 2004, departureTime: "12:23", arrivalTime: "15:30", date: "12/28/2024", totalTime: "5hr 25m", cost: "380", costBusiness: "450", costFirst: "490",hasWifi: false, isNonstop: true, fromAirport: "LAX", toAirport: "JFK"),
        Flight(isReturnFlights: true, flightNum: 9017, departureTime: "16:10", arrivalTime: "12:47", date: "12/24/2024", totalTime: "5hr 25m", cost: "150", costBusiness: "250", costFirst: "290", hasWifi: true, isNonstop: true, fromAirport: "LAX", toAirport: "JFK"),
        Flight(isReturnFlights: true,flightNum: 2456, departureTime: "21:15", arrivalTime: "05:40", date: "12/25/2024", totalTime: "5hr 37m", cost: "200", costBusiness: "250", costFirst: "290", hasWifi: true, isNonstop: true, fromAirport: "LAX", toAirport: "JFK"),
        Flight(isReturnFlights: true,flightNum: 1118, departureTime: "22:15", arrivalTime: "06:40", date: "12/26/2024", totalTime: "5hr 38m", cost: "280", costBusiness: "350", costFirst: "390", hasWifi: true, isNonstop: true, fromAirport: "LAX", toAirport: "JFK"),
        Flight(isReturnFlights: true,flightNum: 0090, departureTime: "23:09", arrivalTime: "08:13", date: "12/27/2024", totalTime: "5hr 40m", cost: "370", costBusiness: "450", costFirst: "490",hasWifi: false, isNonstop: true, fromAirport: "LAX", toAirport: "JFK")
    ]
}

struct Flight: Identifiable {
    let id = UUID()
    let isReturnFlights: Bool
    let flightNum: Int
    let departureTime: String
    let arrivalTime: String
    let date: String
    let totalTime: String
    let cost: String
    let costBusiness: String
    let costFirst: String
    let hasWifi: Bool
    let isNonstop: Bool
    let fromAirport: String
    let toAirport: String
}
    
    

