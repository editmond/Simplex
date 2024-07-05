//
//  SimplexApp.swift
//  Simplex
//
//  Created by Edmond Cheng on 4/12/2023.
//

import SwiftUI

@main

//This is the topmost level of the app. All views are below it in heirachy.
struct SimplexApp: App {
    @Environment(\.openWindow) var openWindow
//    @Environment(\.scenePhase) private var scenePhase
    
    //Creates the objects that will hold the global variables
    @StateObject var guiObject = GUIVariables(doLoad: true)
    @StateObject var sidebarObject = SidebarVariables(doLoad: true)
    @StateObject var editorObject = EditorVariables(doLoad: true)
    @StateObject var previewerObject = PreviewerVariables(doLoad: true)
    @StateObject var fileExplorerObject = FileExplorerVariables()
    
    //initialisation code
    init(){
        print("Initialising")
        
        //check for the required folders.
        folderCheck(folderName: NonUIVariables.appFolder)
        folderCheck(folderName: "\(NonUIVariables.appFolder)/Settings_Data")
        folderCheck(folderName: "\(NonUIVariables.appFolder)/Build_Scripts")
    }
    
    //the main scene
    var body: some Scene {
        
        //This is the main window where the user will spend most of their time
        WindowGroup(id: "MainWindow"){
            MainView()
                //the following attaches the objects to allow views lower in the hierachy to "see" them
                .environmentObject(guiObject)
                .environmentObject(sidebarObject)
                .environmentObject(editorObject)
                .environmentObject(previewerObject)
                .environmentObject(fileExplorerObject)
        }
        
        //this window contains all the GUI for editing the app settings
        Window("Settings", id: "settings"){
            ZStack{
                Background()
//                SettingsView()
                NoDeprecateSettingsView()
            }
            .environmentObject(guiObject)
            .environmentObject(sidebarObject)
            .environmentObject(editorObject)
            .environmentObject(previewerObject)
            .environmentObject(fileExplorerObject)
        }
        .keyboardShortcut(",") //keyboard shortcut of "cmd"+"," opens the window
        
        //this window will provide a GUI for users to browse files
        Window("Files", id: "files"){
            ZStack{
                Background()
                FileExplorerView()
            }
            .environmentObject(guiObject)
            .environmentObject(editorObject)
            .environmentObject(fileExplorerObject)
        }
        .keyboardShortcut("o")
        
        //this window propvides an interface for browsing documentation
        Window("Documentation", id: "docs"){
            ZStack{
                Background()
                DocumentationView()
            }
            .environmentObject(guiObject)
            .environmentObject(editorObject)
        }
        .keyboardShortcut("d", modifiers: [.command, .shift])
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
