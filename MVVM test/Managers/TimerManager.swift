//
//  TimerManager.swift
//  MVVM test
//
//  Created by Fox on 01.10.2025.
//

import Foundation
import UIKit

class TimerManager {
    static let shared = TimerManager()
    var timer: Timer?
    var totalTime: Int = 0
    var timerTime: Int = 0
    var onStop: (()->())?
    var onTick: ((Int)->())?
    var startDate: Date?
    
    func stopTimer(){
        timer?.invalidate()
        timer = nil
        onStop = nil
        onTick = nil
    }
    
    var onStopFromBackground: (()->())?
    
    func startTimer(time: Int, onTick: ((Int)->())?, onStop: (()->())?, onStopFromBackground: (()->())?){
        totalTime = time
        timerTime = time
        startDate = Date()
        self.onStopFromBackground = onStopFromBackground
        self.onStop = onStop
        self.onTick = onTick
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.timerTime -= 1
            print(self.timerTime)
            self.onTick?(self.timerTime)
            if self.timerTime < 1 {
                self.onStop?()
                self.stopTimer()
            }
        }
    }
    
    
    
    
    
    
}
