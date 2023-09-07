//
//  UserModel.swift
//  sheetsAndForms
//
//  Created by ksd on 07/09/2023.
//

import Foundation


struct User: Identifiable {
    var firstName: String
    var lastName: String
    
    let id = UUID().uuidString
}
