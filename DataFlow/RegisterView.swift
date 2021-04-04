//
//  RegisterView.swift
//  DataFlow
//
//  Created by Pandos on 02.04.2021.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var user: UserManager
    @State private var name = ""
    
    private let nameCharacter = 3
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
            
            Text("\(name.count)")
                .foregroundColor(name.count < nameCharacter ? .red : .green)
            }
            .padding()
            Button(action: registerUser) {
              Image(systemName: "checkmark.circle")
                Text("OK")
            }
            .disabled(name.count < nameCharacter)

        }
    }
    private func registerUser() {
        if !name.isEmpty {
            user.name = name
            user.isRegister.toggle()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
