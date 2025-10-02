//
//  MainTextField.swift
//  MVVM test
//
//  Created by Fox on 29.09.2025.
//

import SwiftUI

struct MainTextField: View {
    var title: String
    @Binding var text: String
    @FocusState private var isFocused: Bool

    var body: some View {
        TextField(title, text: $text)
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
    MainTextField(title: "", text: $text)
        .padding(16)
}
