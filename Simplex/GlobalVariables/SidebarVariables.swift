//
//  SidebarVariables.swift
//  Simplex
//
//  Created by Edmond Cheng on 22/1/2024.
//

import SwiftUI

class SidebarVariables: ObservableObject{
//    @Published var hasLoaded = false
    
    //The icons in the top half of the sidebar. Only use system icons (for now)
    @Published var UpperSideBarIcons: [String] = ["play.circle", "folder"]
    
    //The icons in the bottom half of the sidebar. Only use system icons (for now)
    @Published var LowerSidebarIcons: [String] = ["music.note", "doc.text", "gearshape"]
    
    init(doLoad: Bool){
        if doLoad{
            let loadedSettings = loadSettings(settingsFile: "Sidebar_Settings.txt")
            
            print("Sidebar Settings found: \n\(loadedSettings)")
            var temp = loadedSettings["UpperSideBarIcons", default: ["play.circle", "folder"]]
            UpperSideBarIcons = temp
            
            temp = loadedSettings["LowerSidebarIcons", default: ["music.note", "doc.text", "gearshape"]]
        }
    }
}
