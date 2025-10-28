//
//  BannerView.swift
//  MVVM test
//
//  Created by Fox on 27.10.2025.
//

import SwiftUI

struct BannerCarouselView: View {
    
    @State private var timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    let banners = [
        "https://picsum.photos/600/",
        "https://picsum.photos/600/",
        "https://picsum.photos/600/",
        "https://picsum.photos/600/",
        "https://picsum.photos/600/",
        "https://picsum.photos/600/",
        "https://picsum.photos/600/",
        "https://picsum.photos/600/",
        "https://picsum.photos/600/"
    ]
    
    @State private var currentPage = 0

    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(banners.indices, id: \.self) { index in
                    ShimmeringImage(url: banners[index]).cornerRadius(16).padding(.horizontal)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 240)
            .onReceive(timer) { _ in
                withAnimation {
                    currentPage = (currentPage + 1) % banners.count
                }
            }

            HStack(spacing: 8) {
                ForEach(banners.indices, id: \.self) { index in
                    Circle()
                        .fill(currentPage == index ? Color.purple : Color.gray.opacity(0.3))
                        .frame(width: 10, height: 10)
                }
            }
            .padding(.top, 8)
        }
    }
    
    
    
}

#Preview {
    BannerCarouselView()
}
