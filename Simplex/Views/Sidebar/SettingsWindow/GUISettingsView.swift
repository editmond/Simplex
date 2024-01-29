//
//  GUISettingsView.swift
//  Simplex
//
//  Created by Edmond Cheng on 28/1/2024.
//

import SwiftUI

struct GUISettingsView: View {
    @EnvironmentObject var guiVars: GUIVariables //this view accesses the buffer object
    var body: some View{
        VStack{
            Text("Gui Settings")
                .padding()
            HStack{
                Text("Background Hue: ")
                    .padding()
                    .bold()
                
                Button(){
                    guiVars.backgroundHue -= 0.01
                } label: {
                    Image(systemName: "minus")
                }.disabled((guiVars.backgroundHue > 0) ? false : true)
                
                Slider(value: $guiVars.backgroundHue, in: 0...1)
                
                Button(){
                    guiVars.backgroundHue += 0.01
                } label: {
                    Image(systemName: "plus")
                }.disabled((guiVars.backgroundHue < 1) ? false : true)
                
                Spacer()
                RoundedRectangle(cornerRadius: 10)
                    .fill(guiVars.getBackgroundColour(brightnessMultiplier: 1, saturationMultiplier: 1))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 5)
                            .shadow(radius: 10)
                    )
                    .frame(width: 45, height: 30)
                    .padding()
            }
            .padding()
            Spacer()
        }
        .navigationTitle("Settings - GUI")
    }
}

#Preview {
    GUISettingsView()
}
