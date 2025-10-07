//
//  PaymentListCell.swift
//  MVVM test
//
//  Created by Fox on 07.10.2025.
//

import SwiftUI

struct PaymentListCell: View {
    
    @State var item: ShopItem?
    
    var body: some View {
        
        HStack {
            ShimmeringImage(url: item?.imageLink).frame(width: 150, height: 150).cornerRadius(12)
            VStack(alignment: .leading) {
                Spacer().frame(height: 10)
                if let item = item {
                    Text(item.name)
                        .font(.headline)
                    Text("$\(item.price, specifier: "%.2f")")
                        .font(.subheadline)
                    Spacer()
                } else {
                    ShimmerView().frame(width: 200, height: 15)
                    ShimmerView().frame(width: 100, height: 15)
                    Spacer()
                    
                }
            }
            Spacer()
        }.frame(height: 150).padding(.horizontal)
    }
}


#Preview {
    let item = ShopItem(id: 0, name: "sfsfsfsd", price: 0.0, imageLink: "")
    PaymentListCell(item: item)
    PaymentListCell(item: nil)
}
