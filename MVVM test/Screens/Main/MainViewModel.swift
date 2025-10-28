//
//  MainViewModel.swift
//  MVVM test
//
//  Created by Fox on 27.10.2025
//

import SwiftUI

final class MainViewModel: BaseViewModel {
    
    let service: MainService!
    
    
    var onGetCitiesSuccess: (([String]) -> Void)?
    @Published var search: String = ""
    @Published var selectedCity: String = "Москва"
    @Published var selectedCategory: SearchCategory = .new
    @Published var products: [ShopItem] = [ShopItem(id: UUID(), name: "", price: 1, imageLink: ""), ShopItem(id: UUID(), name: "", price: 1, imageLink: ""), ShopItem(id: UUID(), name: "", price: 1, imageLink: ""), ShopItem(id: UUID(), name: "", price: 1, imageLink: "")]
    
    var isInitialLoading: Bool = true
    
    
    func onCityTap(){
        service.getCities()
    }
    
    func onAppear(){
        service.getProducts()
    }
    
    
    override init() {
        service = MainService()
        super.init()
        service.delegate = self
    }
    
    
}

extension MainViewModel: MainServiceDelegate {
    func getProductsSucess(products: [ShopItem]) {
        isInitialLoading = false
        self.products = products
    }
    
    func getCitiesSuccess(cities: [String]) {
        onGetCitiesSuccess?(cities)
    }
    
    
}
