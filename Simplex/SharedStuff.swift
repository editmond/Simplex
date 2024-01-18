//
//  GUIVariables.swift
//  Simplex
//
//  Created by Edmond Cheng on 9/12/2023.
//

import Foundation
import SwiftUI
class GUIVariables: ObservableObject{
    @Published var iconSize: CGFloat = 50
    
    
    @Published var backgroundHue: Double = 0
    @Published var backgroundSaturation: Double = 0.2
    @Published var backgroundBrightness: Double = 0.9
    //function overloading
    
    func getBackgroundColour(brightnessMultiplier: Double, saturationMultiplier: Double) -> Color{
        
        var usedBackgroundHue = backgroundHue
        var usedBackgroundSat = backgroundSaturation*saturationMultiplier
        var usedBackgroundBright = backgroundBrightness*brightnessMultiplier
       
        //to allow for rotating around hues without going over the bound of 0 to 1
        while (usedBackgroundHue > 1){
            usedBackgroundHue -= 1
        }
        while (usedBackgroundHue < 0){
            usedBackgroundHue += 1
        }
        
        //to limit the brightness to domain 0 to 1
        if (usedBackgroundBright > 1){
            usedBackgroundBright = 1
        }
        if (usedBackgroundBright < 0){
            usedBackgroundBright = 0
        }
        //to limit the saturation to domain 0 to 1
        if (usedBackgroundSat > 1){
            usedBackgroundSat = 1
        }
        if (usedBackgroundSat < 0){
            usedBackgroundSat = 0
        }
        
        return Color(hue: usedBackgroundHue, saturation: usedBackgroundSat, brightness: usedBackgroundBright)
    }
   
    //UNUSED Background colour variable
    //@Published var backgroundColour: Color = Color(hue: 240/360, saturation: 0.2, brightness: 0.9)
    
}

class SidebarVariables: ObservableObject{
    //The icons in the top half of the sidebar. Only use system icons (for now)
    @Published var UpperSideBarIcons: [String] = ["play.circle", "folder"]
    
    //The icons in the bottom half of the sidebar. Only use system icons (for now)
    @Published var LowerSidebarIcons: [String] = ["music.note", "doc.text", "gearshape"]
}

class EditorVariables: NSObject, ObservableObject{
    //The text within the text editor is stored here
    @Published var fullText: String = "This is some editable text..."
    
    @Published var sourceFilePath: String = "testing.txt"
    
}

//From user3064009 ~~~ https://stackoverflow.com/questions/26971240/how-do-i-run-a-terminal-command-in-a-swift-script-e-g-xcodebuild
@discardableResult // Add to suppress warnings when you don't want/need a result
func safeShell(_ command: String) throws -> String {
    let task = Process()
    let pipe = Pipe()
    
    task.standardOutput = pipe
    task.standardError = pipe
    task.arguments = ["-c", command]
    task.executableURL = URL(fileURLWithPath: "/bin/zsh") //<--updated
    task.standardInput = nil

    try task.run() //<--updated
    
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: .utf8)!
    
    return output
}
//~~~
