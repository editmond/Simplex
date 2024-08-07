//
//  SidebarVariables.swift
//  Simplex
//
//  Created by Edmond Cheng on 22/1/2024.
//

import SwiftUI

//Contains the variables for the sidebar.
class SidebarVariables: ObservableObject{
    var settingsFile = "Sidebar_Settings.txt"
    
    //The icons in the top half of the sidebar. Only use system icons (for now)
    @Published var UpperSideBarIcons: [String] = ["play.circle", "folder", "square.and.arrow.down"]
    @Published var UpperShortcuts: [String] = ["r", "o", "s"]
    @Published var UpperTooltip: [String] = ["Run", "Open Source File", "Save"]

    //The icons in the bottom half of the sidebar. Only use system icons (for now)
    @Published var LowerSidebarIcons: [String] = ["music.note", "doc.text", "gearshape"]
    @Published var LowerShortcuts: [String] = ["m", ")", ","]
    @Published var LowerTooltip: [String] = ["Music Player", "Documentation", "Settings"]

    //this copies data from an object of the same class.
    func copyContents(SideObj: SidebarVariables){
        UpperSideBarIcons = SideObj.UpperSideBarIcons
        
        LowerSidebarIcons = SideObj.LowerSidebarIcons
    }
    
    //writes the variables into a file in the correct format.
    func writeSettings(){
        //prepare an array for writing
        var formattedSettings: [String:[String]] = [:]
        
        formattedSettings["UpperSideBarIcons"] = UpperSideBarIcons
        
        formattedSettings["LowerSidebarIcons"] = LowerSidebarIcons
        
        //write the array into the settings file
        saveSettings(settingVars: formattedSettings, settingsFile: settingsFile)
    }
    
    //an alternate load.
    init(doLoad: Bool){
        if doLoad{
            let loadedSettings = loadSettings(settingsFile: settingsFile)
            
            print("Sidebar Settings found: \n\(loadedSettings)")
            var temp = loadedSettings["UpperSideBarIcons", default: ["play.circle", "folder", "square.and.arrow.down"]]
            UpperSideBarIcons = temp
            
            temp = loadedSettings["LowerSidebarIcons", default: ["music.note", "doc.text", "gearshape"]]
            LowerSidebarIcons = temp
        }
    }
}
