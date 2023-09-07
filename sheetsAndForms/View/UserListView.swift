//
//  UserListView.swift
//  sheetsAndForms
//
//  Created by ksd on 07/09/2023.
//

import SwiftUI

struct UserListView: View {
    @State private var showSheet = false
    @EnvironmentObject var controller: UserController
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(controller.users){user in
                    Text("\(user.firstName) \(user.lastName)")
                }.onDelete { indexSet in
                    withAnimation {
                        controller.deleteUser(with: indexSet)
                    }
                }
            }
            .navigationTitle("Users")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showSheet = true
                    } label: {
                        Image(systemName: "person.badge.plus").font(.largeTitle)
                    }
                    
                }
            }
            .sheet(isPresented: $showSheet) {
                AddUserView()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView().environmentObject(UserController())
    }
}
