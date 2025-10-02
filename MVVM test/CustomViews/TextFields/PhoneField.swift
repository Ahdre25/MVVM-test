//
//  Untitled.swift
//  MVVM test
//
//  Created by Fox on 29.09.2025.
//

import SwiftUI

struct PhoneTextField: View {
    var title: String
    @Binding var text: String
    @FocusState private var isFocused: Bool
    let maxLength: Int = 10
    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: "phone.fill") // иконка телефона
                .foregroundColor(.gray)
            Text("+7")
            TextField(title, text: $text)
                .keyboardType(.phonePad)
                .focused($isFocused)
        }
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemGray6))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(isFocused ? Color.black : Color.gray, lineWidth: 1)
            )
            .contentShape(RoundedRectangle(cornerRadius: 16))
            .focused($isFocused)
    }
    
    
    
    
}

#Preview {
    @Previewable @State var text = ""
    PhoneTextField(title: "", text: $text)
        .padding(16)
}
