//
//  PreviewerVariables.swift
//  Simplex
//
//  Created by Edmond Cheng on 11/3/2024.
//

import Foundation

class PreviewerVariables: ObservableObject{
//    @Published var hasLoaded = false
    var settingsFile = "Previewer_Settings.txt"
    
    @Published var previewReadFile: String = "output.txt"
    
    //no need to save
    @Published var previewText: String = ""
    
    //the UUID for the preview view, this will be changed frequently to force update the view.
    @Published var previewID = UUID()
    
    //The format of the preview file. 0: no display 1: Text, 2: Image,
    @Published var previewType = 0
    
    //Supported file formats
    @Published var imageFormats: [String] = ["ppm", "jpeg"]
    @Published var textFormats: [String] = ["txt"]
    
    func copyContents(PreviewerObj: PreviewerVariables){
        previewReadFile = PreviewerObj.previewReadFile
    }
    
    func writeSettings(){
        //get the extension
        let readFileArr = previewReadFile.components(separatedBy: ".")
        print(readFileArr.last)
        print("asdfjlj")
        if textFormats.contains(readFileArr.last ?? "") {
            previewType = 1
        } else if imageFormats.contains(readFileArr.last ?? "") {
            previewType = 2
        } else{
            previewType = 0
        }

        //prepare an array for writing
        var formattedSettings: [String:[String]] = [:]
        
        formattedSettings["previewReadFile"] = [previewReadFile]
        
        formattedSettings["previewType"] = [String(previewType)]
        
        formattedSettings["imageFormats"] = imageFormats
        formattedSettings["textFormats"] = textFormats
        
        //write the array into the settings file
        saveSettings(settingVars: formattedSettings, settingsFile: settingsFile)
    }
    
    init(doLoad: Bool){
        if doLoad{
            let loadedSettings = loadSettings(settingsFile: settingsFile)
            
            print("Previewer Settings found: \n\(loadedSettings)")
            
            var temp = loadedSettings["previewReadFile", default: [""]]
            previewReadFile = temp[0]
            
            temp = loadedSettings["previewType", default: ["0"]]
            previewType = Int(temp[0]) ?? 0
            
            temp = loadedSettings["imageFormats", default: ["ppm", "jpeg"]]
            imageFormats = temp
            
            temp = loadedSettings["textFormats", default: ["txt"]]
            textFormats = temp

        }
    }
}
