//
//  loadSettings.swift
//  Simplex
//
//  Created by Edmond Cheng on 25/1/2024.
//

import Foundation

func loadSettings(settingsFile: String) -> [String: [String]]{
    //this has been moved to the app initialisation
//    let homeItems = listDirectory()
//    if !homeItems.contains("Settings_Data"){
//        _ = createMyDir(dirPath: "Settings_Data")
//    }
    let settingsFiles = listDirectory(fromHomePath: NonUIVariables.appFolder+"/Settings_Data")
    var fileString: String = ""
    if settingsFiles.contains(settingsFile){
        fileString = readFromFile(sourceFilePath: "/\(NonUIVariables.appFolder)/Settings_Data/\(settingsFile)")
    } else{
        createFile(filePath: "\(NonUIVariables.appFolder)/Settings_Data/\(settingsFile)")
    }
    let loadedSettings = interpretSettings(fileString: fileString)
    return loadedSettings
}

//loading color parts for the colour picker.
func loadBackgroundHue() -> Double{
    let loadedSettings = loadSettings(settingsFile: "GUI_Settings.txt")
    var tempBackgroundHue: Double
    
    let temp = loadedSettings["backgroundHue", default: ["0.5"]]
    tempBackgroundHue = Double(temp[0]) ?? 0.5
    
    return tempBackgroundHue
}
func loadBackgroundSaturation() -> Double{
    let loadedSettings = loadSettings(settingsFile: "GUI_Settings.txt")
    var tempBackgroundSaturation: Double
    
    let temp = loadedSettings["backgroundSat", default: ["0.2"]]
    tempBackgroundSaturation = Double(temp[0]) ?? 0.2
    
    return tempBackgroundSaturation
}
func loadBackgroundBrightness() -> Double{
    let loadedSettings = loadSettings(settingsFile: "GUI_Settings.txt")
    var tempBackgroundBrightness: Double
    
    let temp = loadedSettings["backgroundBright", default: ["0.9"]]
    tempBackgroundBrightness = Double(temp[0]) ?? 0.9
    
    return tempBackgroundBrightness
}
