//
//  savesInterpreter.swift
//  Simplex
//
//  Created by Edmond Cheng on 25/1/2024.
//

import Foundation

func interpretSettings(fileString: String) -> [String: [String]]{
    var settingsDict: [String: [String]] = [:]
    let lines = fileString.split(separator: "\n")
    for line in lines{
        let str: String = String(line.filter { !" \n\t\r".contains($0) })
        let sepVar = str.split(separator: ":")
        let sepValues = sepVar[1].split(separator: ",")
        var arrayedValues: [String] = []
        for value in sepValues{
            arrayedValues.append(String(value))
        }
        if arrayedValues.isEmpty{
            arrayedValues.append("")
        }
//        print ("Found: \(arrayedValues)")
        settingsDict[String(sepVar[0])] = arrayedValues
    }
    return settingsDict
}
