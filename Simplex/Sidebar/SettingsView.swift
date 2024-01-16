//
//  SettingsView.swift
//  Simplex
//
//  Created by Edmond Cheng on 11/1/2024.
//

import SwiftUI


struct SettingsView: View {

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
            .navigationTitle("Learn")
        }
    }
}

struct GUISettingsView: View {
    @EnvironmentObject var guiVars: GUIVariables
    var body: some View{
        VStack{
            Text("Gui Settings")
        }
        .navigationTitle("GUI")
    }
}

struct RuntimeSettingsView: View {
    var body: some View {
        Text("Runtime Settings")
    }
}

#Preview {
    SettingsView()
}
