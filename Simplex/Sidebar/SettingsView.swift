//
//  SettingsView.swift
//  Simplex
//
//  Created by Edmond Cheng on 11/1/2024.
//

import SwiftUI


struct SettingsView: View {

    @EnvironmentObject var guiVars: GUIVariables
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: GUISettingsView()) {
                    Label("GUI", systemImage: "paintbrush.pointed")
                }
                NavigationLink(destination: RuntimeSettingsView()) {
                    Label("Runtime", systemImage: "hammer")
                }
            }
            .foregroundStyle(guiVars.getBackgroundColour(brightnessMultiplier: 0.9))
            .navigationTitle("Settings")
        }
    }
}

struct GUISettingsView: View {
    @EnvironmentObject var guiVars: GUIVariables
    var body: some View{
        VStack{
            Text("Gui Settings")
        }
        .navigationTitle("Settings - GUI")
    }
}

struct RuntimeSettingsView: View {
    var body: some View {
        VStack{
            Text("Runtime Settings")
        }
        .navigationTitle("Settings - Runtime")
    }
}

#Preview {
    SettingsView()
}
