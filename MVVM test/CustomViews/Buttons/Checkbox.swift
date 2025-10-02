//
//  Checkbox.swift
//  MVVM test
//
//  Created by Fox on 30.09.2025.
//

import SwiftUI

struct Checkbox: View {
    let text: String
    @Binding var isChecked: Bool
    let linkText: String
    let link: URL?
    var body: some View {
        HStack {
            Button(action: {
                isChecked.toggle()
            }) {
                HStack {
                    Image(systemName: isChecked ? "checkmark.square" : "square")
                    .foregroundColor(isChecked ? .blue : .gray)
                }
            }
            HStack {
                var string = AttributedString(text)
                if let range = string.range(of: linkText) {
                    string[range].link = link
                    string[range].foregroundColor = .blue
                    string[range].underlineStyle = .single
                }
                
                return Text(string).font(.system(size: 12)).lineSpacing(0).multilineTextAlignment(.leading)
            }
        }
    }
    
    
    
    
}

#Preview {
    @Previewable @State var isChecked = false
    Checkbox(text: "Я принимаю Условия пользовательского соглашения", isChecked: $isChecked, linkText: "Условия пользовательского соглашения", link: URL(string: "https://google.com"))
        .padding(16)
}

