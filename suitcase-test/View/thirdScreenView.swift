//
//  thirdScreenView.swift
//  suitcase-test
//
//  Created by raihansyahrin on 27/12/23.
//

import SwiftUI
import Kingfisher

struct thirdScreenView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var btnBack : some View { Button(action: {
           self.presentationMode.wrappedValue.dismiss()
           }) {
               HStack {
                   Image(systemName: "arrow.backward")
                       .aspectRatio(contentMode: .fit)
                       .foregroundColor(.black)
                       .font(.system(size: 25))
                
               }
           }
       }
    
    @StateObject var viewModel = thirdScreenViewModel()
    @State private var isRefreshing = false
    @State private var currentPage = 1
    
    
    var body: some View {
        NavigationView{
            VStack{
                Divider()
                List{
                    if viewModel.users.isEmpty {
                        VStack {
                            Image(systemName: "doc.text.image")
                                .foregroundColor(Color.black)
                                .font(.largeTitle)
                                .padding()
                            Text("No Data Available")
                                .foregroundColor(Color.black)
                                .font(.title2)
                                .foregroundColor(.secondary)
                                .padding()
                        }
                    } else {
                        ForEach(viewModel.users, id: \.id){ user in
                            NavigationLink{
                                secondScreenView()
                            }label: {
                                HStack(spacing: 20){
                                    
                                    //profile image
                                    KFImage(URL(string: user.avatar)!)
                                        .resizable()
                                        .scaledToFit()
                                        .clipShape(Circle())
                                        .frame(width: 70, height: 80)
                                    
                                    //name and email
                                    VStack(alignment: .leading, spacing: 12){
                                        HStack{
                                            Text("\(user.first_name) \(user.last_name)")
                                                .foregroundColor(.black)
                                                .font(.title3)
                                                .fontWeight(.semibold)
                                            
                                        }
                                        
                                        Text("\(user.email)")
                                            .foregroundColor(.black)
                                            .lineLimit(1)
                                    }
                                }
                            }
                            .onAppear{
                                viewModel.loadData(page: currentPage)
                            }
                        }
                      
                    }
                    
                }
                .background(Color.white)
                .listStyle(.plain)
                

//                .refreshable {
//                    viewModel.users.removeAll()
//                    viewModel.loadData(page: currentPage)
//                    isRefreshing = false
//                }
                
                .onAppear {
                    viewModel.loadData(page: currentPage)
                }
                .onDisappear {
                    currentPage += 1
                }
                .navigationBarHidden(true)
            }
            .background(Color.white)
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Third Screen")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: btnBack)
        .background(NavigationConfigurator { nc in
            nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.black]
            nc.navigationBar.tintColor = UIColor.black
         })
    }
}

struct thirdScreenView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        
            thirdScreenView()
     
        }
        
    }
}
