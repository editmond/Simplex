//
//  AudioPlayer.swift
//  Simplex
//
//  Created by Edmond Cheng on 10/7/2024.
//

import SwiftUI
import AVFoundation
var AudioPlayerObject: AVAudioPlayer?

struct AudioPlayer: View {
    var body: some View {
        
        Button("Play music!"){
            let path = Bundle.main.path(forResource: "Ghostrifter-Official-Purple-Dream(chosic.com).mp3", ofType:nil)!
            let url = URL(fileURLWithPath: path)
            do {
                AudioPlayerObject = try AVAudioPlayer(contentsOf: url)
                AudioPlayerObject?.play()
            } catch {
                // couldn't load file :(
                print("uh oh")
            }
        }.font(.system(size: 100))
        Button("Stop"){
            AudioPlayerObject?.stop()
        }
    }
}

#Preview {
    AudioPlayer()
}
