//
//  AuthorizationViewModel.swift
//  MVVM test
//
//  Created by Fox on 11.09.2025.
//
import SwiftUI

final class AuthorizationViewModel: BaseViewModel {
    
    let service: AuthorizationService!
    
    
    var onAuthorizationSuccess: (() -> Void)?
    @Published var username: String = ""
    @Published var password: String = ""
    
    func authorizationTap(){
        service.authorize()
    }
    
    
    override init() {
        service = AuthorizationService()
        super.init()
        service.delegate = self
    }
    
    
}

extension AuthorizationViewModel: AuthorizationServiceDelegate {
    func authorizationSuccess() {
        print("flow")
        onAuthorizationSuccess?()
        
    }
    
    
}
