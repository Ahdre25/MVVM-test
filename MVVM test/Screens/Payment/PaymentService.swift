//
//  PaymentService.swift
//  MVVM test
//
//  Created by Fox on 12.09.2025
//

import Foundation

protocol PaymentServiceDelegate {
    func authorizationSuccess()
}

final class PaymentService: BaseService {
    var delegate: PaymentServiceDelegate!
    let network: PaymentNetwork = PaymentNetwork()
    
    
    func authorize() {
        delegate.authorizationSuccess()
    }
    

}
