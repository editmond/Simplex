//
//  GUIVariables.swift
//  Simplex
//
//  Created by Edmond Cheng on 9/12/2023.
//

import Foundation
import SwiftUI

//The object that stores GUI related variables that views may need to access.
class GUIVariables: ObservableObject{
//    @Published var hasLoaded = false
    var settingsFile = "GUI_Settings.txt"
    
    @Published var iconSize: CGFloat = 50
    
    
    @State var bgColor = Color(hue: 0.0, saturation: 0.2, brightness: 0.9)
    //the background set for colour
    @Published var backgroundHue: Double = 0.5
    @Published var backgroundSaturation: Double = 0.2
    @Published var backgroundBrightness: Double = 0.9
    
    //returns a colour value based on the background colour set
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
    
    func setBackgroundColor(backgroundColour: Color){
        //turn the Color type into NSColor so that we can grab the components
        let BackgroundNSColour = NSColor(backgroundColour)
        
        //applying the separate components into the appropriate variables
        backgroundHue = BackgroundNSColour.hueComponent
        backgroundBrightness = BackgroundNSColour.brightnessComponent
        backgroundSaturation = BackgroundNSColour.saturationComponent
        
    }
    
    func loadBackgroundColour(settingsFile: String) -> Color{
        let loadedSettings = loadSettings(settingsFile: settingsFile)
        var tempBackgroundHue: Double
        var tempBackgroundBrightness: Double
        var tempBackgroundSaturation: Double
        
        var temp = loadedSettings["backgroundHue", default: ["0.5"]]
        tempBackgroundHue = Double(temp[0]) ?? 0.5
        
        temp = loadedSettings["backgroundSat", default: ["0.2"]]
        tempBackgroundSaturation = Double(temp[0]) ?? 0.2
        
        temp = loadedSettings["backgroundBright", default: ["0.9"]]
        tempBackgroundBrightness = Double(temp[0]) ?? 0.9
        
        return Color(hue: tempBackgroundHue, saturation: tempBackgroundSaturation, brightness: tempBackgroundBrightness)
    }
    
    //copies the contents of another GUIVariables object into the current object.
    func copyContents(GUIObj: GUIVariables){
        iconSize = GUIObj.iconSize
        
        backgroundHue = GUIObj.backgroundHue
        backgroundSaturation = GUIObj.backgroundSaturation
        backgroundBrightness = GUIObj.backgroundBrightness
    }
    
    //writes the settings of the object into the settings file.
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
    
    //an alternate initialisation where settings a loaded from a file. This is neccessary as the settings work by also having default objects which should not load settings from a file.
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
            
            bgColor = Color(hue: backgroundHue, saturation: backgroundSaturation, brightness: backgroundBrightness)

        }
    }
    
    //just testing. It is the deinit function of the object, which gets called when the object is destroyed.
    deinit{
//        writeToFile(writeOutText: "bye bye", sourceFilePath: "foo.txt")
    }
   
    //UNUSED Background colour variable
    //@Published var backgroundColour: Color = Color(hue: 240/360, saturation: 0.2, brightness: 0.9)
    
}




