//
//  AudioPlayer.swift
//  Simplex
//
//  Created by Edmond Cheng on 10/7/2024.
//

import SwiftUI
import AVFoundation
struct AudioPlayer: View {
    @EnvironmentObject var playerObject: AudioPlayerClass
    
    var body: some View {
        VStack{
            Text(playerObject.credits)
                .padding()
            
            AudioControls()
            
            if playerObject.isPlaying{
                Slider(value: $playerObject.playbackProgress, in: 0...(playerObject.player.duration))
                    .padding()
                    .onTapGesture {
                        playerObject.pauseMusic()
                    }
            } else{
                Slider(value: $playerObject.player.currentTime, in: 0...(playerObject.player.duration))
                    .padding()
            }
            
            Divider()
            HStack{
                Text("Volume: ")
                    .bold()
                    .padding()
                Spacer()
                Slider(value: $playerObject.player.volume, in: 0...1)
                    .padding()
            }
        }
    }
}



#Preview {
    AudioPlayer()
}
