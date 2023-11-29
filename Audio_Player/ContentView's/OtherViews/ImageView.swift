//
//  ImageView.swift
//  Audio_Player
//
//  Created by Mikhail Demichev on 28.11.2023.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        
        ZStack{
            Rectangle()
                .frame(width: 375, height: 375)
                .foregroundColor(.customGray)
                .cornerRadius(20)
                .padding()
            
            Image("Music_icon")
                .resizable()
                .frame(width: 150, height: 150)
                .offset(x: -10)
        }
    }
}

