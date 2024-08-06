//
//  LogIn.swift
//  NortheastAirlinesApp
//
//  Created by Alice Lisak on 6/6/24.
//

import SwiftUI
import Firebase

struct CreateAccount: View {
    @Environment (\.presentationMode) var presentationMode
    @Binding var isSignShow: Bool
    
    @StateObject var viewModel = CreateAccountViewModel()
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color.lighterGray
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack {
                        Image("NELogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 330, height:130.0)
                        
                        Text("FLYER INFORMATION")
                            .font(.largeTitle)
                            .bold()
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 20)
                        
                        
                        VStack {
                            Text("PERSONAL INFORMATION")
                                .font(.title2)
                                .bold()
                                .multilineTextAlignment(.leading)
                                .padding(.bottom, 20)
                            
                            
                            VStack(alignment: .leading) {
                                Text("EMAIL")
                                    .font(.headline)
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 3)
                                    .background(Color.white)
                                    .frame(height: 40)
                                    .overlay(
                                        TextField("", text: $viewModel.email)
                                            .padding()
                                            .autocorrectionDisabled()
                                    )
                            }
                            
                            VStack(alignment: .leading) {
                                Text("PASSWORD")
                                    .font(.headline)
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 3)
                                    .background(Color.white)
                                    .frame(height: 40)
                                    .overlay(
                                        TextField("", text: $viewModel.password)
                                            .padding()
                                            .autocorrectionDisabled()
                                    )
                            }
                            VStack(alignment: .leading) {
                                Text("CONFIRM PASSWORD")
                                    .font(.headline)
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 3)
                                    .background(Color.white)
                                    .frame(height: 40)
                                    .overlay(
                                        TextField("", text: $viewModel.confirmpassword)
                                            .padding()
                                            .autocorrectionDisabled()
                                    )
                            }
                            
                            
                            VStack(alignment: .leading) {
                                Text("FIRST NAME")
                                    .font(.headline)
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 3)
                                    .background(Color.white)
                                    .frame(height: 40)
                                    .overlay(
                                        TextField("", text: $viewModel.firstname)
                                            .padding()
                                            .autocorrectionDisabled()
                                    )
                            }
                            
                            VStack(alignment: .leading) {
                                Text("MIDDLE NAME")
                                    .font(.headline)
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 3)
                                    .background(Color.white)
                                    .frame(height: 40)
                                    .overlay(
                                        TextField("", text: $viewModel.middlename)
                                            .padding()
                                            .autocorrectionDisabled()
                                    )
                            }
                            VStack(alignment: .leading) {
                                Text("LAST NAME")
                                    .font(.headline)
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 3)
                                    .background(Color.white)
                                    .frame(height: 40)
                                    .overlay(
                                        TextField("", text: $viewModel.lastname)
                                            .padding()
                                            .autocorrectionDisabled()
                                    )
                            }
                            HStack{
                                Text("GENDER:")
                                    .font(.headline)
                                Picker(selection: $viewModel.selectedGender, label: Text("")) {
                                    ForEach(viewModel.genderOptions, id: \.self) { option in
                                        Text(option).tag(option)
                                    }
                                }
                                .pickerStyle(MenuPickerStyle())
                                .background(Color.white)
                                .foregroundColor(.black)
                                
                            }.padding(.trailing, 155)
                            
                            HStack{
                                Text("DATE OF BIRTH:")
                                    .font(.headline)
                                DatePicker("", selection: $viewModel.dateOfBirth, displayedComponents: .date)
                                    .frame(height: 40)
                                    .background(Color.white)
                                    .foregroundColor(.black)
                            }
                            Text("CONTACT INFO")
                                .font(.title2)
                                .bold()
                                .multilineTextAlignment(.leading)
                                .padding(.top, 20)
                            
                            VStack(alignment: .leading) {
                                Text("PHONE NUMBER")
                                    .font(.headline)
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 3)
                                    .background(Color.white)
                                    .frame(height: 40)
                                    .overlay(
                                        TextField("", text: $viewModel.phonenumber)
                                            .padding()
                                    )
                            }
                            
                            Button(action: {
                                viewModel.register()
                                isSignShow = false
                            }){
                                Text("CREATE ACCOUNT")
                                    .foregroundColor(.customYellow)
                                    .frame(width: 300, height: 50)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundColor(Color.black))
                                    .font(.title)
                                    .bold()
                                    .fontWeight(.heavy)
                            }.padding()
                            
                            
//                         
//                                NEButton(title: "CREATE ACCOUNT", background: .black){
//                                    //viewModel.register()
//                                }.allowsHitTesting(false)
//                                .padding(.top, 10)
                            
                            
                            Button {
                                presentationMode.wrappedValue.dismiss()
                            }label: {
                                Text("Go Back")
                                    .foregroundColor(.blue)
                                    .bold()
                            }.padding(.trailing, 250.0)
                                .padding(.top, 5)
                        }
                        .padding()
                        .frame(width: 350.0, height: 880.0)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.white)
                                .shadow(color: Color.gray, radius: 5, x: 0, y: 2)
                        )
                    }
                }
            }
            
        }
            
        }
    }

    struct CheckboxToggleStyle: ToggleStyle {
        func makeBody(configuration: Self.Configuration) -> some View {
            HStack {
                configuration.label
                Spacer()
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .onTapGesture { configuration.isOn.toggle() }
            }
        }
    }


#Preview {
    CreateAccount(isSignShow: .constant(true))
}

