//
//  SegmentedField.swift
//  MVVM test
//
//  Created by Fox on 30.09.2025.
//

import SwiftUI

struct SegmentedField: View {
    @Binding var code: String
    @FocusState private var isFocused: Bool
    @State private var showCursor = true
    
    let length = 6
    
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                ForEach(0..<length, id: \.self) { index in
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(borderColor(for: index), lineWidth: 2)
                            .frame(width: 40, height: 50)
                        
                        if index < code.count {
                            // Уже введённая цифра
                            Text(character(at: index))
                                .font(.title2)
                        } else if index == code.count, isFocused {
                            // Курсор на активной позиции
                            Rectangle()
                                .fill(Color.blue)
                                .frame(width: 2, height: 28)
                                .opacity(showCursor ? 1 : 0)
                                .onAppear {
                                    withAnimation(.easeInOut(duration: 0.6).repeatForever()) {
                                        showCursor.toggle()
                                    }
                                }
                        }
                    }
                }
            }
            .onTapGesture {
                isFocused = true
            }
            
            TextField("", text: $code)
                .keyboardType(.numberPad)
                .textContentType(.oneTimeCode)
                .foregroundColor(.clear)
                .accentColor(.clear)
                .disableAutocorrection(true)
                .focused($isFocused)
                .onChange(of: code) { newValue in
                    code = String(newValue.filter { $0.isNumber }.prefix(length))
                }
        }
    }
    
    private func character(at index: Int) -> String {
        guard index < code.count else { return "" }
        let charIndex = code.index(code.startIndex, offsetBy: index)
        return String(code[charIndex])
    }
    
    private func borderColor(for index: Int) -> Color {
        if code.count == index && isFocused {
            return .blue
        } else {
            return .gray
        }
    }
}


#Preview {
    @Previewable @State var text: String = ""
    SegmentedField(code: $text)
}
