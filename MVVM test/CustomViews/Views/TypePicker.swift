//
//  TypePicker.swift
//  MVVM test
//
//  Created by Fox on 27.10.2025.
//

import SwiftUI

struct TypePicker: View {
    
    @State var selectedCategory: SearchCategory = .new
    
    
    var body: some View {
        HStack(spacing: 0) {
                            ForEach(SearchCategory.allCases) { category in
                                VStack(spacing: 4) {
                                    Text(category.rawValue)
                                        .font(.system(size: 16, weight: selectedCategory == category ? .semibold : .regular))
                                        .foregroundColor(selectedCategory == category ? .primary : .secondary)
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical, 10)
                                        
                                    
                                    Rectangle()
                                        .fill(selectedCategory == category ? Color.accentColor : Color.gray.opacity(0.2))
                                        .frame(height: 2)

                                }
                                .onTapGesture {
                                    withAnimation(.easeInOut(duration: 0.2)) {
                                        selectedCategory = category
                                    }
                                }
                            }
                        }
                        
                        .cornerRadius(10)
                        .padding()

    }
    
}

