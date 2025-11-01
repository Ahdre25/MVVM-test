//
//  ProfileStep2ViewModel.swift
//  MVVM test
//
//  Created by Fox on 17.09.2025
//

import SwiftUI

final class ProfileStep2ViewModel: BaseViewModel {
    
    let service: ProfileStep2Service!
    
    
    var onAuthorizationSuccess: (() -> Void)?
    @Published var username: String = ""
    @Published var password: String = ""
    
    func authorizationTap(){
        service.authorize()
    }
    
    
    init() {
        service = ProfileStep2Service()
        super.init()
        service.delegate = self
    }
    
    
}

extension ProfileStep2ViewModel: ProfileStep2ServiceDelegate {
    func authorizationSuccess() {
        print("flow")
        onAuthorizationSuccess?()
        
    }
    
    
}
