//
//  Loader.swift
//  MVVM test
//
//  Created by Fox on 02.10.2025.
//

import SwiftUI

struct LoaderViewModifier: ViewModifier {
    let isLoading: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .disabled(isLoading)
            
            if isLoading {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(1.5)
            }
        }
    }
}

extension View {
    func loading(_ isLoading: Bool) -> some View {
        self.modifier(LoaderViewModifier(isLoading: isLoading))
    }
}
