//
//  MainButton.swift
//  MVVM test
//
//  Created by Fox on 26.09.2025.
//

import SwiftUI

struct MainButton: View {
    
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title).font(.system(size: 14, weight: .semibold)).frame(maxWidth: .infinity)
        }
    }
}


#Preview {
    MainButton(title: "Войти", action: {}).auth(isActive: true)
    MainButton(title: "Войти", action: {}).auth(isActive: false).padding(.horizontal, 16)
}



struct AuthButtonModifier: ViewModifier {
    
    var isActive: Bool
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(isActive ? Color.design.buttonBackgroundPrimaryDefault : Color.design.buttonBackgroundDisabled)
            .foregroundColor(isActive ? .white : .design.buttonLightGray)
            .cornerRadius(16)
            .disabled(!isActive)
           
    }
}

extension MainButton {
    func auth(isActive: Bool) -> some View {
        
        return self.modifier(AuthButtonModifier(isActive: isActive))
    }
}


