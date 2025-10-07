//
//  PaymentViewModel.swift
//  MVVM test
//
//  Created by Fox on 12.09.2025
//

import SwiftUI

final class PaymentViewModel: BaseViewModel {
    
    let service: PaymentService!
    
    @Published var shopItems: [ShopItem] = []
    @Published var isInitialLoading: Bool = true
    
    var onAuthorizationSuccess: (() -> Void)?
    
    
    func authorizationTap(){
        service.authorize()
    }
    
    func loadItems(){
        service.loadShopItems()
    }
    
    
    override init() {
        service = PaymentService()
        super.init()
        service.delegate = self
    }
    
    
}

extension PaymentViewModel: PaymentServiceDelegate {
    func shopItemsLoaded(_ items: [ShopItem]) {
        shopItems = items
        isInitialLoading = false
    }
    
    func authorizationSuccess() {
        print("flow")
        onAuthorizationSuccess?()
        
    }
    
    
}
