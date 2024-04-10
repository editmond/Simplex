//
//  GUISettingsView.swift
//  Simplex
//
//  Created by Edmond Cheng on 28/1/2024.
//

import SwiftUI

struct GUISettingsView: View {
    @EnvironmentObject var guiVars: GUIVariables //this view accesses the buffer object
    
//    @State var bgColor = Color(hue: guiVars.backgroundHue, saturation: guiVars.backgroundSaturation, brightness: guiVars.backgroundBrightness)
//    @State var bgColor = Color(hue: 0, saturation: 1, brightness: 1)
    @State var bgColor = Color(hue: loadBackgroundHue(), saturation: loadBackgroundSaturation(), brightness: loadBackgroundBrightness())
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
                
                Slider(value: $guiVars.backgroundHue, in: 0...1) // a slider to adjust hue
                
                Button(){
                    guiVars.backgroundHue += 0.01
                } label: {
                    Image(systemName: "plus")
                }.disabled((guiVars.backgroundHue < 1) ? false : true)
                
                Spacer()
                ColorPicker("", selection: $bgColor)
                    
//                RoundedRectangle(cornerRadius: 10) //displays a preview of the chosen colour.
//                    .fill(guiVars.getBackgroundColour(brightnessMultiplier: 1, saturationMultiplier: 1))
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 10)
//                            .stroke(Color.white, lineWidth: 5)
//                            .shadow(radius: 10)
//                    )
//                    .frame(width: 45, height: 30)
//                    .padding()
            }
            .padding()
            .onChange(of: bgColor, initial: true){
                guiVars.setBackgroundColor(backgroundColour: bgColor)
            }
            Spacer()
        }
        .navigationTitle("Settings - GUI")
    }
}

#Preview {
    GUISettingsView()
}
