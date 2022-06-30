//
//  SignUpViewModel.swift
//  social_network
//
//  Created by David Granado Jordan on 6/29/22.
//

import Foundation

class SignUpViewModel {
    let firebaseManager = FirebaseManager.shared
    static let shared = SignUpViewModel()
    
    func addUser(name: String, age: Int, email: String, password: String, completion: @escaping  (User?) -> Void ) {
        let userID = firebaseManager.getDocID(forCollection: .users)
        let user = User(id: userID, name: name, age: age, email: email, password: password)
        
        firebaseManager.addDocument(document: user, collection: .users) { result in
            switch result {
            case .success(let user):
                print("Success", user)
                completion(user)
            case .failure(let error):
                print("Error", error)
                completion(nil)
            }
        }
    }
    
}
