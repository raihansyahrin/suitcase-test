//
//  secondScreenView.swift
//  suitcase-test
//
//  Created by raihansyahrin on 27/12/23.
//

import SwiftUI

struct secondScreenView: View {
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
    
    @State private var isSecondViewPresented = false
//    @EnvironmentObject private var viewModel :  firstScreenViewModel
    
    var body: some View {
        NavigationView{
           
            ZStack{
                VStack{
                    Divider()
                    //header
                    VStack(alignment: .leading){
                        HStack{
                            Text("Welcome")
                                .foregroundColor(.black)
                            Spacer()
                            

                        }
                        Text("John Doe")
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            
                    }
                    .padding()

                    Spacer()

                    Text("Selected User Name")
                        .foregroundColor(.black)
                        .font(.system(size: 28))
                        .fontWeight(.bold)

                    Spacer()

                    NavigationLink{
                        thirdScreenView()

                    }label: {
                        HStack {
                            Text("Choose a User")
                        }
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                    }
                    .background(Color(red: 44 / 255, green: 98 / 255, blue: 122 / 255))
                    .cornerRadius(10)
                }
                .navigationBarHidden(true)
            }
            .background(Color.white)
            
            
        }
        
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Second Screen")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: btnBack)
        .background(NavigationConfigurator { nc in
            nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.black]
         })
    }
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }

}

struct secondScreenView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            secondScreenView()
      
        }
        
    }
}
