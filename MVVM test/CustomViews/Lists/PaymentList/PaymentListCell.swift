//
//  PaymentListCell.swift
//  MVVM test
//
//  Created by Fox on 07.10.2025.
//

import SwiftUI

struct PaymentListCell: View {
    
    @State var item: ShopItem?
    var onLikeTap: (() -> Void)
    
    var body: some View {
        
        VStack {
            ZStack(alignment: .topTrailing) {
                ShimmeringImage(url: item?.imageLink).cornerRadius(12)
                if let item = item {
                    LikeButton(isLiked: item.isLiked, onTap: onLikeTap).padding()
                }
            }.aspectRatio(3/4, contentMode: .fill)
            VStack(alignment: .leading) {
                Spacer().frame(height: 10)
                if let item = item {
                    Text(item.name)
                        .font(.headline)
                    Text("$\(item.price, specifier: "%.2f")")
                        .font(.subheadline)
                    Spacer()
                } else {
                    ShimmerView()
                    ShimmerView()
                    Spacer()
                    
                }
            }
            Spacer()
        }
    }
}


#Preview {
    
    let item = ShopItem(id: UUID(), name: "sfsfsfsd", price: 0.0, imageLink: "", isLiked: false)
    VStack {
        HStack {
            PaymentListCell(item: item, onLikeTap: {
                
            })
            PaymentListCell(item: nil, onLikeTap: {
                
            })
        }
    }.padding()
}
