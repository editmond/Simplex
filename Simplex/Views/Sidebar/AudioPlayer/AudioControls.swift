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
        }
    }
}

#Preview {
    AudioControls()
}
