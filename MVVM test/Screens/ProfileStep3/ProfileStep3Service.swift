//
//  ProfileStep3Service.swift
//  MVVM test
//
//  Created by Fox on 17.09.2025
//

import Foundation

protocol ProfileStep3ServiceDelegate {
    func authorizationSuccess()
}

final class ProfileStep3Service: BaseService {
    var delegate: ProfileStep3ServiceDelegate!
    let network: ProfileStep3Network = ProfileStep3Network()
    
    
    func authorize() {
        delegate.authorizationSuccess()
    }
    

}
