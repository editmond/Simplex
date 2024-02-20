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
    
    @Published var buildScriptName: String = "default"
    
    @Published var shellCommand: String = "python3"
    @Published var shellOptions: String = ""
    
    func copyContents(EditorObj: EditorVariables){
        sourceFilePath = EditorObj.sourceFilePath
        
        shellCommand = EditorObj.shellCommand
        shellOptions = EditorObj.shellOptions
    }
    
    func writeSettings(){
        //prepare an array for writing
        var formattedSettings: [String:[String]] = [:]
        
        formattedSettings["sourceFilePath"] = [sourceFilePath]
        
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
            
            temp = loadedSettings["shellCommand", default: ["echo"]]
            shellCommand = temp[0]
            
            temp = loadedSettings["shellOptions", default: [""]]
            shellOptions = temp[0]
        }
    }
}
