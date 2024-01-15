//
//  SimplexApp.swift
//  Simplex
//
//  Created by Edmond Cheng on 4/12/2023.
//

import SwiftUI

@main
struct SimplexApp: App {
    @Environment(\.openWindow) var openWindow
    //initialisation code
    init(){
        print("Initialising")
        
    }
    
    //the main scene
    var body: some Scene {
        WindowGroup(id: "MainWindow"){
            ZStack{
                Background()
                    .environmentObject(GUIVariables())
                    .environmentObject(SidebarVariables())
                    .environmentObject(EditorVariables())
                ContentView()
                    .environmentObject(GUIVariables())
                    .environmentObject(SidebarVariables())
                    .environmentObject(EditorVariables())
            }
            .accentColor(Color.black)
        }
        Window("Settings", id: "settings"){
            SettingsView()
        }
    }
    func openThisWindow(windowId: String) -> Void{
        openWindow(id: windowId)
    }
}
