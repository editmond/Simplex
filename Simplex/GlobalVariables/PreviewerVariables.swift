//
//  PreviewerVariables.swift
//  Simplex
//
//  Created by Edmond Cheng on 11/3/2024.
//

import Foundation

class PreviewerVariables: ObservableObject{
    
    //WRITTEN TO SETTINGS FILE
//    @Published var hasLoaded = false
    var settingsFile = "Previewer_Settings.txt"
    
    @Published var previewReadFile: String = "output.txt"
    
    //the UUID for the preview view, this will be changed frequently to force update the view.
    @Published var previewID = UUID()
    
    //The format of the preview file. 0: no display 1: Text, 2: Image,
    @Published var previewType = 0
    
    //Supported file formats
    @Published var imageFormats: [String] = ["ppm", "jpeg"]
    @Published var textFormats: [String] = ["txt"]
    
    //NOT WRITTEN TO SETTINGS FILE
    //the text in a file that is to be previewed
    @Published var previewText: String = ""

    
    func copyContents(PreviewerObj: PreviewerVariables){
        previewReadFile = PreviewerObj.previewReadFile
    }
    
    func writeSettings(){
        
        //get the file extension of the file to be previewed.
        let readFileArr = previewReadFile.components(separatedBy: ".")
        print(readFileArr.last)
        previewText = ""
        
        if textFormats.contains(readFileArr.last ?? "") {
            //found text extension
            previewType = 1
            
        } else if imageFormats.contains(readFileArr.last ?? "") {
            //found image extension
            previewType = 2
        } else{
            //unknown format
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
