//
//  ContentView.swift
//  SwiftUITimerDemo
//
//  Created by Reema Poojara on 06/11/25.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State private var isButtonEnable = false
    @State private var timeRemaining = 10
    @State private var timerSubscription:AnyCancellable?

    
    var body: some View {
        VStack {
            Text("\(timeRemaining)")
                .font(.headline)
                .padding()
            
            Button("Perform Action") {
                print("Button Tapped!")
            }
            .disabled(!isButtonEnable)
            .padding()
            .background(isButtonEnable ? .green : .gray,in:Capsule())
            .foregroundStyle(.white,)
            .padding()
        }
        .padding()
        .onAppear(perform: startTimer)
        .onDisappear(perform: endTimer)
    }
    func startTimer() {
        timerSubscription = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
            .sink { _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                } else {
                    isButtonEnable = true
                    endTimer()
                }
            }
    }
    func endTimer() {
        timerSubscription?.cancel()
        timerSubscription = nil
    }
}

#Preview {
    ContentView()
}
