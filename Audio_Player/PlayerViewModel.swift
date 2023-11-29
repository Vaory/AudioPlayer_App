//
//  PlayerViewModel.swift
//  Audio_Player
//
//  Created by Mikhail Demichev on 24.11.2023.
//

import SwiftUI
import AVFoundation

class PlayerViewModel: ObservableObject {
    
    @Published public var songDuration: TimeInterval = 0.0
    @Published public var currentTrackIndex: Int = 0
    @Published public var currentTime: TimeInterval = 0.0
    @Published public var isPlaying: Bool = false
    @Published private var isPaused: Bool = false
    
    private var player: AVAudioPlayer?
    private var tracks: [String] = [
        "Rick Astley - Never Gonna Give You Up",
        "Surprise Surprise - Cilla Black",
        "Michael Sembello - She's A Maniac"
    ]
    
    private var timer: Timer?
    
    init() {
        setupAudioSession()
    }
    
    private func setupAudioSession() {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playback)
        } catch {
            print("Setting category to AVAudioSessionCategoryPlayback failed.")
        }
    }
    
    public func play() {
           if isPaused {
               player?.play()
           } else {
               playSong(name: tracks[currentTrackIndex])
           }
           isPlaying = true
           isPaused = false
           startTimer()
    }
    
    public func pause() {
            player?.pause()
            isPlaying = false
            isPaused = true
            stopTimer()
        }
    
    
    public func setTime(value: TimeInterval) {
        guard let time = TimeInterval(exactly: value) else { return }
        player?.currentTime = time
        currentTime = time 
    }
    
    public func nextTrack() {
        stopTimer()
        isPlaying = false
        isPaused = false
        currentTrackIndex = (currentTrackIndex + 1) % tracks.count
        play()
    }

    public func previousTrack() {
        stopTimer()
        isPlaying = false
        isPaused = false
        currentTrackIndex = (currentTrackIndex - 1 + tracks.count) % tracks.count
        play()
    }
    
    public func songName() -> String {
        tracks[currentTrackIndex]
    }
    
    private func updateCurrentTime() {
        guard let player = player else { return }
        currentTime = player.currentTime
    }
    
    private func updateSongDuration() {
        guard let player = player else { return }
        songDuration = player.duration
    }
    
    private func playSong(name: String) {
        guard let audioPath = Bundle.main.path(forResource: name, ofType: "mp3") else {
            print("Audio file not found.")
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            if let player = player {
                player.prepareToPlay()
                songDuration = player.duration
                player.play()
                isPlaying = true
            }
        } catch {
            print("Error loading audio file: \(error)")
        }
    }
    private func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            self?.updateCurrentTime()
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
