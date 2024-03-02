//
//  RuntimeSettingsView.swift
//  Simplex
//
//  Created by Edmond Cheng on 28/1/2024.
//

import SwiftUI

struct RuntimeSettingsView: View {
    @EnvironmentObject var editorVars: EditorVariables //this view accesses the buffer object
    var body: some View {
        Grid{
            //the rest could be programmatically generated based on the required input
            GridRow{
                Text("Source File Path:")
                    .padding()
                TextField("Source File Path", text: $editorVars.sourceFilePath)
                    .disableAutocorrection(true)
                    .padding()
            }
            GridRow{
                Text("Build Script Path:")
                    .padding()
                TextField("Build Script Path", text: $editorVars.buildScriptName)
                    .disableAutocorrection(true)
                    .padding()
            }
            Spacer()
        }
        .navigationTitle("Settings")
        .textFieldStyle(.roundedBorder)
    }
}
#Preview {
    RuntimeSettingsView()
}
