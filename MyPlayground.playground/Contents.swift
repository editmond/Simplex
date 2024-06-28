import Cocoa

func dirCheck(Filename: String) -> [Bool]{
    var type: [Bool] = [true, false] //format is: [isDir, isHidden]
    var nameSplit = Filename.components(separatedBy: ".")
    return type //format is: [isDir, isHidden]
}

print(".hidden.txt".components(separatedBy: "."))
