//
//  MyFlights.swift
//  NortheastAirlinesApp
//
//  Created by Alice Lisak on 7/29/24.
//

import SwiftUI

struct MyFlights: View {
    @State var index: Int = 0
    @StateObject var viewModel = SearchResultsViewModel()
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.lighterGray
                    .ignoresSafeArea()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text( "MY FLIGHTS" )
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    HStack {
                        Text("UPCOMING FLIGHTS")
                            .font(.title2)
                            .foregroundColor(.black)
                            .bold()
                            .padding(.trailing, 130)
                    }
                    
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible())], spacing: 50) {
                            FlightOptionView(
                                isReturnFlights: viewModel.returnFlights[index].isReturnFlights,
                                showStartingAt: false,
                                flightNum: viewModel.returnFlights[index].flightNum,
                                departureTime: viewModel.returnFlights[index].departureTime,
                                arrivalTime: viewModel.returnFlights[index].arrivalTime,
                                dateOfFlight: viewModel.returnFlights[index].date,
                                totalTime: viewModel.returnFlights[index].totalTime,
                                cost: "ON TIME",
                                costBusiness: viewModel.returnFlights[index].costBusiness,
                                costFirst: viewModel.returnFlights[index].costFirst,
                                hasWifi: viewModel.returnFlights[index].hasWifi,
                                isNonstop: viewModel.returnFlights[index].isNonstop,
                                fromAirport: viewModel.returnFlights[index].fromAirport,
                                toAirport: viewModel.returnFlights[index].toAirport
                            )
                            FlightOptionView(
                                isReturnFlights: viewModel.departureFlights[index].isReturnFlights,
                                showStartingAt: false,
                                flightNum: viewModel.departureFlights[index].flightNum,
                                departureTime: viewModel.departureFlights[index].departureTime,
                                arrivalTime: viewModel.departureFlights[index].arrivalTime,
                                dateOfFlight: viewModel.departureFlights[index].date,
                                totalTime: viewModel.departureFlights[index].totalTime,
                                cost: "ON TIME",
                                costBusiness: viewModel.departureFlights[index].costBusiness,
                                costFirst: viewModel.departureFlights[index].costFirst,
                                hasWifi: viewModel.departureFlights[index].hasWifi,
                                isNonstop: viewModel.departureFlights[index].isNonstop,
                                fromAirport: viewModel.departureFlights[index].fromAirport,
                                toAirport: viewModel.departureFlights[index].toAirport
                            )
                        }
                    }
                    .padding()
                    
                }
            }
        }
    }
}

#Preview {
    MyFlights()
}
