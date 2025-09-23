//
//  ProfileStep2Service.swift
//  MVVM test
//
//  Created by Fox on 17.09.2025
//

import Foundation

protocol ProfileStep2ServiceDelegate {
    func authorizationSuccess()
}

final class ProfileStep2Service: BaseService {
    var delegate: ProfileStep2ServiceDelegate!
    let network: ProfileStep2Network = ProfileStep2Network()
    
    
    func authorize() {
        delegate.authorizationSuccess()
    }
    

}
