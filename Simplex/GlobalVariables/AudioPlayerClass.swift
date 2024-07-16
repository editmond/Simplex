//
//  AudioPlayerClass.swift
//  Simplex
//
//  Created by Edmond Cheng on 12/7/2024.
//

import Foundation
import AVFoundation
class AudioPlayerClass: NSObject, AVAudioPlayerDelegate, ObservableObject{
    var settingsFile = "Audio_Settings.txt"
    
    var player = AVAudioPlayer()
    
    var musicQueue: [String] = ["Ghostrifter-Official-Purple-Dream(chosic.com).mp3",
                           "Ghostrifter-Official-City-Lights(chosic.com).mp3"]
    var creditsQueue: [String] = ["Purple Dream by Ghostrifter Official - Chosic.txt",
                                  "City Lights [Lofi Study Music] by Ghostrifter Official - Chosic.txt"]
    var queueIndex = 0
    
    var musicPath = Bundle.main.path(forResource: "Ghostrifter-Official-Purple-Dream(chosic.com).mp3", ofType:nil)!
    var creditsPath = Bundle.main.path(forResource: "Purple Dream by Ghostrifter Official - Chosic.txt", ofType:nil)!
    
    //should only be accessed by the audio player.
    @Published var credits: String = ""
    @Published var playbackProgress: Double = 0
    @Published var isPlaying = false
    @Published var stringedTimeProgress = ["", ""]
    @Published var stringedTimeRemainder = ["", ""]
    
    @Published var retainedVolume: Float = 1.0
    
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
        player.volume = retainedVolume
    }
    
    func playMusic(){
        player.prepareToPlay()
        player.play()
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ timer in
            self.playbackProgress = self.player.currentTime
            self.stringedTimeProgress = self.convertToStringTime(raw: self.player.currentTime)
            self.stringedTimeRemainder = self.convertToStringTime(raw: self.player.duration-self.player.currentTime)
            self.retainedVolume = self.player.volume
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
    
    func convertToStringTime(raw: Double) -> [String]{
        let minutes = floor(raw/60)
        let seconds = round(raw - minutes*60)
        if seconds >= 10{
            return ["\(Int(minutes))","\(Int(seconds))"]
        }
        return ["\(Int(minutes))","0\(Int(seconds))"]
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        isPlaying = false
        queueIndex += 1
        loadMusic()
        playMusic()
    }
    
    //writes the settings of the object into the settings file.
    func writeSettings(){
        //prepare an array for writing
        var formattedSettings: [String:[String]] = [:]
        formattedSettings["musicQueue"] = musicQueue
        formattedSettings["creditsQueue"] = creditsQueue
        
        
        //write the array into the settings file
        saveSettings(settingVars: formattedSettings, settingsFile: settingsFile)
    }
}
