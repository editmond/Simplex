//
//  SimplexApp.swift
//  Simplex
//
//  Created by Edmond Cheng on 4/12/2023.
//

import SwiftUI

@main
struct SimplexApp: App {
    var body: some Scene {
        WindowGroup(id: "MainWindow"){
            ZStack{
                Background()
                    .environmentObject(GUIVariables())
                    .environmentObject(FunctionalVariables())
                ContentView()
                    .environmentObject(GUIVariables())
                    .environmentObject(FunctionalVariables())
            }
            .accentColor(Color.black)
        }
    }
}
