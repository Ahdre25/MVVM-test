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
        guard url.scheme == "mvvmtest" else {
            self = .none
            return
        }
        let idString = url.pathComponents.dropFirst().first
        let id = UUID(uuidString: idString ?? "")
        if url.host == "product",
           let idString = url.pathComponents.dropFirst().first, let id = UUID(uuidString: idString) {
            self = .product(id: id)
        } else {
            self = .none
        }
    }
}
