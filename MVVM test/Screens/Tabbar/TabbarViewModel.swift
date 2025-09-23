//
//  TabbarViewModel.swift
//  MVVM test
//
//  Created by Fox on 17.09.2025
//

import SwiftUI

final class TabbarViewModel: BaseViewModel {
    
    let service: TabbarService!
    
    
    var onAuthorizationSuccess: (() -> Void)?
    @Published var username: String = ""
    @Published var password: String = ""
    
    func authorizationTap(){
        service.authorize()
    }
    
    
    override init() {
        service = TabbarService()
        super.init()
        service.delegate = self
    }
    
    
}

extension TabbarViewModel: TabbarServiceDelegate {
    func authorizationSuccess() {
        print("flow")
        onAuthorizationSuccess?()
        
    }
    
    
}
