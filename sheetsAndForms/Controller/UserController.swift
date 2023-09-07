//
//  UserController.swift
//  sheetsAndForms
//
//  Created by ksd on 07/09/2023.
//

import Foundation

class UserController: ObservableObject {
    @Published var users = [User]()
    
    func add(user: User){
        users.append(user)
    }
    
    func deleteUser(with indexSet: IndexSet){
        users.remove(at: indexSet.first!)
    }
}
