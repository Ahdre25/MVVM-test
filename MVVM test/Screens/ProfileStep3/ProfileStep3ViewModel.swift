//
//  ProfileStep3ViewModel.swift
//  MVVM test
//
//  Created by Fox on 17.09.2025
//

import SwiftUI

final class ProfileStep3ViewModel: BaseViewModel {
    
    let service: ProfileStep3Service!
    
    
    var onAuthorizationSuccess: (() -> Void)?
    @Published var username: String = ""
    @Published var password: String = ""
    
    func authorizationTap(){
        service.authorize()
    }
    
    
    init() {
        service = ProfileStep3Service()
        super.init()
        service.delegate = self
    }
    
    
}

extension ProfileStep3ViewModel: ProfileStep3ServiceDelegate {
    func authorizationSuccess() {
        print("flow")
        onAuthorizationSuccess?()
        
    }
    
    
}
