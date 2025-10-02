//
//  Appearence.swift
//  MVVM test
//
//  Created by Fox on 26.09.2025.
//

import SwiftUI



extension Color {
    static let design: DesignColors = DesignColors()
}

struct DesignColors {
    let buttonBackgroundPrimaryDefault: Color = Color(red: 0.18, green: 0.25, blue: 0.34)
    let buttonBackgroundDisabled: Color = Color(red: 0.94, green: 0.96, blue: 0.97)
    let white: Color = .white
    let buttonLightGray: Color = Color(red: 0.76, green: 0.82, blue: 0.89)
    
}
