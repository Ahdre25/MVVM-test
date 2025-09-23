//
//  InnerProfileStepService.swift
//  MVVM test
//
//  Created by Fox on 19.09.2025
//

import Foundation

protocol InnerProfileStepServiceDelegate {
    func authorizationSuccess()
}

final class InnerProfileStepService: BaseService {
    var delegate: InnerProfileStepServiceDelegate!
    let network: InnerProfileStepNetwork = InnerProfileStepNetwork()
    
    
    func authorize() {
        delegate.authorizationSuccess()
    }
    

}
