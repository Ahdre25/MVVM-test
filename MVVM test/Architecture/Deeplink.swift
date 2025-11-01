//
//  Deeplink.swift
//  MVVM test
//
//  Created by Fox on 28.10.2025.
//

import Foundation

enum DeepLink: Equatable {
    case product(id: UUID)
    case none
    
    init(url: URL) {
        guard url.scheme == "myshop" else {
            self = .none
            return
        }
        
        let components = url.pathComponents.filter { $0 != "/" }
        
        if components.first == "product", components.count > 1,
           let id = UUID(uuidString: components[1]) {
            self = .product(id: id)
        } else {
            self = .none
        }
    }
}
