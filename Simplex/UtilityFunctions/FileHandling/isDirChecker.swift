//
//  ExtensionChecker.swift
//  Simplex
//
//  Created by Edmond Cheng on 28/6/2024.
//

import Foundation

func dirCheck(Filename: String) -> [Bool]{
    var type: [Bool] = [true, false] //format is: [isDir, isHidden]
    var nameSplit = Filename.components(separatedBy: ".")
    var count = nameSplit.count
    if nameSplit[0] == ""{
        type[1] = true
        count -= 1
    }
    if count > 1 {
        type[0] = false
    } else{
        type[0] = true
    }
    
    return type //format is: [isDir, isHidden]
}
