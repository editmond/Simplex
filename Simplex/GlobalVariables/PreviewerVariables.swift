//
//  PreviewerVariables.swift
//  Simplex
//
//  Created by Edmond Cheng on 11/3/2024.
//

import Foundation

class PreviewerVariables: ObservableObject{
//    @Published var hasLoaded = false
    var settingsFile = "Previewer_Settings.txt"
    
    @Published var previewReadFile: String = "output.txt"
    
    //no need to save
    @Published var previewText: String = ""
    
    //preview file check
    @Published var previewCheck: Bool = true
    
    func copyContents(PreviewerObj: PreviewerVariables){
        previewReadFile = PreviewerObj.previewReadFile
    }
    
    func writeSettings(){
        //prepare an array for writing
        var formattedSettings: [String:[String]] = [:]
        
        formattedSettings["previewReadFile"] = [previewReadFile]
        
        //write the array into the settings file
        saveSettings(settingVars: formattedSettings, settingsFile: settingsFile)
    }
    
    init(doLoad: Bool){
        if doLoad{
            let loadedSettings = loadSettings(settingsFile: settingsFile)
            
            print("Previewer Settings found: \n\(loadedSettings)")
            
            var temp = loadedSettings["previewReadFile", default: [""]]
            previewReadFile = temp[0]
        }
    }
}
