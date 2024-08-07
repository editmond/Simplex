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
                var skipValue:Double = 30
                switch playerObject.skipBackwardAmount{
                case .five:
                    skipValue = 5
                case .ten:
                    skipValue = 10
                case .fifteen:
                    skipValue = 15
                case .thirty:
                    skipValue = 30
                case .fourtyFive:
                    skipValue = 45
                case .sixty:
                    skipValue = 60
                case .seventyFive:
                    skipValue = 75
                case .ninety:
                    skipValue = 90
                }
                playerObject.player.currentTime -= skipValue
            }label:{
                switch playerObject.skipBackwardAmount{
                case .five:
                    Image(systemName: "gobackward.5")
                        .font(.system(size: 50))
                        .foregroundStyle(.tint)
                case .ten:
                    Image(systemName: "gobackward.10")
                        .font(.system(size: 50))
                        .foregroundStyle(.tint)
                case .fifteen:
                    Image(systemName: "gobackward.15")
                        .font(.system(size: 50))
                        .foregroundStyle(.tint)
                case .thirty:
                    Image(systemName: "gobackward.30")
                        .font(.system(size: 50))
                        .foregroundStyle(.tint)
                case .fourtyFive:
                    Image(systemName: "gobackward.45")
                        .font(.system(size: 50))
                        .foregroundStyle(.tint)
                case .sixty:
                    Image(systemName: "gobackward.60")
                        .font(.system(size: 50))
                        .foregroundStyle(.tint)
                case .seventyFive:
                    Image(systemName: "gobackward.75")
                        .font(.system(size: 50))
                        .foregroundStyle(.tint)
                case .ninety:
                    Image(systemName: "gobackward.90")
                        .font(.system(size: 50))
                        .foregroundStyle(.tint)
                }
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
            SkipForward()

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

struct SkipForward: View{
    @EnvironmentObject var playerObject: AudioPlayerClass
    var body: some View {
        Button{
            var skipValue:Double = 30
            switch playerObject.skipForwardAmount{
            case .five:
                skipValue = 5
            case .ten:
                skipValue = 10
            case .fifteen:
                skipValue = 15
            case .thirty:
                skipValue = 30
            case .fourtyFive:
                skipValue = 45
            case .sixty:
                skipValue = 60
            case .seventyFive:
                skipValue = 75
            case .ninety:
                skipValue = 90
            }

            if playerObject.player.currentTime + skipValue > playerObject.player.duration{
                playerObject.player.currentTime = playerObject.player.duration - 1
            } else{
//                    playerObject.player.currentTime += playerObject.skipForwardAmount
                playerObject.player.currentTime += skipValue
            }
        }label:{
            switch playerObject.skipForwardAmount{
            case .five:
                Image(systemName: "goforward.5")
                    .font(.system(size: 50))
                    .foregroundStyle(.tint)
            case .ten:
                Image(systemName: "goforward.10")
                    .font(.system(size: 50))
                    .foregroundStyle(.tint)
            case .fifteen:
                Image(systemName: "goforward.15")
                    .font(.system(size: 50))
                    .foregroundStyle(.tint)
            case .thirty:
                Image(systemName: "goforward.30")
                    .font(.system(size: 50))
                    .foregroundStyle(.tint)
            case .fourtyFive:
                Image(systemName: "goforward.45")
                    .font(.system(size: 50))
                    .foregroundStyle(.tint)
            case .sixty:
                Image(systemName: "goforward.60")
                    .font(.system(size: 50))
                    .foregroundStyle(.tint)
            case .seventyFive:
                Image(systemName: "goforward.75")
                    .font(.system(size: 50))
                    .foregroundStyle(.tint)
            case .ninety:
                Image(systemName: "goforward.90")
                    .font(.system(size: 50))
                    .foregroundStyle(.tint)
            }
        }
        .buttonStyle(BorderlessButtonStyle())
    }
}

#Preview {
    AudioControls()
}
