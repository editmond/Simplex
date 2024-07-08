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
            Text("Current Colour: ")
            RoundedRectangle(cornerRadius: 10) //displays a preview of the chosen colour.
                .fill(guiVars.getBackgroundColour(brightnessMultiplier: 1, saturationMultiplier: 1))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 5)
                        .shadow(radius: 10)
                )
                .frame(width: .infinity, height: 50)
                .padding()
            // The slider for changing the background hue.
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
                
                ColorPicker("", selection: $bgColor)
                Spacer()

            }
            .onChange(of: bgColor, initial: true){
                guiVars.setBackgroundColor(backgroundColour: bgColor)
            }
            
            // The slider for changing the background saturation.
            HStack{
                Text("Background Saturation: ")
                    .padding()
                    .bold()
                
                Button(){
                    guiVars.backgroundSaturation -= 0.01
                } label: {
                    Image(systemName: "minus")
                }.disabled((guiVars.backgroundSaturation > 0) ? false : true)
                
                Slider(value: $guiVars.backgroundSaturation, in: 0...1) // a slider to adjust hue
                
                Button(){
                    guiVars.backgroundSaturation += 0.01
                } label: {
                    Image(systemName: "plus")
                }.disabled((guiVars.backgroundSaturation < 1) ? false : true)
                
                ColorPicker("", selection: $bgColor)
                Spacer()

            }
            .onChange(of: bgColor, initial: true){
                guiVars.setBackgroundColor(backgroundColour: bgColor)
            }
            
            // The slider for controlling the background brightness
            HStack{
                Text("Background Brightness: ")
                    .padding()
                    .bold()
                
                Button(){
                    guiVars.backgroundBrightness -= 0.01
                } label: {
                    Image(systemName: "minus")
                }.disabled((guiVars.backgroundBrightness > 0) ? false : true)
                
                Slider(value: $guiVars.backgroundBrightness, in: 0...1) // a slider to adjust hue
                
                Button(){
                    guiVars.backgroundBrightness += 0.01
                } label: {
                    Image(systemName: "plus")
                }.disabled((guiVars.backgroundBrightness < 1) ? false : true)
                
                ColorPicker("", selection: $bgColor)
                Spacer()
            }
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
