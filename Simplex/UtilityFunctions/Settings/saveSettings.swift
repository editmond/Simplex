//
//  writeSettings.swift
//  Simplex
//
//  Created by Edmond Cheng on 28/1/2024.
//

import Foundation

func saveSettings(settingVars: [String:[String]], settingsFile: String){
    var outputString: String = ""
    for (varName,varValues) in settingVars{
        var outputLine = varName + ": "
        for thing in varValues{
            outputLine += thing + ", "
        }
        outputString += outputLine + "\n"
    }
//    print(outputString)
    writeToFile(writeOutText: outputString, sourceFilePath: "/\(NonUIVariables.appFolder)/Settings_Data/\(settingsFile)", noSanitise: true)
}
