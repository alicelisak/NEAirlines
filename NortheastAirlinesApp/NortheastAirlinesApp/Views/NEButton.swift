//
//  NEButton.swift
//  NortheastAirlinesApp
//
//  Created by Alice Lisak on 7/10/24.
//

import SwiftUI

struct NEButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        }label: {
            Text(title)
                .foregroundColor(.customYellow)
                .frame(width: 300, height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(background))
                .font(.title)
                .bold()
                .fontWeight(.heavy)
        }
    }
}

#Preview {
    NEButton(title: "Value", background: .black){
        //action
    }
}
