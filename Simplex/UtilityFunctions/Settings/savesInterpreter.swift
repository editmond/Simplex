//
//  savesInterpreter.swift
//  Simplex
//
//  Created by Edmond Cheng on 25/1/2024.
//

import Foundation

/*The expected format in settings files is
variableName : value,value,value
 
The output should be
[variableName: [value, value, value]]
*/

func interpretSettings(fileString: String) -> [String: [String]]{ //the formatting of settings found is a dictionary with a string key that matches to an array value.
    
    //preparing a dictionary that is the right format
    var settingsDict: [String: [String]] = [:]
    
    // separate the lines of the file
    let lines = fileString.split(separator: "\n")
    
    for line in lines{
        //remove unwanted empty space
        let str: String = String(line.filter { !" \n\t\r".contains($0) })
        
        //splits into ["variable", "value,value,value"]
        let sepVar = str.split(separator: ":")
        //splits the second element of sepVar, which is all the values into another array, [value, value, value]
        let sepValues = sepVar[1].split(separator: ",")
        
        //passing through the sepValues to make sure they are strings
        var arrayedValues: [String] = []
        for value in sepValues{
            arrayedValues.append(String(value))
        }
        
        //just in case there is no setting found
        if arrayedValues.isEmpty{
            arrayedValues.append("")
        }
//        print ("Found: \(arrayedValues)")
        
        //adding to the dictionary the correctly formatted settings data
        settingsDict[String(sepVar[0])] = arrayedValues
    }
    
    return settingsDict
}
