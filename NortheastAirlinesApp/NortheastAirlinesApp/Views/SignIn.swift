//
//  SignInView.swift
//  NortheastAirlinesApp
//
//  Created by Alice Lisak on 6/6/24.
//

import SwiftUI
import Firebase

struct SignInView: View {
    @StateObject var viewModel = SignInViewModel()
    @Binding var isSignShow: Bool

    var body: some View {
        NavigationView{
            ZStack{
                Color.lighterGray
                    .ignoresSafeArea()
                
                VStack {
                    Image("NELogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 330, height:330.0)
                    VStack {
                        
                        if !viewModel.errorMessage.isEmpty {
                            Text(viewModel.errorMessage)
                                .foregroundColor(Color.red)
                        }
                        
                        Text("SIGN IN")
                            .font(.headline)
                            .bold()
                            .padding(.trailing, 240.0)
                            .multilineTextAlignment(.leading)
                        
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.lighterGray)
                            .frame(width: 300, height: 50)
                            .overlay(
                                TextField("Email", text: $viewModel.email)
                                    .padding()
                                    .foregroundColor(.white)
                                    .autocorrectionDisabled()
                                    .autocapitalization(.none)
                            )
                        
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.lighterGray)
                            .frame(width: 300, height: 50)
                            .overlay(
                                SecureField("Password", text: $viewModel.password)
                                    .padding()
                                    .foregroundColor(.white)
                                    .autocorrectionDisabled()
                                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                            )
                        
                        Text("NEW AROUND HERE?")
                            .font(.subheadline)
                            .bold()
                            .multilineTextAlignment(.leading)
                            .padding(.trailing, 150.0)
                            .padding(.top, 2)
                        
                        VStack{
                            NavigationLink("CREATE ACCOUNT", destination: CreateAccount(isSignShow: $isSignShow).navigationBarBackButtonHidden(true))
                        }.font(.subheadline)
                            .lineLimit(5)
                            .bold()
                            .multilineTextAlignment(.leading)
                            .underline()
                            .padding(.trailing, 170.0)
                            .padding(.bottom, 1)
                        
                        //func handleError()
                        
                       // func handleSucces()
                        
                        Button(action: {
                            if viewModel.validate() {
                                viewModel.login()
                                isSignShow = false
                            }else {
                                isSignShow = true
                            }
                        }){
                            Text("SIGN-IN")
                                .foregroundColor(.customYellow)
                                .frame(width: 300, height: 50)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(Color.black))
                                .font(.title)
                                .bold()
                                .fontWeight(.heavy)
                        }
                        
                        
                    }.padding()
                        .frame(width: 350.0, height: 280.0)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.white)
                                .shadow(color: Color.gray, radius: 5, x: 0, y: 2))
                    VStack{
                        Text("CONTINUE AS GUEST")
                            .onTapGesture {
                                isSignShow = false
                            }.font(.subheadline)
                            .lineLimit(5)
                            .bold()
                            .multilineTextAlignment(.leading)
                            .underline()
                            .padding(.trailing, 180.0)
                            .foregroundColor(.black)
                    }
                    
   
                }
            }
        }

    }

}

        
#Preview {
    SignInView(isSignShow: .constant(true))
}
