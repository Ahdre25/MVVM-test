//
//  AuthorizationViewModel.swift
//  MVVM test
//
//  Created by Fox on 11.09.2025.
//
import SwiftUI
import Combine

final class AuthorizationViewModel: BaseViewModel {
    
    
    // MARK: - Архитектура

    let service: AuthorizationService!
    
    
    // MARK: - Поля для состояния UI
    
    @Published var login: String = ""
    @Published var password: String = ""
    @Published var isTermsChecked: Bool = false
    @Published var isPolicyChecked: Bool = false
    
    var isActiveButton: Bool {
        isPolicyChecked && isTermsChecked && login.count > 10
    }
    
    // MARK: - функции
    
    override init() {
        service = AuthorizationService()
        super.init()
        service.delegate = self
    }
    
    var onAuthorizationSuccess: (() -> Void)?
    
    func authorizationTap(){
        service.authorize()
    }
}

extension AuthorizationViewModel: AuthorizationServiceDelegate {
    func authorizationSuccess() {
        print("flow")
        onAuthorizationSuccess?()
        
    }
    
    
}
