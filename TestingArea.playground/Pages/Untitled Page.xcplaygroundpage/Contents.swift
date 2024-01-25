import Cocoa

func interpretSettings(fileString: String) -> [String: [String]]{
    var settingsDict: [String: [String]] = [:]
    let lines = fileString.split(separator: "\n")
    for line in lines{
        var str: String = String(line.filter { !" \n\t\r".contains($0) })
        var sepVar = str.split(separator: ":")
        var sepValues = sepVar[1].split(separator: ",")
        var arrayedValues: [String] = []
        for value in sepValues{
            arrayedValues.append(String(value))
        }
        print(sepVar)
        print (arrayedValues)
        settingsDict[String(sepVar[0])] = arrayedValues
    }
    return settingsDict
}

let testString = "backgroundHue: 0.5\nbackgroundSat: 0.2,0.5\nbackgroundBright: 0.5\n"

print(interpretSettings(fileString: testString))
