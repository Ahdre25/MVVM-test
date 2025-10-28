//
//  LikeButton.swift
//  MVVM test
//
//  Created by Fox on 27.10.2025.
//

import SwiftUI

struct LikeButton: View {
    var isLiked: Bool
    var onTap: () -> Void
    
    var body: some View {
        Button(action: {
            
        }) {
            Image(systemName: isLiked ? "heart.fill" : "heart")
                .font(.system(size: 22))
                .foregroundColor(.red)
                .scaleEffect(isLiked ? 1.2 : 1.0)
        }
        .buttonStyle(.plain)
    }
}
