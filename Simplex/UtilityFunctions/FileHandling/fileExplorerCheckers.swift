//
//  ExtensionChecker.swift
//  Simplex
//
//  Created by Edmond Cheng on 28/6/2024.
//

import Foundation

func dirCheck(Filename: String) -> [Bool]{
    var type: [Bool] = [true, false] //format is: [isDir, isHidden]
    let nameSplit = Filename.components(separatedBy: ".")
    var count = nameSplit.count
    if nameSplit[0] == ""{ //this seperates out hidden files.
        type[1] = true //set the hidden file flag to true.
        count -= 1
    }
    if count > 1 { //a file will normally have an extension, so count would be 2
        type[0] = false
    } else{
        print(Filename + "is a directory")
        type[0] = true
    }
    
    return type //format is: [isDir, isHidden]
}

func execCheck(Filename: String) -> Bool{
    var isExec = false
    let longLs = try? safeShell("ls -l \(Filename)")
    print(longLs!.prefix(1))
    if longLs!.prefix(1) == "-"{ //if it is a file, the output will always begin with "-"
        isExec = true
    } else{
        isExec = false
    }
    return isExec
}

