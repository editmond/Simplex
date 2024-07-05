//
//  RuntimeSettingsView.swift
//  Simplex
//
//  Created by Edmond Cheng on 28/1/2024.
//

import SwiftUI

struct RuntimeSettingsView: View {
    
    @Environment(\.openWindow) var openWindow // allows the view to open new windows
    
    @EnvironmentObject var editorVars: EditorVariables //this view accesses the buffer object
    @EnvironmentObject var previewerVars: PreviewerVariables //this view accesses the buffer object
    
    @EnvironmentObject var fileExplorerVars: FileExplorerVariables//the global object is accessed.
    
    var body: some View {
        Grid{
            //the rest could be programmatically generated based on the required input
            GridRow{
                Text("Source File Path:")
                    .padding()
                Text("~/")
                TextField("Source File Path", text: $editorVars.sourceFilePath)
                    .disableAutocorrection(true)
                
                Button{
                    
                    //add context to the file explorer.
                    fileExplorerVars.originalString = editorVars.sourceFilePath
                    fileExplorerVars.isOpenedFromSidebar = false
                    fileExplorerVars.pathVarToChange = 0
                    //opens the file explorer window
                    openWindow(id: "files")
                }label:{
                    Text("Browse")
                }
                .padding()
                .onChange(of: fileExplorerVars.applyChange){ oldValue, newValue in
                    if fileExplorerVars.pathVarToChange == 0{
                        editorVars.sourceFilePath = fileExplorerVars.concatenatedCurrentPath
                    }
                }
                
            }
            GridRow{
                Text("Build Script Path:")
                    .padding()
                Text("~/SimplexFiles/Build_Scripts")
                TextField("Build Script Path", text: $editorVars.buildScriptName)
                    .disableAutocorrection(true)
                    .padding()
                Button{
                    
                    //add context to the file explorer.
                    fileExplorerVars.originalString = editorVars.buildScriptName
                    fileExplorerVars.isOpenedFromSidebar = false
                    fileExplorerVars.pathVarToChange = 1
                    
                    //opens the file explorer window
                    openWindow(id: "files")
                    
                }label:{
                    Text("Browse")
                }
                .padding()
                .onChange(of: fileExplorerVars.applyChange){ oldValue, newValue in
                    if fileExplorerVars.pathVarToChange == 1{
                        editorVars.buildScriptName = fileExplorerVars.chosenFileName
                    }
                }
            }
            GridRow{
                Text("Preview File Path:")
                    .padding()
                Text("~/")
                TextField("Preview File Path", text: $previewerVars.previewReadFile)
                    .disableAutocorrection(true)
                    .padding()
                
                Button{
                    
                    //add context to the file explorer.
                    fileExplorerVars.originalString = previewerVars.previewReadFile
                    fileExplorerVars.isOpenedFromSidebar = false
                    fileExplorerVars.pathVarToChange = 2
                    
                    //opens the file explorer window
                    openWindow(id: "files")
                    
                }label:{
                    Text("Browse")
                }
                .padding()
                .onChange(of: fileExplorerVars.applyChange){ oldValue, newValue in
                    if fileExplorerVars.pathVarToChange == 2{
                        previewerVars.previewReadFile = fileExplorerVars.concatenatedCurrentPath
                    }
                }
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
