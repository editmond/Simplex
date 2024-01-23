//
//  SidebarFunctions.swift
//  Simplex
//
//  Created by Edmond Cheng on 8/1/2024.
//

import Foundation

//This is the function that chooses which actions correpsond to which icon
func UpperSidebarActor(actionNum: Int, writeOutText: String, sourceFilePath: String) -> String{
    switch actionNum{
    case 0: //Play icon
        writeToFile(writeOutText: writeOutText, sourceFilePath: sourceFilePath)
        let shellResult = try? safeShell("python3 Documents/\(sourceFilePath)")
        print("\(shellResult ?? "")")
    case 1:
        return "files"
    default:
        try? safeShell("say \(actionNum)")
    }
    return ""
}

//return of string is used for id in openWindow(id: id)
func LowerSidebarActor(actionNum: Int) -> String{
    switch actionNum{
    case 0:
        try? safeShell("say \(actionNum)")
    case 1:
        print("a")
    case 2: //Gear icon
//        SimplexApp.openThisWindow(id: "settings")
        return "settings" //the window id for settings
    default:
        try? safeShell("say \(actionNum)")
    }
    return ""
}


