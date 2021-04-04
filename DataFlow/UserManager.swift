//
//  UserManager.swift
//  DataFlow
//
//  Created by Pandos on 02.04.2021.
//

import Foundation
import Combine

class UserManager: ObservableObject {
    
    @Published var isRegister: Bool {
        didSet {
            UserDefaults.standard.set(isRegister, forKey: "isRegister")
        }
    }
    
    var name: String {
        didSet {
            UserDefaults.standard.set(name, forKey: "name")
        }
    }
    
    init() {
        isRegister = UserDefaults.standard.bool(forKey: "isRegister")
        name = UserDefaults.standard.value(forKey: "name") as? String ?? ""
    }
    
}
