//
//  MainService.swift
//  MVVM test
//
//  Created by Fox on 27.10.2025
//

import Foundation

protocol MainServiceDelegate {
    func getCitiesSuccess(cities: [String])
    func getProductsSucess(products: [ShopItem])
}

final class MainService: BaseService {
    var delegate: MainServiceDelegate!
    let network: MainNetwork = MainNetwork()
    var cities = ["Москва", "Санкт-Петербург", "Казань", "Новосибирск", "Екатеринбург", "Самара", "Владивосток"]
    
    var products = [ShopItem(id: 0, name: "Товар 1", price: 1000, imageLink: "https://picsum.photos/600/"), ShopItem(id: 1, name: "Товар 2", price: 2000, imageLink: "https://picsum.photos/600//"), ShopItem(id: 2, name: "Товар 3", price: 3000, imageLink: "https://picsum.photos/600///")]
    
    func getCities() {
        delegate.getCitiesSuccess(cities: cities)
    }
    
    func getProducts() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.delegate.getProductsSucess(products: self.products)
        }
        
    }
    

}
