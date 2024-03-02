//
//  GUIVariables.swift
//  Simplex
//
//  Created by Edmond Cheng on 9/12/2023.
//

import Foundation
import SwiftUI
class GUIVariables: ObservableObject{
//    @Published var hasLoaded = false
    var settingsFile = "GUI_Settings.txt"
    
    @Published var iconSize: CGFloat = 50
    
    //the background set for colour
    @Published var backgroundHue: Double = 0.5
    @Published var backgroundSaturation: Double = 0.2
    @Published var backgroundBrightness: Double = 0.9
    
    //returns a colour value based on the background set
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
    
    func copyContents(GUIObj: GUIVariables){
        iconSize = GUIObj.iconSize
        
        backgroundHue = GUIObj.backgroundHue
        backgroundSaturation = GUIObj.backgroundSaturation
        backgroundBrightness = GUIObj.backgroundBrightness
    }
    
    func writeSettings(){
        //prepare an array for writing
        var formattedSettings: [String:[String]] = [:]
        formattedSettings["iconSize"] = [String(Int(iconSize))]
        
        formattedSettings["backgroundHue"] = [String(backgroundHue)]
        formattedSettings["backgroundSat"] = [String(backgroundSaturation)]
        formattedSettings["backgroundBright"] = [String(backgroundBrightness)]
        
        //write the array into the settings file
        saveSettings(settingVars: formattedSettings, settingsFile: settingsFile)
    }

    init(doLoad: Bool){
        if doLoad{
            let loadedSettings = loadSettings(settingsFile: settingsFile)
            
            print("GUI Settings found: \n\(loadedSettings)")
            
            //        print("\(loadedSettings["backgroundHue", default: ["0.5"]])")
            var temp = loadedSettings["iconSize", default: ["50"]]
            iconSize = CGFloat(Int(temp[0]) ?? 50)
            
            temp = loadedSettings["backgroundHue", default: ["0.5"]]
            backgroundHue = Double(temp[0]) ?? 0.5
            
            temp = loadedSettings["backgroundSat", default: ["0.2"]]
            backgroundSaturation = Double(temp[0]) ?? 0.2
            
            temp = loadedSettings["backgroundBright", default: ["0.9"]]
            backgroundBrightness = Double(temp[0]) ?? 0.9
        }
    }
    deinit{
//        writeToFile(writeOutText: "bye bye", sourceFilePath: "foo.txt")
    }
   
    //UNUSED Background colour variable
    //@Published var backgroundColour: Color = Color(hue: 240/360, saturation: 0.2, brightness: 0.9)
    
}




