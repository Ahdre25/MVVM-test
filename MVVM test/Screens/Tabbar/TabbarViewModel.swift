//
//  TabbarViewModel.swift
//  MVVM test
//
//  Created by Fox on 17.09.2025
//

import SwiftUI

final class TabbarViewModel: BaseViewModel {
    
    let service: TabbarService
    
    
    var onAuthorizationSuccess: (() -> Void)?
    
    @Published var selected: Int = 0
    
    func authorizationTap(){
        service.authorize()
    }
    
    override func onFirstAppear() {
        super.onFirstAppear()
        
    }
    
    func handle(deeplink: DeepLink?) {
        guard let deeplink else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.check(deeplink: deeplink)
        })
    }
    
    private func check(deeplink: DeepLink) {
        switch(deeplink) {
        case .product:
            selected = 0
        case .none:
            break
        }
    }
    
    
    init(user: String) {
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
