//
//  ListView.swift
//  NortheastAirlinesApp
//
//  Created by Alice Lisak on 6/12/24.
//

//import SwiftUI
//
//struct ListView: View {
//    @EnvironmentObject var dataManager: DataManager
//    @State private var showPopup = false
//    
//    var body: some View {
//        NavigationView {
//            List(dataManager.dogs, id: \.id){ dog in
//                Text(dog.breed)
//            }
//            .navigationTitle("Dogs")
//            .navigationBarItems(trailing: Button(action: {
//                showPopup.toggle()
//            }, label:{
//                Image(systemName: "plus")
//            }))
//            .sheet(isPresented: $showPopup) {
//                NewDogView()
//            }
//            
//        }
//       
//    }
//}
//
//struct ListView_Previews: PreviewProvider {
//    static var previews: some View{
//        ListView().environmentObject(DataManager())
//    }
//}
