//
//  AudioPlayerClass.swift
//  Simplex
//
//  Created by Edmond Cheng on 12/7/2024.
//

import Foundation
import AVFoundation
class AudioPlayerClass: NSObject, AVAudioPlayerDelegate, ObservableObject{
    var player = AVAudioPlayer()
    
    var musicQueue: [String] = ["Ghostrifter-Official-Purple-Dream(chosic.com).mp3",
                           "Ghostrifter-Official-City-Lights(chosic.com).mp3"]
    var creditsQueue: [String] = ["Purple Dream by Ghostrifter Official - Chosic.txt",
                                  "City Lights [Lofi Study Music] by Ghostrifter Official - Chosic.txt"]
    var queueIndex = 0
    
    var musicPath = Bundle.main.path(forResource: "Ghostrifter-Official-Purple-Dream(chosic.com).mp3", ofType:nil)!
    var creditsPath = Bundle.main.path(forResource: "Purple Dream by Ghostrifter Official - Chosic.txt", ofType:nil)!
    @Published var credits: String = ""
    @Published var playbackProgress: Double = 0
    @Published var isPlaying = false
    
    override init(){
        super.init()
        loadMusic()
    }
    
    func loadMusic(){
        if queueIndex == musicQueue.count{
            queueIndex = 0
        }
        if queueIndex < 0{
            queueIndex = musicQueue.count - 1
        }
        musicPath = Bundle.main.path(forResource: musicQueue[queueIndex], ofType:nil)!
        creditsPath = Bundle.main.path(forResource: creditsQueue[queueIndex], ofType:nil)!
        let url = URL(fileURLWithPath: musicPath)
        do {
            player = try AVAudioPlayer(contentsOf: url)
        } catch {
            // couldn't load file :(
            print("Couldn't load file")
        }
        do{
            credits = try String(contentsOfFile: creditsPath)
        } catch{
            print("credits could not be found.")
        }
        player.delegate = self
    }
    
    func playMusic(){
        player.prepareToPlay()
        player.play()
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ timer in
            self.playbackProgress = self.player.currentTime
            
            if !self.isPlaying{
                timer.invalidate()
            }
        }
        isPlaying = true
    }
    
    func pauseMusic(){
        player.pause()
        isPlaying = false
    }
    
    func stopMusic(){
        player.stop()
        isPlaying = false
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        isPlaying = false
        queueIndex += 1
        loadMusic()
        playMusic()
    }
}
