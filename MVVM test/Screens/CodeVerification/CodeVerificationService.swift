//
//  CodeVerificationService.swift
//  MVVM test
//
//  Created by Fox on 30.09.2025
//

import Foundation

protocol CodeVerificationServiceDelegate {
    func authorizationSuccess()
}

final class CodeVerificationService: BaseService {
    var delegate: CodeVerificationServiceDelegate!
    let network: CodeVerificationNetwork = CodeVerificationNetwork()
    
    
    func authorize() {
        delegate.authorizationSuccess()
    }
    

}
