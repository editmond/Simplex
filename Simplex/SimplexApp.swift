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
            MainView()
                .environmentObject(GUIVariables())
                .environmentObject(SidebarVariables())
                .environmentObject(EditorVariables())
        }
        Window("Settings", id: "settings"){
            SettingsView()
        }
    }
}

struct MainView: View {
    init(){
        //load things that need to access environment objects here
        print("Initialised Main View!")
    }
    var body: some View{
        ZStack{
            Background()
            ContentView()
        }
        .accentColor(Color.black)
    }
}
