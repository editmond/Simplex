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
        NavigationView{
            ZStack{
                guiVars.getBackgroundColour(brightnessMultiplier: 1, saturationMultiplier: 0.5)
                VStack{
                    Spacer()
                    List {
                        NavigationLink(destination: GeneralSettingsView()) {
                            Label("General", systemImage: "gear")
                        }
                        NavigationLink(destination: GUISettingsView()) {
                            Label("GUI", systemImage: "paintbrush.pointed")
                        }
                        NavigationLink(destination: RuntimeSettingsView()) {
                            Label("Runtime", systemImage: "hammer")
                        }
                    }
                    .navigationTitle("Settings")
                }
            }
        }
    }
}

struct NoDeprecateSettingsView: View{
    
    @EnvironmentObject var guiVars: GUIVariables
    var body: some View{
        NavigationSplitView{
            List {
                NavigationLink(destination: GeneralSettingsView()) {
                    Label("General", systemImage: "gear")
                }
                NavigationLink(destination: GUISettingsView()) {
                    Label("GUI", systemImage: "paintbrush.pointed")
                }
                NavigationLink(destination: RuntimeSettingsView()) {
                    Label("Runtime", systemImage: "hammer")
                }
            }
            .navigationTitle("Settings")
        } detail: {
            GeneralSettingsView()
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

struct GeneralSettingsView: View{
    @EnvironmentObject var editorVars: EditorVariables
    var body: some View{
        Grid{
            //the rest could be programmatically generated based on the required input
            GridRow{
                Text("Source File Path:")
                    .padding()
                TextField("Source File Path", text: $editorVars.sourceFilePath)
                    .disableAutocorrection(true)
                    .padding()
            }
        }
        .navigationTitle("Settings")
        .textFieldStyle(.roundedBorder)
    }
}

#Preview {
    SettingsView()
}
