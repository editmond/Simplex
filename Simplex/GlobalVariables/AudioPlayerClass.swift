//
//  AudioPlayerClass.swift
//  Simplex
//
//  Created by Edmond Cheng on 12/7/2024.
//

import Foundation
import AVFoundation

enum skipAmount: String, CaseIterable, Identifiable {
    case five, ten, fifteen, thirty, fourtyFive, sixty, seventyFive, ninety
    var id: Self { self }
}

class AudioPlayerClass: NSObject, AVAudioPlayerDelegate, ObservableObject{
    var settingsFile = "Audio_Settings.txt"
    
    var player = AVAudioPlayer()
    
    var musicQueue: [String] = ["Ghostrifter-Official-Purple-Dream(chosic.com).mp3",
                           "Ghostrifter-Official-City-Lights(chosic.com).mp3"]
    var creditsQueue: [String] = ["Credits1",
                                  "Credits2"]
    var queueIndex = 0
    
    var musicPath = Bundle.main.path(forResource: "Ghostrifter-Official-Purple-Dream(chosic.com).mp3", ofType:nil)!
    var creditsPath = Bundle.main.path(forResource: "Credits1", ofType:nil)!
    
    //should only be accessed by the audio player.
    @Published var credits: String = ""
    @Published var playbackProgress: Double = 0
    @Published var isPlaying = false
    @Published var stringedTimeProgress = ["", ""]
    @Published var stringedTimeRemainder = ["", ""]
    
    @Published var retainedVolume: Float = 1.0
    
    @Published var skipForwardAmount: skipAmount = .thirty
    @Published var skipBackwardAmount: skipAmount = .thirty
    
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
//            self.retainedVolume = self.player.volume
            self.player.volume = self.retainedVolume
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
    
    //The following methods are for allowing changing settings and loading them from file.
    
    //copies the contents of another AudioPlayerClass object into the current object.
    func copyContents(AudioObj: AudioPlayerClass){
        retainedVolume = AudioObj.retainedVolume
        queueIndex = AudioObj.queueIndex
        
        musicQueue = AudioObj.musicQueue
        creditsQueue = AudioObj.creditsQueue
        skipForwardAmount = AudioObj.skipForwardAmount
        skipBackwardAmount = AudioObj.skipBackwardAmount
        
        player.volume = retainedVolume
    }
    
    //writes the settings of the object into the settings file.
    func writeSettings(){
        
        //prepare an array for writing
        var formattedSettings: [String:[String]] = [:]
        formattedSettings["musicQueue"] = musicQueue
        formattedSettings["creditsQueue"] = creditsQueue
        
        formattedSettings["retainedVolume"] = [String(retainedVolume)]
        formattedSettings["queueIndex"] = [String(queueIndex)]

        //write the array into the settings file
        saveSettings(settingVars: formattedSettings, settingsFile: settingsFile)
    }
    
    init(doLoad: Bool){
        
        super.init()
        
        if doLoad{
            let loadedSettings = loadSettings(settingsFile: settingsFile)
            
            print("Audio Settings found: \n\(loadedSettings)")
            
            var temp = loadedSettings["musicQueue", default: [""]]
            musicQueue = temp
            
            temp = loadedSettings["creditsQueue", default: [""]]
            creditsQueue = temp
            
            temp = loadedSettings["retainedVolume", default: [""]]
            retainedVolume = Float(temp[0]) ?? 1.0

            temp = loadedSettings["queueIndex", default: [""]]
            queueIndex = Int(temp[0]) ?? 1
        }
        
        loadMusic()
    }
}
