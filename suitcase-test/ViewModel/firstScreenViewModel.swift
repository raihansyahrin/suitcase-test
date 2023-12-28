//
//  firstScreenViewModel.swift
//  suitcase-test
//
//  Created by raihansyahrin on 27/12/23.
//

import Foundation

class firstScreenViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var sentence: String = ""
    @Published var isPalindromeResult: Bool = false
    
    func checkPalindrome() {
        let cleanedText = sentence.replacingOccurrences(of: " ", with: "").lowercased()
        isPalindromeResult = cleanedText == String(cleanedText.reversed())
    }
}
