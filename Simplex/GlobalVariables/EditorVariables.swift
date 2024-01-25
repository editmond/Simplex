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
    
    init(){
        let loadedSettings = loadSettings(settingsFile: "Editor_Settings.txt")
        
        print("Editor Settings found: \n\(loadedSettings)")
    }
}
