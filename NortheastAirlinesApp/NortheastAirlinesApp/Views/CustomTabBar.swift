//
//  CustomTabBar.swift
//  NortheastAirlinesApp
//
//  Created by Alice Lisak on 6/18/24.
//

import SwiftUI

struct CustomTabBar: View {
    @State var currentTab: Tab = .home

    var backgroundColors = [Color("Black")]
    
    var body: some View {
        VStack {
            switch currentTab {
            case .home:
                Home()
                    .transition(.opacity)
            case .ticket:
                MyFlights()
                    .transition(.opacity)
            case .profile:
                Profile()
                    .transition(.opacity)
            }
            
            HStack(spacing: 0){
                ForEach(Tab.allCases, id: \.rawValue) {tab in
                    Button{
                        withAnimation(.easeIn) {
                            currentTab = tab
                        }
                    }label:{
                        Image(tab.rawValue)
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            //.foregroundColor(.offWhite)
                            .foregroundStyle(currentTab.rawValue == tab.rawValue ? .customYellow : .white)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .frame(height: 40)
            .padding(.top, 10)
            .padding(.bottom, 10)
            .background(LinearGradient(colors: backgroundColors, startPoint: .leading, endPoint: .trailing))
            //.edgesIgnoringSafeArea(.bottom)
        }
    }
}

#Preview {
    CustomTabBar()
    //Home()
}

