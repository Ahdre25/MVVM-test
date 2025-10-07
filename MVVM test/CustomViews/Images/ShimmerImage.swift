//
//  ShimmerImage.swift
//  MVVM test
//
//  Created by Fox on 07.10.2025.
//

import SwiftUI
import Kingfisher

struct ShimmeringImage: View {
    let url: String?
    
    var body: some View {
        KFImage(URL(string: url ?? ""))
            .placeholder {
                ShimmerView()
                    .cornerRadius(12)
            }
        
            .resizable()
        
            .aspectRatio(contentMode: .fill)
            
            .padding(.horizontal)
            .clipped()
        
    }
}




#Preview {
    ShimmerView()
        .cornerRadius(12)
        .padding(.horizontal)
    ShimmeringImage(url: "https://picsum.photos/200/")
}
