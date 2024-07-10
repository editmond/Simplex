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
    
    //The file that will be overwritten with user text
    @Published var sourceFilePath: String = "testing.txt"
    @Published var buildScriptName: String = "default.sh"
    
    @Published var shellCommand: String = "python3"
    @Published var shellOptions: String = ""
    
    @Published var documentationURL = URL(string:"https://devdocs.io")
    
    //no need to save this "setting"
    @Published var shellOutput: String = ""
    
    func copyContents(EditorObj: EditorVariables){
        sourceFilePath = EditorObj.sourceFilePath
        buildScriptName = EditorObj.buildScriptName
        
        shellCommand = EditorObj.shellCommand
        shellOptions = EditorObj.shellOptions
    }
    
    func writeSettings(){
        //get the file extension of the file to be previewed.
        let readFileArr = sourceFilePath.components(separatedBy: ".")
        documentationURL = URL(string: "https://devdocs.io/#q=" + readFileArr.last!)
        
        //prepare an array for writing
        var formattedSettings: [String:[String]] = [:]
        
        formattedSettings["sourceFilePath"] = [sourceFilePath]
        formattedSettings["buildScriptName"] = [buildScriptName]
        
        formattedSettings["shellCommand"] = [shellCommand]
        formattedSettings["shellOptions"] = [shellOptions]
        
        formattedSettings["documentationURL"] = ["https://devdocs.io/#q=" + readFileArr.last!]

        //write the array into the settings file
        saveSettings(settingVars: formattedSettings, settingsFile: settingsFile)
    }
    func loadFileText(){
        //loads the data from the source file of the previous session.
        fullText = readFromFile(sourceFilePath: sourceFilePath)
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
            
            temp = loadedSettings["documentationURL", default: [""]]
            documentationURL = URL(string: temp[0])

            loadFileText()
            fullText = readFromFile(sourceFilePath: sourceFilePath)
            print("Found in source file: "+fullText)
        }
    }
}
