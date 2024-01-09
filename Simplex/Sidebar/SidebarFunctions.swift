//
//  SidebarFunctions.swift
//  Simplex
//
//  Created by Edmond Cheng on 8/1/2024.
//

import Foundation

//This is the function that chooses which actions correpsond to which icon
func UpperSidebarActor(actionNum: Int) -> Void{
    switch actionNum{
    case 0: //Play icon
        writeToFile()
    default:
        try? safeShell("say \(actionNum)")
    }
}

func LowerSidebarActor(actionNum: Int) -> Void{
    switch actionNum{
    case 0:
        try? safeShell("say \(actionNum)")
    default:
        try? safeShell("say \(actionNum)")
    }
}

//By Paul Hudson 28/05/2019 from https://www.hackingwithswift.com/example-code/strings/how-to-save-a-string-to-a-file-on-disk-with-writeto
func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

//Writes the text editor string into the specified file
func writeToFile() -> Void{
    var editorVars = EditorVariables()
    var filename = getDocumentsDirectory().appendingPathComponent(editorVars.sourceFilePath)
    print(editorVars.fullText)
    do {
        try editorVars.fullText.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
    } catch {
        print("\(error)")
    }
    print("Write Completed")
}
