//
//  StarterView.swift
//  DataFlow
//
//  Created by Pandos on 02.04.2021.
//

import SwiftUI

struct StarterView: View {
    @EnvironmentObject var user: UserManager
    var body: some View {
        Group {
            if user.isRegister {
                ContentView()
            } else {
                RegisterView()
            }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
            .environmentObject(UserManager())
    }
}
