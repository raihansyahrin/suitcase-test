//
//  thirdScreenViewModel.swift
//  suitcase-test
//
//  Created by raihansyahrin on 27/12/23.
//

import Foundation

class thirdScreenViewModel: ObservableObject {
    @Published var users = [User]()

    init() {
        loadData(page: 1)
    }

    func loadData(page: Int) {
        let url = URL(string: "https://reqres.in/api/users?page=\(page)&per_page=6")!

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                if let data = data {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    let dataJSON = json["data"] as! [[String: Any]]

                    for userData in dataJSON {
                        let id = userData["id"] as! Int
                        let email = userData["email"] as! String
                        let first_name = userData["first_name"] as! String
                        let last_name = userData["last_name"] as! String
                        let avatar = userData["avatar"] as! String

                        DispatchQueue.main.async {
                            self.users.append(User(id: id, email: email, first_name: first_name, last_name: last_name, avatar: avatar))
                        }
                    }
                }
            } catch {
                print("Error: \(error)")
            }
        }.resume()
    }
}
