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
                Picker("Skip Forward Amount", selection: $playerObject.skipForwardAmount){
                    Text("5").tag(skipAmount.five)
                    Text("10").tag(skipAmount.ten)
                    Text("15").tag(skipAmount.fifteen)
                    Text("30").tag(skipAmount.thirty)
                    Text("45").tag(skipAmount.fourtyFive)
                    Text("60").tag(skipAmount.sixty)
                    Text("75").tag(skipAmount.seventyFive)
                    Text("90").tag(skipAmount.ninety)
                }
                Picker("Skip Backward Amount", selection: $playerObject.skipBackwardAmount){
                    Text("5").tag(skipAmount.five)
                    Text("10").tag(skipAmount.ten)
                    Text("15").tag(skipAmount.fifteen)
                    Text("30").tag(skipAmount.thirty)
                    Text("45").tag(skipAmount.fourtyFive)
                    Text("60").tag(skipAmount.sixty)
                    Text("75").tag(skipAmount.seventyFive)
                    Text("90").tag(skipAmount.ninety)
                }
            }
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    AudioSettingsView()
}
