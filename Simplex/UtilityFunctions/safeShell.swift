//
//  safeShell.swift
//  Simplex
//
//  Created by Edmond Cheng on 22/1/2024.
//

import Foundation

//Adapted from user3064009 ~~~ https://stackoverflow.com/questions/26971240/how-do-i-run-a-terminal-command-in-a-swift-script-e-g-xcodebuild
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
    let output = (try? String(data: data, encoding: .utf8)) ?? "Something went wrong. Most likely non-UTF8 file names"
    
    return output
}
//~~~
