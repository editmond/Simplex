//
//  AudioSettingsView.swift
//  Simplex
//
//  Created by Edmond Cheng on 12/7/2024.
//

import SwiftUI

struct AudioSettingsView: View {
    
    @EnvironmentObject var playerObject: AudioPlayerClass
    
    var body: some View {
        VStack{
            HStack{
                Text("Volume: ")
                    .bold()
                    .padding()
                Spacer()
                Slider(value: $playerObject.retainedVolume, in: 0...1)
                    .padding()
                Text("\(playerObject.retainedVolume)")
            }
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    AudioSettingsView()
}
