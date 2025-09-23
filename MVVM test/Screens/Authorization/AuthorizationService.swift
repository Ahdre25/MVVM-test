//
//  AuthorizationService.swift
//  MVVM test
//
//  Created by Fox on 11.09.2025.
//

protocol AuthorizationServiceDelegate {
    func authorizationSuccess()
}

final class AuthorizationService: BaseService {
    var delegate: AuthorizationServiceDelegate!
    let network: AuthorizationNetwork = AuthorizationNetwork()
    
    
    func authorize() {
        delegate.authorizationSuccess()
    }
    

}
