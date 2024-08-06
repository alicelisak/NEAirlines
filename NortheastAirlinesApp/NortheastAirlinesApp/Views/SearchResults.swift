//
//  SearchResults.swift
//  NortheastAirlinesApp
//
//  Created by Alice Lisak on 7/29/24.
//

import SwiftUI

struct SearchResults: View {
    var isReturnFlights: Bool
    var showStartingAt: Bool
    @StateObject var viewModel = SearchResultsViewModel()
    @State private var showingPicker = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.lighterGray
                    .ignoresSafeArea()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text(!isReturnFlights ? "SEARCH RESULTS" : "RETURN FLIGHTS")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    Button(action: {
                        showingPicker = true
                    }) {
                        HStack {
                            Text("Sort By")
                                .font(.callout)
                                .foregroundColor(.black)
                                .bold()
                            Spacer()
                            Text(viewModel.sortBy)
                                .foregroundColor(.black)
                                .bold()
                            Image(systemName: "chevron.down")
                                .foregroundColor(.black)
                                .bold()
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .stroke(Color.black, lineWidth: 3)
                                .frame(height: 35)
                        )

                    }
                    .frame(width: UIScreen.main.bounds.width / 2)
                    .padding(.trailing, 150)
                    .actionSheet(isPresented: $showingPicker) {
                        ActionSheet(title: Text("Sort By"), buttons: viewModel.sortByOptions.map { option in
                            .default(Text(option)) {
                                viewModel.sortBy = option
                            }
                        })
                    }
                    
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible())], spacing: 80) {
                            ForEach(!isReturnFlights ? viewModel.returnFlights : viewModel.departureFlights, id: \.id) { flight in
                                FlightOptionView(
                                    isReturnFlights: flight.isReturnFlights,
                                    showStartingAt: true,
                                    flightNum: flight.flightNum,
                                    departureTime: flight.departureTime,
                                    arrivalTime: flight.arrivalTime,
                                    dateOfFlight: flight.date,
                                    totalTime: flight.totalTime,
                                    cost: flight.cost,
                                    costBusiness: flight.costBusiness,
                                    costFirst: flight.costFirst,
                                    hasWifi: flight.hasWifi,
                                    isNonstop: flight.isNonstop,
                                    fromAirport: flight.fromAirport,
                                    toAirport: flight.toAirport
                                )
                            }
                        }
                    }
                    .padding()
                    
                }
            }
        }
        
        
        
    }
}

#Preview {
    SearchResults(isReturnFlights: true, showStartingAt: true)
}
