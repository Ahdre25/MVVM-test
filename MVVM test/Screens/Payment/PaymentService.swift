//
//  PaymentService.swift
//  MVVM test
//
//  Created by Fox on 12.09.2025
//

import Foundation

protocol PaymentServiceDelegate {
    func authorizationSuccess()
    func shopItemsLoaded(_ items: [ShopItem])
}

final class PaymentService: BaseService {
    var delegate: PaymentServiceDelegate!
    let network: PaymentNetwork = PaymentNetwork()
    
    func loadShopItems() {
        let items = [ShopItem(id: UUID(), name: "Товар 1", price: 1000, imageLink: "https://picsum.photos/600/"), ShopItem(id: UUID(), name: "Товар 2", price: 2000, imageLink: "https://picsum.photos/600//"), ShopItem(id: UUID(), name: "Товар 3", price: 3000, imageLink: "https://picsum.photos/600///")]
        DispatchQueue.global().asyncAfter(deadline: .now() + 2, execute: {
            self.delegate.shopItemsLoaded(items)
        })
    }
    
    func authorize() {
        delegate.authorizationSuccess()
    }
    

}
