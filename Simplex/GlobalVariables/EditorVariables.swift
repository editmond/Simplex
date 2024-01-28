//
//  EditorVariables.swift
//  Simplex
//
//  Created by Edmond Cheng on 22/1/2024.
//

import SwiftUI

class EditorVariables: ObservableObject{
//    @Published var hasLoaded = false
    
    //The text within the text editor is stored here
    @Published var fullText: String = "This is some editable text..."
    
    @Published var sourceFilePath: String = "testing.txt"
    
    @Published var shellCommand: String = "python3"
    @Published var shellOptions: String = ""
    
    func copyContents(EditorObj: EditorVariables){
        fullText = EditorObj.fullText
        
        sourceFilePath = EditorObj.sourceFilePath
        
        shellCommand = EditorObj.shellCommand
        shellOptions = EditorObj.shellOptions
    }
    
    init(doLoad: Bool){
        if doLoad{
            let loadedSettings = loadSettings(settingsFile: "Editor_Settings.txt")
            
            print("Editor Settings found: \n\(loadedSettings)")
            
            var temp = loadedSettings["sourceFilePath", default: ["untitled.txt"]]
            sourceFilePath = temp[0]
            
            temp = loadedSettings["shellCommand", default: ["echo"]]
            shellCommand = temp[0]
            
            temp = loadedSettings["shellOptions", default: [""]]
            shellCommand = temp[0]
        }
    }
}
