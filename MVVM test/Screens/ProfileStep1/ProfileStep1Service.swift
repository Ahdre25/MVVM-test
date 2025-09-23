//
//  ProfileStep1Service.swift
//  MVVM test
//
//  Created by Fox on 17.09.2025
//

import Foundation

protocol ProfileStep1ServiceDelegate {
    func authorizationSuccess()
}

final class ProfileStep1Service: BaseService {
    var delegate: ProfileStep1ServiceDelegate!
    let network: ProfileStep1Network = ProfileStep1Network()
    
    
    func authorize() {
        delegate.authorizationSuccess()
    }
    

}
