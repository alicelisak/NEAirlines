//
//  FlightOptionView.swift
//  NortheastAirlinesApp
//
//  Created by Alice Lisak on 7/30/24.
//

import SwiftUI

struct FlightOptionView: View {
    var isReturnFlights: Bool
    var showStartingAt: Bool
    var flightNum: Int
    var departureTime: String
    var arrivalTime: String
    var dateOfFlight: String
    var totalTime: String
    var cost: String
    var costBusiness: String
    var costFirst: String
    var hasWifi: Bool
    var isNonstop: Bool
    var fromAirport: String
    var toAirport: String

    var body: some View {
        NavigationLink(destination: FlightDetailView(isReturnFlights: isReturnFlights, flightNum: flightNum, departureTime: departureTime, arrivalTime: arrivalTime, dateOfFlight: dateOfFlight, totalTime: totalTime, cost: cost, costBusiness: costBusiness, costFirst: costFirst, hasWifi: hasWifi, isNonstop: isNonstop, fromAirport: fromAirport, toAirport: toAirport)) {
            VStack {
                HStack {
                    Text("\(departureTime) - \(arrivalTime)")
                        .font(.title)
                        .bold()
                        .foregroundColor(.black)
                    Spacer()
                    VStack{
                        if showStartingAt {
                            Text("STARTING AT")
                                .font(.headline)
                                .foregroundColor(.customGreen)
                        }
                        Text(showStartingAt ? "$\(cost)": "\(cost)")
                            .font(.title2)
                            .padding(.leading)
                            .foregroundColor(.customGreen)
                            .bold()
                    }
                    
                }
                HStack{
                    VStack{
                        Text("TOTAL TIME: \(totalTime)")
                            .font(.subheadline)
                            .padding(.trailing, 35)
                            .bold()
                            .foregroundColor(.black)
                        
                        HStack {
                            Text(dateOfFlight)
                                .font(.subheadline)
                                .bold()
                                .foregroundColor(.black)
                            
                            
                            if hasWifi {
                                Image(systemName: "wifi")
                                    .foregroundColor(.blue)
                            }
                        }.padding(.trailing, 70)
                    }
                    Spacer()
                    
                }
                
                HStack {
                    Text(fromAirport)
                        .bold()
                        .font(.title2)
                        .foregroundColor(.black)
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 80, height: 2)
                    Image(systemName: "airplane")
                        .foregroundColor(.black)
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 80, height: 2)
                    Text(toAirport)
                        .bold()
                        .font(.title2)
                        .foregroundColor(.black)
                }
                
                if isNonstop {
                    Text("NONSTOP")
                        .font(.caption)
                        .foregroundColor(.black)
                        .bold()
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .frame(width:350, height: 140)
        }
    }
}


struct FlightDetailView: View {
    var isReturnFlights: Bool
    var flightNum: Int
    var departureTime: String
    var arrivalTime: String
    var dateOfFlight: String
    var totalTime: String
    var cost: String
    var costBusiness: String
    var costFirst: String
    var hasWifi: Bool
    var isNonstop: Bool
    var fromAirport: String
    var toAirport: String
    @State private var selectedCost = 0

    var body: some View {
        NavigationView {
            ZStack {
                Color.lighterGray
                    .ignoresSafeArea()
                VStack{
                    
                    Text("NE FLIGHT \(String(flightNum))")
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 20)
                    
                    
                    VStack {
                        GroupBox(label: Text("FLIGHT DETAILS")
                            .bold()
                            .font(.title2)
                        ) {
                            VStack(alignment: .leading) {
                                HStack{
                                    Text("\(fromAirport) TO \(toAirport)")
                                        .bold()
                                        .font(.headline)
                                    Spacer()
                                    Text(" \(dateOfFlight)")
                                        .bold()
                                        .font(.headline)// Format this as per your requirement
                                }
                                Text("\(departureTime) - \(arrivalTime)")
                                    .bold()
                                    .font(.headline)
                                Text("NONSTOP: \(isNonstop ? "Yes" : "No")")
                                    .bold()
                                    .font(.headline)
                            }
                        }.padding(.bottom, 20)
                        
                        GroupBox(label: Text("AMENITIES")
                            .bold()
                            .font(.title2)) {
                                VStack(alignment: .leading) {
                                    if hasWifi {
                                        HStack {
                                            Text("WIFI")
                                            Image(systemName: "wifi")
                                        }
                                    }else {
                                        HStack {
                                            Text("NONE")
                                            Image(systemName: "xmark.circle")
                                        }
                                    }
                                }
                            }.padding(.bottom, 20)
                        
                        GroupBox(label: Text("MEAL SERVICES")
                            .bold()
                            .font(.title2)) {
                                VStack(alignment: .leading) {
                                    let flightHours = Int(totalTime.prefix(1)) ?? 0
                                    if flightHours < 3 {
                                        HStack {
                                            Text("NONE")
                                            Image(systemName: "xmark.circle")
                                        }
                                    } else {
                                        Text("Snack and Drink Services")
                                    }
                                }
                            }.padding(.bottom, 20)
                        
                        Spacer()
                        VStack{
                            HStack{
                                Text("ECONOMY")
                                    .bold()
                                    .font(.caption)
                                    .padding(.horizontal, 10)
                                Text("BUSINESS")
                                    .bold()
                                    .font(.caption)
                                    .padding(.horizontal, 10)
                                Text("FIRST CLASS")
                                    .bold()
                                    .font(.caption)
                                    .padding(.horizontal, 10)
                            }
                            HStack {
                                Button(action: {selectedCost = 0}) {
                                    Text("$\(cost)")
                                        .bold()
                                        .foregroundColor(selectedCost == 0 ? .white : .customGreen)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(selectedCost == 0 ? Color.customGreen : Color.white)
                                        .cornerRadius(10)
                                }
                                Button(action: {selectedCost = 1}) {
                                    Text("$\(costBusiness)")
                                        .bold()
                                        .foregroundColor(selectedCost == 1 ? .white : .customGreen)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(selectedCost == 1 ? Color.customGreen : Color.white)
                                        .cornerRadius(10)
                                }
                                Button(action: {selectedCost = 2}) {
                                    Text("$\(costFirst)")
                                        .bold()
                                        .foregroundColor(selectedCost == 2 ? .white : .customGreen)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(selectedCost == 2 ? Color.customGreen : Color.white)
                                        .cornerRadius(10)
                                }
                            }
                            .frame(width: 300)
                            .background(Color.white)
                            .cornerRadius(10)                     }
                       
                        if isReturnFlights {
                            NavigationLink( destination: SearchResults(isReturnFlights: true, showStartingAt: true).navigationBarBackButtonHidden(true)) {
                                Text("SELECT FLIGHT")
                                    .foregroundColor(.customYellow)
                                    .frame(width: 300, height: 50)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundColor(Color.black))
                                    .font(.title)
                                    .bold()
                                    .fontWeight(.heavy)
                            }.padding(.top, 10)
                            
                        } else {
                            NavigationLink( destination: Profile().navigationBarBackButtonHidden(true)) {
                                Text("SELECT FLIGHT")
                                    .foregroundColor(.customYellow)
                                    .frame(width: 300, height: 50)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundColor(Color.black))
                                    .font(.title)
                                    .bold()
                                    .fontWeight(.heavy)
                            }.padding(.top, 10)
                                
                            }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .frame(width: 330, height: 530)
                    .shadow(radius: 5)
                    
                }
            }
        }
                        
    }
}

#Preview {
    //FlightOptionView(flightNum: 3970, departureTime: "11:59", arrivalTime: "2:30", dateOfFlight: "07/30/2024", totalTime: "2hr 31m", cost: "212", costBusiness: "312", costFirst: "382", hasWifi: true, isNonstop: true, fromAirport: "DEN", toAirport: "RDU")
    FlightDetailView(isReturnFlights: true, flightNum: 3970, departureTime: "11:59", arrivalTime: "2:30", dateOfFlight: "07/30/2024", totalTime: "2hr 31m", cost: "212", costBusiness: "312", costFirst: "382", hasWifi: true, isNonstop: true, fromAirport: "DEN", toAirport: "RDU")
}
