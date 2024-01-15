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
   
    //Background colour variable
    @Published var backgroundColour: Color = Color(hue: 240/360, saturation: 0.2, brightness: 0.9)
    
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
    
    @Published var sourceFilePath: String = "yes.txt"
    
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
