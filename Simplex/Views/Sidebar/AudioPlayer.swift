//
//  AudioPlayer.swift
//  Simplex
//
//  Created by Edmond Cheng on 10/7/2024.
//

import SwiftUI
import AVFoundation
var playerObject = AudioPlayerClass()
var flag: Bool = false
struct AudioPlayer: View {
    @State var isPlaying = false

    init(){
        playerObject.loadMusic()
    }
    
    var body: some View {
        if !isPlaying{
            Button{
                playerObject.playMusic()
                isPlaying = true
            }label:{
                Image(systemName: "play")
                    .font(.system(size: 100))
                    .foregroundStyle(.tint)
            }
            .buttonStyle(BorderlessButtonStyle())
        } else{
            Button{
                playerObject.player.pause()
                isPlaying = false
            }label:{
                Image(systemName: "pause")
                    .font(.system(size: 100))
                    .foregroundStyle(.tint)
            }
            .buttonStyle(BorderlessButtonStyle())
        }
    }
}

class AudioPlayerClass: NSObject, AVAudioPlayerDelegate{
    var player = AVAudioPlayer()
    var path = Bundle.main.path(forResource: "Ghostrifter-Official-Purple-Dream(chosic.com).mp3", ofType:nil)!
    
    override init(){
        super.init()
    }
    
    func loadMusic(){
        let url = URL(fileURLWithPath: path)
        do {
            playerObject.player = try AVAudioPlayer(contentsOf: url)
        } catch {
            // couldn't load file :(
            print("Couldn't load file")
        }
        player.delegate = self
    }
    
    func playMusic(){
        player.play()
    }
    
    func stopMusic(){
        player.stop()
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("The song ended")
        path = Bundle.main.path(forResource: "Ghostrifter-Official-City-Lights(chosic.com).mp3", ofType:nil)!
        loadMusic()
        playMusic()
        print("Playing next")
    }
}

#Preview {
    AudioPlayer()
}
