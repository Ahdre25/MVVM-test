//
//  MainNodel.swift
//  MVVM test
//
//  Created by Fox on 27.10.2025.
//

enum SearchCategory: String, CaseIterable, Identifiable, Codable {
    case new = "Новинки"
    case popular = "Популярное"
    case cheap = "Дешевое"
    
    var id: String { rawValue }
}

struct ShopItem: Codable {
    let id: Int32
    let name: String
    let price: Double
    let imageLink: String
    var isLiked: Bool = false
    var category: SearchCategory
}
