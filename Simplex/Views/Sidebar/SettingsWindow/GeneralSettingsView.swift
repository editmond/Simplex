//
//  GeneralSettingsView.swift
//  Simplex
//
//  Created by Edmond Cheng on 28/1/2024.
//

import SwiftUI

struct GeneralSettingsView: View{
    @Environment(\.openWindow) var openWindow // allows the view to open new windows
    
    @EnvironmentObject var editorVars: EditorVariables //this view accesses the buffer object
    var body: some View{
        Grid{
            //the rest could be programmatically generated based on the required input
            GridRow{
                Text("Source File Path:")
                    .padding()
                Text("~/")
                TextField("Source File Path", text: $editorVars.sourceFilePath)
                    .disableAutocorrection(true)
                    .padding()
            }
            GridRow{
                Button{
                    
                    //opens the file explorer window
                    openWindow(id: "settingsSourceFile")
                    
                }label:{
                    Text("Change")
                }
            }
            GridRow{
                Text("Some filler")
            }
            GridRow{
                Text("Some filler")
            }
            GridRow{
                Text("Some filler")
            }
            GridRow{
                Text("Some filler")
            }
            Spacer()
        }
        .navigationTitle("Settings")
        .textFieldStyle(.roundedBorder)
    }
}

#Preview {
    GeneralSettingsView()
}
