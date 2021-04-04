//
//  DataFlowApp.swift
//  DataFlow
//
//  Created by Pandos on 01.04.2021.
//

import SwiftUI

@main
struct DataFlowApp: App {
    @StateObject private var user = UserManager()
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(user)
        }
    }
}


