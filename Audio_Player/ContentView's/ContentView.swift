//
//  ContentView.swift
//  Audio_Player
//
//  Created by Mikhail Demichev on 23.11.2023.
//
import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = PlayerViewModel()
    @State private var pausePressed = true
   
        
    var body: some View {
        VStack {
           ImageView()
        
            VStack {
                Text("\(viewModel.songName())")
                    .foregroundColor(.gray)
                    .font(.title2)
                
                CustomSliderView(
                    viewModel: viewModel,
                    currentTime: viewModel.currentTime,
                    totalDuration: viewModel.songDuration
                )
                .padding()
            }.offset(y: 70)
            
            ControlButtonsView(viewModel: viewModel, pausePressed: $pausePressed)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
