//
//  loadSettings.swift
//  Simplex
//
//  Created by Edmond Cheng on 25/1/2024.
//

import Foundation

func loadSettings(settingsFile: String) -> [String: [String]]{
    let homeItems = listDirectory()
    if !homeItems.contains("Settings_Data"){
        _ = createMyDir(dirPath: "Settings_Data")
    }
    let settingsFiles = listDirectory(fromHomePath: "Settings_Data")
    for item in settingsFiles{
        print(item)
    }
    var fileString: String = ""
    if settingsFiles.contains(settingsFile){
        fileString = readFromFile(sourceFilePath: "../Settings_Data/\(settingsFile)")
    } else{
        createFile(filePath: "Settings_Data/\(settingsFile)")
    }
    let loadedSettings = interpretSettings(fileString: fileString)
    return loadedSettings
}
