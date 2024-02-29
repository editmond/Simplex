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
        fileString = readFromFile(sourceFilePath: "../\(NonUIVariables.appFolder)/Settings_Data/\(settingsFile)")
    } else{
        createFile(filePath: "\(NonUIVariables.appFolder)/Settings_Data/\(settingsFile)")
    }
    let loadedSettings = interpretSettings(fileString: fileString)
    return loadedSettings
}
