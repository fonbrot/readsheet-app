//
//  AudioProvider.swift
//  readsheet
//
//  Created by fonbrot on 15.02.2022.
//

import Foundation
import AVFoundation

class AudioProvider {
    
    static let shared: AudioProvider = AudioProvider()
    
    private var audioPlayer: AVAudioPlayer?
    
    init() {
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.ambient)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch
            let error as NSError {
            print(error)
        }
    }
    
    func play(note: Int) {
        audioPlayer?.stop()
        if let path = Bundle.main.path(forResource: "\(note)", ofType: "wav") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.play()
            } catch {
                print("Could not find and play the sound file.")
            }
        }
    }
}
