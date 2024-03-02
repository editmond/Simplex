//
//  EditorVariables.swift
//  Simplex
//
//  Created by Edmond Cheng on 22/1/2024.
//

import SwiftUI

class EditorVariables: ObservableObject{
//    @Published var hasLoaded = false
    var settingsFile = "Editor_Settings.txt"
    
    //The text within the text editor is stored here
    @Published var fullText: String = "\nThis is some editable text..."
    
    @Published var sourceFilePath: String = "testing.txt"
    
    @Published var buildScriptName: String = "default.sh"
    
    @Published var shellCommand: String = "python3"
    @Published var shellOptions: String = ""
    
    //no need to save
    @Published var previewText: String = ""
    
    func copyContents(EditorObj: EditorVariables){
        sourceFilePath = EditorObj.sourceFilePath
        buildScriptName = EditorObj.buildScriptName
        
        shellCommand = EditorObj.shellCommand
        shellOptions = EditorObj.shellOptions
    }
    
    func writeSettings(){
        //prepare an array for writing
        var formattedSettings: [String:[String]] = [:]
        
        formattedSettings["sourceFilePath"] = [sourceFilePath]
        formattedSettings["buildScriptName"] = [buildScriptName]
        
        formattedSettings["shellCommand"] = [shellCommand]
        formattedSettings["shellOptions"] = [shellOptions]
        
        
        //write the array into the settings file
        saveSettings(settingVars: formattedSettings, settingsFile: settingsFile)
    }
    
    init(doLoad: Bool){
        if doLoad{
            let loadedSettings = loadSettings(settingsFile: settingsFile)
            
            print("Editor Settings found: \n\(loadedSettings)")
            
            var temp = loadedSettings["sourceFilePath", default: ["untitled.txt"]]
            sourceFilePath = temp[0]
            
            temp = loadedSettings["buildScriptName", default: ["defualt.sh"]]
            buildScriptName = temp[0]
            
            temp = loadedSettings["shellCommand", default: ["echo"]]
            shellCommand = temp[0]
            
            temp = loadedSettings["shellOptions", default: [""]]
            shellOptions = temp[0]
            
            fullText = readFromFile(sourceFilePath: sourceFilePath)
        }
    }
}
