//
//  SimplexApp.swift
//  Simplex
//
//  Created by Edmond Cheng on 4/12/2023.
//

import SwiftUI

@main
struct SimplexApp: App {
    @Environment(\.openWindow) var openWindo
//    @Environment(\.scenePhase) private var scenePhase
    
    @StateObject var guiObject = GUIVariables()
    @StateObject var sidebarObject = SidebarVariables()
    @StateObject var editorObject = EditorVariables()
    //initialisation code
    init(){
        print("Initialising")
    }
    
    //the main scene
    var body: some Scene {
        WindowGroup(id: "MainWindow"){
            MainView()
                .environmentObject(guiObject)
                .environmentObject(sidebarObject)
                .environmentObject(editorObject)
        }
        Window("Settings", id: "settings"){
            ZStack{
                Background()
                SettingsView()
            }
            .environmentObject(guiObject)
            .environmentObject(sidebarObject)
            .environmentObject(editorObject)
        }
        .keyboardShortcut(",")
        Window("Files", id: "files"){
            ZStack{
                Background()
                FileExplorerView()
            }
            .environmentObject(guiObject)
            .environmentObject(sidebarObject)
            .environmentObject(editorObject)
        }
    }
}

struct MainView: View {
    init(){
        //?
    }
    var body: some View{
        ZStack{
            //dummyView()
            Background()
            ContentView()
        }
        .accentColor(Color.black)
    }
}
