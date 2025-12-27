//
//  StopWatch.swift
//  SwiftUITimerDemo
//
//  Created by Reema Poojara on 06/11/25.
//

import Foundation

@MainActor
final class StopWatch:ObservableObject {
    
    @Published private(set) var elapsed: TimeInterval = 0
    
    private var timer : Timer?
    private var startDate: Date?
    
    func start(){
        if startDate == nil {
            startDate = Date().addingTimeInterval(-elapsed)
        }
        runTimer()
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
    }
    
    func reset(){
        stop()
        elapsed = 0
        startDate = nil
    }
    
    private func runTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self, let startDate else { return }
            self.elapsed = Date().timeIntervalSince(startDate)
        }
    }

    func appDidBecomeActive() {
        if startDate != nil {
            runTimer()
        }
    }

    func appDidEnterBackground() {
        stop()
    }
}
