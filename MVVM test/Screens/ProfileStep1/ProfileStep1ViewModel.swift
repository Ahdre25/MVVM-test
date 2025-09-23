//
//  ProfileStep1ViewModel.swift
//  MVVM test
//
//  Created by Fox on 17.09.2025
//

import SwiftUI

final class ProfileStep1ViewModel: BaseViewModel {
    
    let service: ProfileStep1Service!
    
    
    var onAuthorizationSuccess: (() -> Void)?
    @Published var username: String = ""
    @Published var password: String = ""
    
    func authorizationTap(){
        service.authorize()
    }
    
    
    override init() {
        service = ProfileStep1Service()
        super.init()
        service.delegate = self
    }
    
    
}

extension ProfileStep1ViewModel: ProfileStep1ServiceDelegate {
    func authorizationSuccess() {
        print("flow")
        onAuthorizationSuccess?()
        
    }
    
    
}
