//
//  AddUserView.swift
//  sheetsAndForms
//
//  Created by ksd on 07/09/2023.
//

import SwiftUI

enum NotifyMeAboutType: String {
    case directMessages = "Direkte beskeder"
    case mentions = "Omtale"
    case anything = "Hvadsomhelst"
}


struct AddUserView: View {
    @Environment(\.dismiss) var lukker
    @EnvironmentObject var userController: UserController
    
    @State private var showAlert = false
    
    @State private var notifyMeAbout = NotifyMeAboutType.mentions
    @State private var playNotificationSounds = false
    @State private var email = ""
    @State private var creationDate = Date()
    @State private var surName = ""
    @State private var firstName = ""
    
    var body: some View {
        Form {
            Section("Behaviour") {
                Picker("Notify me about", selection: $notifyMeAbout) {
                    Text(NotifyMeAboutType.directMessages.rawValue).tag(NotifyMeAboutType.directMessages)
                    Text("Mentions").tag(NotifyMeAboutType.mentions)
                    Text("Anything").tag(NotifyMeAboutType.anything)
                }
                Toggle("Play notification sounds", isOn: $playNotificationSounds)
            }
            Section("User Details"){
                HStack{
                    TextField("Fornavn", text: $firstName)
                    TextField("Efternavn", text: $surName)
                }
                DatePicker("Creation date",
                           selection: $creationDate,
                           displayedComponents: [.date])
                TextField("email", text: $email)
                    .keyboardType(.numberPad)
                
                Button {
                    showAlert = true
                } label: {
                    Text("Opret")
                }.buttonStyle(.bordered)
                
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Opret"),
                  message: Text("Nu opretter vi dig"),
                  primaryButton: .default(Text("Opret"),
                                          action: {
                let user = User(firstName: firstName, lastName: surName)
                userController.add(user: user)
                lukker()
            }),
                  secondaryButton: .cancel(Text("Annuller"),
                                           action: {
                lukker()
            }))
        }
    }
}

struct AddUserView_Previews: PreviewProvider {
    static var previews: some View {
        AddUserView()
    }
}
