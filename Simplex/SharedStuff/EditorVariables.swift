//
//  EditorVariables.swift
//  Simplex
//
//  Created by Edmond Cheng on 22/1/2024.
//

import SwiftUI

class EditorVariables: NSObject, ObservableObject{
    @Published var hasLoaded = false
    
    //The text within the text editor is stored here
    @Published var fullText: String = "This is some editable text..."
    
    @Published var sourceFilePath: String = "testing.txt"
    
}
