//
//  ControlButtonsView.swift
//  Audio_Player
//
//  Created by Mikhail Demichev on 24.11.2023.
//

import SwiftUI

struct ControlButtonsView: View {
    @ObservedObject var viewModel = PlayerViewModel()
    @Binding var pausePressed: Bool 
    
    var body: some View {
        
        HStack {
            
            Button(action: {
                self.viewModel.previousTrack()
            }, label: {
                Image("PreviousSong_icon")
                    .resizable()
                    .frame(width: 30, height: 30)
            }).frame(width: 50, height: 50)
                .background(Color.customGreen)
                .clipShape(Circle())
                            
            Spacer().frame(width: 25)
                            
            Button(action: {
                self.pausePressed.toggle()
                if self.pausePressed {
                    self.viewModel.pause()
                } else {
                    self.viewModel.play()
                }
            }, label: {
                if self.pausePressed {
                    Image("Play_icon").resizable()
                        .frame(width: 45, height: 40)
                        .offset(x: 4)
                } else {
                    Image("Pause_icon").resizable()
                        .frame(width: 45, height: 40)
                }
            }).frame(width: 70, height: 70)
                .background(Color.customGreen)
                .clipShape(Circle())
                                    
            Spacer().frame(width: 25)
                            
            Button(action: {
                self.viewModel.nextTrack() 
            }, label: {
                Image("NextSong_icon")
                    .resizable()
                    .frame(width: 30, height: 30)
            }).frame(width: 50, height: 50)
                .background(Color.customGreen)
                .clipShape(Circle())
        }.offset(y:60)
    }
}

