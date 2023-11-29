//
//  Extensions.swift
//  Audio_Player
//
//  Created by Mikhail Demichev on 24.11.2023.
//

import SwiftUI

extension Color {
    
    static let customGreen = Color(hex: 0x8bb3a9)
    static let customGray = Color(hex: 0xa3a3a3)

    init(hex: UInt, alpha: Double = 0.7) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: alpha
        )
    }
}
