//
//  sheetsAndFormsApp.swift
//  sheetsAndForms
//
//  Created by ksd on 07/09/2023.
//

import SwiftUI

@main
struct sheetsAndFormsApp: App {
    @StateObject private var appState = UserController()
    var body: some Scene {
        WindowGroup {
            UserListView().environmentObject(appState)
        }
    }
}
