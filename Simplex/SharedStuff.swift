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
    @Published var backgroundColour: Color = Color(hue: 0.1639, saturation: 0.5, brightness: 0.95)
    @Published var fullText: String = "This is some editable text..."
}

class SidebarVariables: ObservableObject{
    @Published var UpperSideBarViews: [Any] = [test().self]
    @Published var LowerSideBarActions: [Any] = []
}

class EditorVariables: ObservableObject{
    
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
