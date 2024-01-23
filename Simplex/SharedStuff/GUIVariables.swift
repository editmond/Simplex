//
//  GUIVariables.swift
//  Simplex
//
//  Created by Edmond Cheng on 9/12/2023.
//

import Foundation
import SwiftUI
class GUIVariables: ObservableObject{
    @Published var hasLoaded = false
    
    @Published var iconSize: CGFloat = 50
    
    
    @Published var backgroundHue: Double = 0
    @Published var backgroundSaturation: Double = 0.2
    @Published var backgroundBrightness: Double = 0.9
    //function overloading
    
    func getBackgroundColour(brightnessMultiplier: Double, saturationMultiplier: Double) -> Color{
        
        var usedBackgroundHue = backgroundHue
        var usedBackgroundSat = backgroundSaturation*saturationMultiplier
        var usedBackgroundBright = backgroundBrightness*brightnessMultiplier
       
        //to allow for rotating around hues without going over the bound of 0 to 1
        while (usedBackgroundHue > 1){
            usedBackgroundHue -= 1
        }
        while (usedBackgroundHue < 0){
            usedBackgroundHue += 1
        }
        
        //to limit the brightness to domain 0 to 1
        if (usedBackgroundBright > 1){
            usedBackgroundBright = 1
        }
        if (usedBackgroundBright < 0){
            usedBackgroundBright = 0
        }
        //to limit the saturation to domain 0 to 1
        if (usedBackgroundSat > 1){
            usedBackgroundSat = 1
        }
        if (usedBackgroundSat < 0){
            usedBackgroundSat = 0
        }
        
        return Color(hue: usedBackgroundHue, saturation: usedBackgroundSat, brightness: usedBackgroundBright)
    }
    init(){
        backgroundHue = 0.5
    }
    
    deinit{
        writeToFile(writeOutText: "bye bye", sourceFilePath: "foo.txt")
    }
   
    //UNUSED Background colour variable
    //@Published var backgroundColour: Color = Color(hue: 240/360, saturation: 0.2, brightness: 0.9)
    
}




