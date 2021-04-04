//
//  ContentView.swift
//  DataFlow
//
//  Created by Pandos on 01.04.2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimerCounter()
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        VStack {
            Text("Hi,\(user.name)!")
                .font(.title)
                .offset(x: 0, y: 100)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x:0, y: 200)
            Spacer()
            ButtonView()
                .padding()
                .padding()
                .environmentObject(timer)
            Spacer()
            LogoutButton(user: user)
            Spacer()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}

struct ButtonView: View {
    @EnvironmentObject var timer: TimerCounter
    
    var body: some View {
        Button(action: { timer.startTimer() }) {
            Text("\(timer.buttonTitle)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(Color.red)
        .cornerRadius(20)
        .overlay(
             RoundedRectangle(cornerRadius: 20)
            .stroke(Color.black, lineWidth: 4))
    }
}

struct LogoutButton: View {
    @ObservedObject var user: UserManager
    
    var body: some View {
        Button(action: {
            self.user.name  = ""
            self.user.isRegister = false
        }) {
            Text("Log Out")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
        }
        .frame(width: 200, height: 60)
        .background(Color.blue)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color.black, lineWidth: 4)
        )
    }
    
}
