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

//By Paul Hudson 28/05/2019 from https://www.hackingwithswift.com/example-code/strings/how-to-save-a-string-to-a-file-on-disk-with-writeto
func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}
//~~~

//Writes the text editor string into the specified file
func writeToFile(writeOutText: String, sourceFilePath: String) -> Void{
    let filename = getDocumentsDirectory().appendingPathComponent(sourceFilePath)
    print(writeOutText)
    do {
        try writeOutText.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
    } catch {
        print("\(error)")
    }
    print("Write Completed")
}

//Writes the text editor string into the specified file
func readFromFile(sourceFilePath: String) -> String{
    let filename = getDocumentsDirectory().appendingPathComponent(sourceFilePath)
    var text = ""
    do {
        text = try String(contentsOf: filename, encoding: .utf8)
    } catch {
        print("\(error)")
    }
    return text
}
