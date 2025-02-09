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
        ScrollView{
            VStack{
                Text("Current Colour: ")
                    .padding()
                RoundedRectangle(cornerRadius: 10) //displays a preview of the chosen colour.
                    .fill(guiVars.getBackgroundColour(brightnessMultiplier: 1, saturationMultiplier: 1))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 5)
                            .shadow(radius: 10)
                    )
                    .frame(width: .infinity, height: 50)
                    .padding()
                HStack{
                    Text("Colour Picker: ")
                    ColorPicker("", selection: $bgColor)
                    Spacer()
                }
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
                
                Divider()
                
                Image(systemName: "play.circle")
                    .font(.system(size: guiVars.iconSize))
                    .foregroundStyle(.tint)
                
                // The slider for changing the sidebar icon sizes.
                HStack{
                    Text("Sidebar Icon Size: ")
                        .padding()
                        .bold()
                    
                    Button(){
                        guiVars.iconSize -= 5
                    } label: {
                        Image(systemName: "minus")
                    }.disabled((guiVars.iconSize > 10) ? false : true)
                    
                    Slider(value: $guiVars.iconSize, in: 10...100) // a slider to adjust icon size
                    
                    Button(){
                        guiVars.iconSize += 5
                    } label: {
                        Image(systemName: "plus")
                    }.disabled((guiVars.iconSize < 100) ? false : true)
                    Spacer()
                }
                Spacer()
            }
            .navigationTitle("Settings - GUI")
        }
    }
}

#Preview {
    GUISettingsView()
}
