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
    
    @StateObject var guiObject = GUIVariables(doLoad: true)
    @StateObject var sidebarObject = SidebarVariables(doLoad: true)
    @StateObject var editorObject = EditorVariables(doLoad: true)
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
//                SettingsView()
                NoDeprecateSettingsView()
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
        .keyboardShortcut("o")
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
