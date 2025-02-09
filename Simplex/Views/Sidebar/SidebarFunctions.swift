//
//  SidebarFunctions.swift
//  Simplex
//
//  Created by Edmond Cheng on 8/1/2024.
//

import Foundation

//This is the function that chooses which actions correpsond to which icon
func UpperSidebarActor(actionNum: Int, writeOutText: String, sourceFilePath: String, shellCommand: String, shellOptions: String, buildScriptName: String) async -> [String]{
    switch actionNum{
    case 0: //Play icon
        
        writeToFile(writeOutText: writeOutText, sourceFilePath: sourceFilePath)
        
        let output = try? safeShell("~/\(NonUIVariables.appFolder)/Build_Scripts/\(buildScriptName) \(NSHomeDirectory()+"/"+sourceFilePath)")
//        let output = try? safeShell("\(NSHomeDirectory())/\(buildScriptName) \(NSHomeDirectory()+"/"+sourceFilePath)")
        return ["", "\(output ?? "")"]
    case 1:
        return ["files", ""] // return the files window id
    case 2:
        writeToFile(writeOutText: writeOutText, sourceFilePath: sourceFilePath)
        return ["", ""]
    default:
        print("Unknown Button Pressed")
    }
    return ["", ""] //return nothing if no window id requried
}

//return of string is used for id in openWindow(id: id)
func LowerSidebarActor(actionNum: Int) async -> String{
    switch actionNum{
    case 0:
        return "music"
        
    case 1: //page icon
        return "docs" //the window id for documentation window
        
    case 2: //Gear icon
//        SimplexApp.openThisWindow(id: "settings")
        return "settings" //the window id for settings
        
    default:
        print("Unknown Button Pressed")
    }
    return "" //return nothing if no window id is required
}


