//
//  Profile.swift
//  NortheastAirlinesApp
//
//  Created by Alice Lisak on 6/26/24.
//
//
//  Profile.swift
//  NortheastAirlinesApp
//
//  Created by Alice Lisak on 6/26/24.
//

import SwiftUI

struct Profile: View {
    @State var currentTab: Tab = .profile
    @State var userIsLoggedIn = false
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        NavigationView{
            ZStack {
                Color.lighterGray.ignoresSafeArea()
                VStack(spacing: 20) {
                    HStack{
                        Text("MY PROFILE")
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(.trailing, 50)
                        Spacer()
                        Image(systemName: "gear")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.black)
                            .frame(width: 25, height: 25)
                    }.padding(.horizontal)
                    
                    ScrollView{
                        
                        VStack(alignment: .leading, spacing: 10){
                            Text("HELLO, ALICE")
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Image(systemName: "person.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.black)
                                .frame(width: 90, height: 80)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                            
                            Button(action: {}) {
                                Text("EDIT PROFILE")
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                            }
                            
                            Text("LOYALTY STATUS")
                                .font(.headline)
                                .fontWeight(.bold)
                            
                            ZStack {
                                Rectangle()
                                    .fill(Color.customYellow)
                                    .frame(height: 30)
                                    .cornerRadius(10)
                                    .shadow(color: Color.yellow, radius: 5, x: 0, y: 2)
                                
                                Text("5025 points")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                            }
                            
                            Text("PERSONAL INFORMATION")
                                .font(.headline)
                                .fontWeight(.bold)
                                .padding(.top, 10)
                            
                            Group {
                                InfoRow(label: "NAME", info: "Alice Lisak")
                                InfoRow(label: "DATE OF BIRTH", info: "09/24/2004")
                                InfoRow(label: "GENDER", info: "Female")
                                InfoRow(label: "EMAIL", info: "alice@email.com")
                            }.padding(.vertical, 5)
                            
                            Text("PAYMENT OPTIONS")
                                .font(.headline)
                                .fontWeight(.bold)
                                .padding(.top, 10)
                            
                            HStack{
                                Image(systemName: "creditcard.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.black)
                                    .frame(width: 30, height: 30)
                                
                                Text("**** **** **** 4031")
                                    .font(.headline)
                                    .fontWeight(.bold)
                            }
                            
                            NavigationLink(destination: Home()) {
                                Text("Questions? View FAQ")
                                    .font(.callout)
                                    .underline()
                                    .foregroundColor(.black)
                            }
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.white)
                                .frame(width: 380)
                                .shadow(color: Color.gray, radius: 5, x: 0, y: 2))
                        
                        NavigationLink(destination: Home()) {
                            Text("SIGN OUT")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(color: Color.gray, radius: 5, x: 0, y: 2)
                        }.padding(.horizontal)
                    }
                }.padding(.top, 20)
            }
        }
    }
}

struct InfoRow: View {
    let label: String
    let info: String
    
    var body: some View {
        HStack {
            Text(label)
                .font(.callout)
                .fontWeight(.bold)
            
            Spacer()
            
            Text(info)
                .font(.callout)
        }
    }
}

#Preview {
        Profile()
}
