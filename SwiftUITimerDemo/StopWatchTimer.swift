//
//  StopWatchTimer.swift
//  SwiftUITimerDemo
//
//  Created by Reema Poojara on 06/11/25.
//

import SwiftUI

struct StopWatchTimer: View {
    
    @StateObject var stopWatch = StopWatch()
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some View {
        
        let minutes = Int(stopWatch.elapsed) / 60
        let seconds = Int(stopWatch.elapsed) % 60
        
        VStack(alignment: .center) {
            Spacer()
            Text(String(format: "%02d:%02d", minutes, seconds))
                    .font(.custom("Georgia", size:  60))
                    .foregroundStyle(.teal)
            Spacer()
            HStack {
                Button("Start") {
                    stopWatch.start()
                }
                Button("Stop"){
                    stopWatch.stop()
                }
                Button("Reset"){
                    self.stopWatch.reset()
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .onChange(of: scenePhase) { phase in
            switch phase {
            case .active:
                stopWatch.appDidBecomeActive()
            case .background:
                stopWatch.appDidEnterBackground()
            default:
                break
            }
        }
    }
}

#Preview {
    StopWatchTimer()
}
