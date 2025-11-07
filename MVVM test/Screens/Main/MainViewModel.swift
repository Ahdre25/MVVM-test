//
//  MainViewModel.swift
//  MVVM test
//
//  Created by Fox on 27.10.2025
//

import SwiftUI

final class MainViewModel: BaseViewModel {
    
    let service: MainService!
    
    var flow: MainFlowModel {
        flowProvider as! MainFlowModel
    }
    
    var onGetCitiesSuccess: (([String]) -> Void)?
    @Published var search: String = ""
    @Published var selectedCity: String = "Москва"
    @Published var selectedCategory: SearchCategory = .new
    @Published var products: [ShopItem] = [ShopItem(id: UUID(), name: "", price: 1, imageLink: ""), ShopItem(id: UUID(), name: "", price: 1, imageLink: ""), ShopItem(id: UUID(), name: "", price: 1, imageLink: ""), ShopItem(id: UUID(), name: "", price: 1, imageLink: "")]
    
    var isInitialLoading: Bool = true
    
    
    func onCityTap(){
        service.getCities()
    }
    override func onFirstAppear() {
        super.onFirstAppear()
        service.getProducts()
    }
    
    override func onAppear(){
        super.onAppear()
    }
    
    
    
    func handle(deeplink: DeepLink?) {
        guard let deeplink else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.check(deeplink: deeplink)
        })
        
    }
    
    
    private func check(deeplink: DeepLink) {
        switch(deeplink) {
            
        case .product(id: let id):
            flow.openDetail(id: id)
            
        case .none:
            break
        }
    }
    
    
    
    
    init() {
        service = MainService()
        super.init(flowProvider: MainFlowModel())
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
