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
    @EnvironmentObject var fileExplorerVars: FileExplorerVariables
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
                
                Button{
                    fileExplorerVars.isOpenedFromSidebar = false
                    fileExplorerVars.pathVarToChange = 0
                    //opens the file explorer window
                    openWindow(id: "files")
                }label:{
                    Text("Browse")
                }
                .padding()
                .onChange(of: fileExplorerVars.concatenatedCurrentPath){ oldValue, newValue in
                    if fileExplorerVars.pathVarToChange == 0{
                        editorVars.sourceFilePath = newValue
                    }
                }
            }
            GridRow{
                
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
