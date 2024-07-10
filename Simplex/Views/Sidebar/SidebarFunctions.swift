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
        
//        //CHANGE LATER - runs python3 in the source file
//        let shellResult = try? safeShell("\(shellCommand) Documents/\(sourceFilePath)")
//        print("\(shellCommand) response:\n\(shellResult ?? "")")
        var output = try? safeShell("~/\(NonUIVariables.appFolder)/Build_Scripts/\(buildScriptName) \(NSHomeDirectory()+"/"+sourceFilePath)")
        return ["", "\(output ?? "")"]
    case 1:
        return ["files", ""] // return the files window id
        
    default:
        try? safeShell("say \(actionNum)") // CHANGE LATER - a stub
        
    }
    return ["", ""] //return nothing if no window id requried
}

//return of string is used for id in openWindow(id: id)
func LowerSidebarActor(actionNum: Int) async -> String{
    switch actionNum{
    case 0:
        try? safeShell("say \(actionNum)") // CHANGE LATER - a stub
        
    case 1: //page icon
        return "docs" //the window id for documentation window
        
    case 2: //Gear icon
//        SimplexApp.openThisWindow(id: "settings")
        return "settings" //the window id for settings
        
    default:
        try? safeShell("say \(actionNum)") // CHANGE LATER - a stub
    }
    return "" //return nothing if no window id is required
}


