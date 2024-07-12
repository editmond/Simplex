//
//  AudioControls.swift
//  Simplex
//
//  Created by Edmond Cheng on 12/7/2024.
//

import SwiftUI

struct AudioControls: View {
    @EnvironmentObject var playerObject: AudioPlayerClass
    
    var body: some View {
        HStack{
            //jump to previous in queue
            Button{
                playerObject.stopMusic()
                playerObject.queueIndex -= 1
                playerObject.loadMusic()
                playerObject.playMusic()
            }label:{
                Image(systemName: "backward.end")
                    .font(.system(size: 50))
                    .foregroundStyle(.tint)
            }
            .buttonStyle(BorderlessButtonStyle())
            
            //jump backward 15 seconds
            Button{
                playerObject.player.currentTime -= 15
            }label:{
                Image(systemName: "gobackward.15")
                    .font(.system(size: 50))
                    .foregroundStyle(.tint)
            }
            .buttonStyle(BorderlessButtonStyle())

            //The pause-unpuase button
            if !playerObject.isPlaying{
                Button{
                    playerObject.playMusic()
                    playerObject.isPlaying = true
                }label:{
                    Image(systemName: "play")
                        .font(.system(size: 100))
                        .foregroundStyle(.tint)
                }
                .buttonStyle(BorderlessButtonStyle())
                .padding()
            } else{
                Button{
                    playerObject.pauseMusic()
                }label:{
                    Image(systemName: "pause")
                        .font(.system(size: 100))
                        .foregroundStyle(.tint)
                }
                .buttonStyle(BorderlessButtonStyle())
            }
            
            //jump forward 15 seconds
            Button{
                if playerObject.player.currentTime + 15 > playerObject.player.duration{
                    playerObject.player.currentTime = playerObject.player.duration - 1
                } else{
                    playerObject.player.currentTime += 15
                }
            }label:{
                Image(systemName: "goforward.15")
                    .font(.system(size: 50))
                    .foregroundStyle(.tint)
            }
            .buttonStyle(BorderlessButtonStyle())

            //jump to next in queue
            Button{
                playerObject.stopMusic()
                playerObject.queueIndex += 1
                playerObject.loadMusic()
                playerObject.playMusic()
            }label:{
                Image(systemName: "forward.end")
                    .font(.system(size: 50))
                    .foregroundStyle(.tint)
            }
            .buttonStyle(BorderlessButtonStyle())
        }
    }
}

#Preview {
    AudioControls()
}
