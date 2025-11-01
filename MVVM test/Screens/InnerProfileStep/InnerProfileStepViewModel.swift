//
//  InnerProfileStepViewModel.swift
//  MVVM test
//
//  Created by Fox on 19.09.2025
//

import SwiftUI

final class InnerProfileStepViewModel: BaseViewModel {
    
    let service: InnerProfileStepService!
    
    
    var onAuthorizationSuccess: (() -> Void)?
    @Published var username: String = ""
    @Published var password: String = ""
    
    func authorizationTap(){
        service.authorize()
    }
    
    
    init() {
        service = InnerProfileStepService()
        super.init()
        service.delegate = self
    }
    
    
}

extension InnerProfileStepViewModel: InnerProfileStepServiceDelegate {
    func authorizationSuccess() {
        print("flow")
        onAuthorizationSuccess?()
        
    }
    
    
}
