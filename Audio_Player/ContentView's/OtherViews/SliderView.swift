//
//  SliderView.swift
//  Audio_Player
//
//  Created by Mikhail Demichev on 24.11.2023.
//

import SwiftUI

struct CustomSliderView: View {
    @ObservedObject var viewModel: PlayerViewModel
    var currentTime: TimeInterval
    var totalDuration: TimeInterval
    
    var body: some View {
        
        VStack {
            Slider(value: Binding<Double>(
                get: { currentTime },
                set: { newValue in
                    viewModel.setTime(value: newValue)
                }
            ), in: 0...totalDuration)
            .accentColor(.customGreen)
                
            HStack {
                Text(formatTimeInterval(currentTime))
                    .foregroundColor(.gray)
                      
                Spacer().frame(width: 260)
                      
                Text(formatTimeInterval(totalDuration -  currentTime))
                    .foregroundColor(.gray)
            }
      }
    }
    
    private func formatTimeInterval(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
