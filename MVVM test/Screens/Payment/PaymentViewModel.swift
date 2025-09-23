//
//  PaymentViewModel.swift
//  MVVM test
//
//  Created by Fox on 12.09.2025
//

import SwiftUI

final class PaymentViewModel: BaseViewModel {
    
    let service: PaymentService!
    
    
    var onAuthorizationSuccess: (() -> Void)?
    @Published var username: String = ""
    @Published var password: String = ""
    
    func authorizationTap(){
        service.authorize()
    }
    
    
    override init() {
        service = PaymentService()
        super.init()
        service.delegate = self
    }
    
    
}

extension PaymentViewModel: PaymentServiceDelegate {
    func authorizationSuccess() {
        print("flow")
        onAuthorizationSuccess?()
        
    }
    
    
}
