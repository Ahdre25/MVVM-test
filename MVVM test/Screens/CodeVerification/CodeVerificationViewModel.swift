//
//  CodeVerificationViewModel.swift
//  MVVM test
//
//  Created by Fox on 30.09.2025
//

import SwiftUI
import Combine

final class CodeVerificationViewModel: BaseViewModel {
    
    let service: CodeVerificationService!
    var phone: String
    @Published var code: String = ""
    @Published var time: Int = 0
    var isCodeCompleted: Bool {
        code.count == 6
    }
    @Published var isLoading: Bool = false
    
    
    var onAuthorizationSuccess: (() -> Void)?
    @Published var isActiveButton: Bool = false
    
    func authorizationTap(){
        service.authorize()
    }
    
    
    init(phone: String) {
        service = CodeVerificationService()
        self.phone = phone
        super.init()
        bindValues()
        service.delegate = self
    }
    
    
    func startTimer(){
        isActiveButton = false
        TimerManager.shared.startTimer(time: 120, onTick: { time in
            self.time = time
        }, onStop: {
            self.isActiveButton = true
        }, onStopFromBackground: {
            
        })
    }
    
    func bindValues() {
        $code.filter({$0.count == 6}).sink { value in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                if self.code == "000000" {
                    self.authorizationSuccess()
                } else {
                    self.code = ""
                }
            }
        }.store(in: &cancellables)
    }
    
    
}

extension CodeVerificationViewModel: CodeVerificationServiceDelegate {
    func authorizationSuccess() {
        print("flow")
        onAuthorizationSuccess?()
        
    }
    
    
}
