//
//  ProfileViewModel.swift
//  MVVM test
//
//  Created by Fox on 17.09.2025
//

import SwiftUI

final class ProfileViewModel: BaseViewModel {
    
    let service: ProfileService!
    
    
    var onAuthorizationSuccess: (() -> Void)?
    @Published var username: String = ""
    @Published var password: String = ""
    
    func authorizationTap(){
        service.authorize()
    }
    
    
    override init() {
        service = ProfileService()
        super.init()
        service.delegate = self
    }
    
    
}

extension ProfileViewModel: ProfileServiceDelegate {
    func authorizationSuccess() {
        print("flow")
        onAuthorizationSuccess?()
        
    }
    
    
}
