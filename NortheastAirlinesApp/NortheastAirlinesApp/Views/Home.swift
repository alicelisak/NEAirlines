//
//  Home.swift
//  NortheastAirlinesApp
//
//  Created by Alice Lisak on 6/18/24.
//

import SwiftUI

struct Home: View {
    @StateObject var viewModel = HomeViewModel()
    @State private var oneWay = false
    @State private var nonStop = false
    @State private var carryOnIncluded = false
    @State private var showingPicker = false
    @State private var isShowSignIn: Bool = true
    
    
    init(){
        UITabBar.appearance().isHidden = true
        
        if viewModel.isSignedIn  {
            isShowSignIn = false
        }
        
    }
    
    var body: some View {
            VStack {
                content
//                if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty  {
//                    content
//                }else {
//                    SignInView()
//                }
            }.fullScreenCover(isPresented: $isShowSignIn, content: { SignInView(isSignShow: $isShowSignIn)})
    }
    
    var content: some View {
        NavigationView {
            ZStack {
                Color.lighterGray
                    .ignoresSafeArea()
                    .edgesIgnoringSafeArea(.all)
                
                    VStack {
                        Image("NELogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 330, height:230.0)
                        
                        VStack {
                            Text("SEARCH FOR FLIGHTS")
                                .font(.title2)
                                .bold()
                                .padding(.trailing, 80)
                                .padding(.bottom, 10)
                            
                            VStack {
                                HStack{
                                    VStack{
                                        Text("FLYING FROM")
                                            .font(.headline)
                                            .padding(.trailing, 40)
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.black, lineWidth: 3)
                                            .background(Color.white)
                                            .frame(height: 40)
                                            .overlay(
                                                Picker(selection: $viewModel.flyingTo, label: Text("")) {
                                                    ForEach(viewModel.flyingOptions, id: \.self) { option in
                                                        Text(option)
                                                            .tag(option)
                                                    }
                                                }.accentColor(.black)
                                            )
                                    }
                                    VStack{
                                        Text("FLYING TO")
                                            .font(.headline)
                                            .padding(.trailing, 40)
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.black, lineWidth: 3)
                                            .background(Color.white)
                                            .frame(height: 40)
                                            .overlay(
                                                Picker(selection: $viewModel.flyingFrom, label: Text("")) {
                                                    ForEach(viewModel.flyingOptions, id: \.self) { option in
                                                        Text(option)
                                                            .tag(option)
                                                            
                                                    }
                                                }.accentColor(.black)
                                            )
                                    }
                                    
                                }.padding(.bottom, 10)
                                    .onChange(of: viewModel.flyingFrom) { newValue in
                                                        if newValue == viewModel.flyingTo {
                                                            viewModel.showingSameLocationError = true
                                                        }
                                                    }
                                                    .onChange(of: viewModel.flyingTo) { newValue in
                                                        if newValue == viewModel.flyingFrom {
                                                            viewModel.showingSameLocationError = true
                                                        }
                                                    }
                                                    .alert(isPresented: $viewModel.showingSameLocationError) {
                                                        Alert(title: Text("Invalid Locations"), message: Text("Flying From and Flying To locations cannot be the same."), dismissButton: .default(Text("OK")) {
                                                            viewModel.showingSameLocationError = false
                                                        })
                                                    }
                                
                                
                                
                                
                                HStack {
                                    VStack{
                                        Text("DEPARTING")
                                            .font(.caption)
                                            .bold()
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.black, lineWidth: 3)
                                            .background(Color.white)
                                            .frame(height: 40)
                                            .overlay(
                                                TextField("Date", text: .init(
                                                    get: { viewModel.dateFormatter.string(from: viewModel.departingDate) },
                                                    set: { viewModel.departingDate = viewModel.dateFormatter.date(from: $0) ?? viewModel.departingDate }
                                                ))
                                            )
                                    }
                                    
                                    VStack{
                                        Text("ARRIVAL")
                                            .font(.caption)
                                            .bold()
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.black, lineWidth: 3)
                                            .background(Color.white)
                                            .frame(height: 40)
                                            .overlay(
                                                TextField("Date", text: .init(
                                                    get: { viewModel.dateFormatter.string(from: viewModel.arrivalDate) },
                                                    set: { viewModel.arrivalDate = viewModel.dateFormatter.date(from: $0) ?? viewModel.arrivalDate }
                                                ))
                                            )
                                    }

                                    VStack{
                                        Text("PASSENGERS")
                                            .font(.caption)
                                            .padding(.bottom, -10)
                                            .bold()
                                        HStack {
                                            Button(action: {
                                                viewModel.numOfPassengers = max(viewModel.numOfPassengers - 1, 1)
                                            }) {
                                                Image(systemName: "minus.circle")
                                                    .foregroundColor(.black)
                                            }
                                            Text("\(viewModel.numOfPassengers)")
                                            Button(action: {
                                                viewModel.numOfPassengers = min(viewModel.numOfPassengers + 1, 10)
                                            }) {
                                                Image(systemName: "plus.circle")
                                                    .foregroundColor(.black)
                                            }
                                        }
                                        .padding()
                                        .background(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.black, lineWidth: 3)
                                                .frame(height: 40)
                                        )
                                    }

                                    
                                }.padding(.bottom, 10)
                                    .onChange(of: viewModel.departingDate) { newValue in
                                        if newValue > viewModel.arrivalDate {
                                            viewModel.showingInvalidDateError = true
                                        }
                                    }
                                    .onChange(of: viewModel.arrivalDate) { newValue in
                                        if viewModel.departingDate > newValue {
                                            viewModel.showingInvalidDateError = true
                                        }
                                    }
                                    .alert(isPresented: $viewModel.showingInvalidDateError) {
                                        Alert(title: Text("Invalid Dates"), message: Text("Departing date cannot be after the arrival date."), dismissButton: .default(Text("OK")) {
                                            viewModel.showingInvalidDateError = false
                                        })
                                    }

                                HStack {
                                        Text("One-Way")
                                            .font(.subheadline)
                                        Button(action: {
                                            if !nonStop {
                                                oneWay.toggle()
                                            }
                                        }) {
                                            Image(systemName: oneWay ? "checkmark.square" : "square")
                                                .foregroundColor(.black)
                                        }
                                        Text("Non-Stop")
                                            .font(.subheadline)
                                        Button(action: {
                                            if !oneWay {
                                                nonStop.toggle()
                                            }
                                        }) {
                                            Image(systemName: nonStop ? "checkmark.square" : "square")
                                                .foregroundColor(.black)
                                        }
                                        Text("Carry On Included")
                                            .font(.subheadline)
                                        Button(action: {
                                            carryOnIncluded.toggle()
                                        }) {
                                            Image(systemName: carryOnIncluded ? "checkmark.square" : "square")
                                                .foregroundColor(.black)
                                            
                                        }
                                }
                                Button(action: {
                                    showingPicker = true
                                }) {
                                    HStack {
                                        Text("Sort By")
                                            .font(.callout)
                                            .foregroundColor(.black)
                                        Spacer()
                                        Text(viewModel.sortBy)
                                            .foregroundColor(.black)
                                        Image(systemName: "chevron.down")
                                            .foregroundColor(.black)
                                    }
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.black, lineWidth: 3)
                                            .frame(height: 35)
                                    )

                                }
                                .frame(width: UIScreen.main.bounds.width / 2)
                                .actionSheet(isPresented: $showingPicker) {
                                    ActionSheet(title: Text("Sort By"), buttons: viewModel.sortByOptions.map { option in
                                        .default(Text(option)) {
                                            viewModel.sortBy = option
                                        }
                                    })
                                }
                            
                            }
                            
                            NavigationLink(destination: SearchResults(isReturnFlights: false, showStartingAt: true).navigationBarBackButtonHidden(true)) {
                                Text("SEARCH")
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
                        .padding()
                        .frame(width: 350.0, height: 420.0)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.white)
                                .shadow(color: Color.gray, radius: 5, x: 0, y: 2))
                        
                        
                    }
                
            }
        }
    }
}


#Preview {
    Home()
}
