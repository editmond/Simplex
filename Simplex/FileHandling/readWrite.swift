//
//  fileFunctions.swift
//  Simplex
//
//  Created by Edmond Cheng on 23/1/2024.
//

import Foundation

//By Paul Hudson 28/05/2019 from https://www.hackingwithswift.com/example-code/strings/how-to-save-a-string-to-a-file-on-disk-with-writeto
func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}
//~~~


//Writes the text editor string into the specified file
func writeToFile(writeOutText: String, sourceFilePath: String) -> Void{
    let filename = getDocumentsDirectory().appendingPathComponent(sourceFilePath)
    let sanitisedText = sanitiseText(text: writeOutText)
    print(sanitisedText)
    do {
        try sanitisedText.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
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
