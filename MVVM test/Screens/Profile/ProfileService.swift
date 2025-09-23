//
//  ProfileService.swift
//  MVVM test
//
//  Created by Fox on 17.09.2025
//

import Foundation

protocol ProfileServiceDelegate {
    func authorizationSuccess()
}

final class ProfileService: BaseService {
    var delegate: ProfileServiceDelegate!
    let network: ProfileNetwork = ProfileNetwork()
    
    
    func authorize() {
        delegate.authorizationSuccess()
    }
    

}
