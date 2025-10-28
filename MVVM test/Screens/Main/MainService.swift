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
    
    var products: [ShopItem] = [
        ShopItem(id: UUID(), name: "iPhone 16 Pro",       price: 129990, imageLink: "https://picsum.photos/600?random=1",  category: .new,     city: "Москва"),
        ShopItem(id: UUID(), name: "MacBook Air M3",      price: 119990, imageLink: "https://picsum.photos/600?random=2",  category: .popular, city: "Санкт-Петербург"),
        ShopItem(id: UUID(), name: "AirPods Pro 2",       price: 22990,  imageLink: "https://picsum.photos/600?random=3",  category: .popular, city: "Казань"),
        ShopItem(id: UUID(), name: "Apple Watch Ultra 2", price: 94990,  imageLink: "https://picsum.photos/600?random=4",  category: .new,     city: "Москва"),
        ShopItem(id: UUID(), name: "iPad Air 5",          price: 64990,  imageLink: "https://picsum.photos/600?random=5",  category: .cheap,   city: "Новосибирск"),
        ShopItem(id: UUID(), name: "HomePod mini",        price: 9990,   imageLink: "https://picsum.photos/600?random=6",  category: .cheap,   city: "Екатеринбург"),
        ShopItem(id: UUID(), name: "Magic Keyboard",      price: 16990,  imageLink: "https://picsum.photos/600?random=7",  category: .popular, city: "Самара"),
        ShopItem(id: UUID(), name: "Magic Mouse",         price: 9990,   imageLink: "https://picsum.photos/600?random=8",  category: .cheap,   city: "Казань"),
        ShopItem(id: UUID(), name: "AirTag 4 pack",       price: 12990,  imageLink: "https://picsum.photos/600?random=9",  category: .popular, city: "Владивосток"),
        ShopItem(id: UUID(), name: "Apple TV 4K",         price: 17990,  imageLink: "https://picsum.photos/600?random=10", category: .popular, city: "Москва"),

        ShopItem(id: UUID(), name: "Beats Studio Pro",    price: 34990,  imageLink: "https://picsum.photos/600?random=11", category: .new,     city: "Санкт-Петербург"),
        ShopItem(id: UUID(), name: "Beats Fit Pro",       price: 22990,  imageLink: "https://picsum.photos/600?random=12", category: .popular, city: "Казань"),
        ShopItem(id: UUID(), name: "iPhone 15",           price: 99990,  imageLink: "https://picsum.photos/600?random=13", category: .cheap,   city: "Екатеринбург"),
        ShopItem(id: UUID(), name: "Mac mini M2",         price: 69990,  imageLink: "https://picsum.photos/600?random=14", category: .cheap,   city: "Самара"),
        ShopItem(id: UUID(), name: "Mac Studio",          price: 199990, imageLink: "https://picsum.photos/600?random=15", category: .popular, city: "Москва"),
        ShopItem(id: UUID(), name: "Pro Display XDR",     price: 499990, imageLink: "https://picsum.photos/600?random=16", category: .popular, city: "Москва"),
        ShopItem(id: UUID(), name: "iMac 24”",            price: 149990, imageLink: "https://picsum.photos/600?random=17", category: .new,     city: "Санкт-Петербург"),
        ShopItem(id: UUID(), name: "iPad Pro 12.9",       price: 149990, imageLink: "https://picsum.photos/600?random=18", category: .new,     city: "Казань"),
        ShopItem(id: UUID(), name: "Apple Pencil 2",      price: 10990,  imageLink: "https://picsum.photos/600?random=19", category: .cheap,   city: "Новосибирск"),
        ShopItem(id: UUID(), name: "Smart Cover",         price: 4990,   imageLink: "https://picsum.photos/600?random=20", category: .cheap,   city: "Владивосток"),

        ShopItem(id: UUID(), name: "AirPods 3",           price: 17990,  imageLink: "https://picsum.photos/600?random=21", category: .popular, city: "Москва"),
        ShopItem(id: UUID(), name: "iPhone 14",           price: 89990,  imageLink: "https://picsum.photos/600?random=22", category: .cheap,   city: "Екатеринбург"),
        ShopItem(id: UUID(), name: "MagSafe Charger",     price: 5490,   imageLink: "https://picsum.photos/600?random=23", category: .cheap,   city: "Самара"),
        ShopItem(id: UUID(), name: "Apple Watch SE",      price: 29990,  imageLink: "https://picsum.photos/600?random=24", category: .cheap,   city: "Новосибирск"),
        ShopItem(id: UUID(), name: "MacBook Pro 14”",     price: 189990, imageLink: "https://picsum.photos/600?random=25", category: .popular, city: "Казань"),
        ShopItem(id: UUID(), name: "AirPods Max",         price: 59990,  imageLink: "https://picsum.photos/600?random=26", category: .new,     city: "Москва"),
        ShopItem(id: UUID(), name: "HomePod 2",           price: 27990,  imageLink: "https://picsum.photos/600?random=27", category: .new,     city: "Санкт-Петербург"),
        ShopItem(id: UUID(), name: "Magic Trackpad",      price: 14990,  imageLink: "https://picsum.photos/600?random=28", category: .cheap,   city: "Самара"),
        ShopItem(id: UUID(), name: "Apple Vision Pro",    price: 699990, imageLink: "https://picsum.photos/600?random=29", category: .new,     city: "Москва"),
        ShopItem(id: UUID(), name: "AppleCare+",          price: 19990,  imageLink: "https://picsum.photos/600?random=30", category: .popular, city: "Казань")
    ]
    
    func getCities() {
        delegate.getCitiesSuccess(cities: cities)
    }
    
    func getProducts() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.delegate.getProductsSucess(products: self.products)
        }
        
    }
    

}
