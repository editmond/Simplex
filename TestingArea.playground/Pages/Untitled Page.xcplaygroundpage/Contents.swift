import Cocoa

var settingsFile = "GUI_Settings.txt"

 var iconSize: CGFloat = 50

//the background set for colour
 var backgroundHue: Double = 0.5
 var backgroundSaturation: Double = 0.2
 var backgroundBrightness: Double = 0.9

func saveSettings(settingVars: [String:[String]], settingsFile: String){
    var outputString: String = ""
    for (varName,varValues) in settingVars{
        var outputLine = varName + ": "
        for thing in varValues{
            outputLine += thing + ", "
        }
        outputString += outputLine + "\n"
    }
    print(outputString)
}

func writeSettings(){
    //prepare an array for writing
    var formattedSettings: [String:[String]] = [:]
    formattedSettings["iconSize"] = [String(Int(iconSize))]
    
    formattedSettings["backgroundHue"] = [String(backgroundHue)]
    formattedSettings["backgroundSat"] = [String(backgroundSaturation)]
    formattedSettings["backgroundBright"] = [String(backgroundBrightness)]
    
    //write the array into the settings file
    saveSettings(settingVars: formattedSettings, settingsFile: settingsFile)
}

writeSettings()
