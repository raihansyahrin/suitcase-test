//
//  firstScreenView.swift
//  suitcase-test
//
//  Created by raihansyahrin on 27/12/23.
//

import SwiftUI

struct firstScreenView: View {
    @ObservedObject private var viewModel = firstScreenViewModel()
    
    var body: some View {
        NavigationView {
            ZStack{
                Image("background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 50) {
                    Image("ic_photo")
                        .resizable()
                        .frame(width: 150, height: 150)
                    
                    VStack(spacing: 20) {
                        TextField("Name", text: $viewModel.name)
                            .autocorrectionDisabled()
                            .font(.system(size: 14))
                            .textFieldStyle(CustomTextField())
                            .padding(.horizontal)
                            
                        
                        TextField("Palindrome", text: $viewModel.sentence)
                            .font(.system(size: 14))
                            .textFieldStyle(CustomTextField())
                            .padding(.horizontal)
                    }
                    
                    VStack(spacing: 20) {
                        Button(action: {
                            viewModel.checkPalindrome()
                            showAlert()
                        }) {
                            HStack {
                                Text("Check")
                            }
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                        }
                        .background(Color(red: 44 / 255, green: 98 / 255, blue: 122 / 255))
                        .cornerRadius(10)
                        
                        
                        
                        NavigationLink{
                            secondScreenView()
                        }label: {
                            HStack {
                                Text("Next")
                            }
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                        }
                        .background(Color(red: 44 / 255, green: 98 / 255, blue: 122 / 255))
                        .cornerRadius(10)
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
        
    }
    private func showAlert() {
           let message = viewModel.isPalindromeResult ? "isPalindrome" : "not palindrome"
           let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
           UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
       }
}

struct firstScreenView_Previews: PreviewProvider {
    static var previews: some View {
        firstScreenView()
    }
}

struct CustomTextField: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    
                    .stroke(Color.black, lineWidth: 0.5)
                    .frame(height: 50)
                    .foregroundColor(.white)
                   
                    
            )
    }
}
