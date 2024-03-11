//
//  SettingsView.swift
//  Simplex
//
//  Created by Edmond Cheng on 11/1/2024.
//

import SwiftUI

struct NoDeprecateSettingsView: View{
    
    //the global variables
    @EnvironmentObject var guiVars: GUIVariables
    @EnvironmentObject var editorVars: EditorVariables
    @EnvironmentObject var sidebarVars: SidebarVariables
    @EnvironmentObject var previewerVars: PreviewerVariables
    
    //the buffer for the globabl variables
    @StateObject var bufferGuiVars = GUIVariables(doLoad: true)
    @StateObject var bufferEditorVars = EditorVariables(doLoad: true)
    @StateObject var bufferSidebarVars = SidebarVariables(doLoad: true)
    @StateObject var bufferPreviewerVars = PreviewerVariables(doLoad: true)
    
    //the default objects
    let defaultGuiObj = GUIVariables(doLoad: false)
    let defaultEditorObj = EditorVariables(doLoad: false)
    let defaultSideObj = SidebarVariables(doLoad: false)
    var defaultPreviewerObj = PreviewerVariables(doLoad: false)

    @State private var showingAlert = false
    @State private var doAction = false
    
    var body: some View{
        ZStack{
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
            HStack{
                Button(){ //Restore Default settings
                    
                    //copy to the global objects
                    guiVars.copyContents(GUIObj: defaultGuiObj)
                    editorVars.copyContents(EditorObj: defaultEditorObj)
                    sidebarVars.copyContents(SideObj: defaultSideObj)
                    previewerVars.copyContents(PreviewerObj: defaultPreviewerObj)
                    
                    //copy to the buffer objects
                    bufferGuiVars.copyContents(GUIObj: defaultGuiObj)
                    bufferEditorVars.copyContents(EditorObj: defaultEditorObj)
                    bufferSidebarVars.copyContents(SideObj: defaultSideObj)
                    bufferPreviewerVars.copyContents(PreviewerObj: defaultPreviewerObj)
                    
                    //write the new settings
                    guiVars.writeSettings()
                    editorVars.writeSettings()
                    sidebarVars.writeSettings()
                    previewerVars.writeSettings()
                    
                    //reload the data from files in case the source has changed
                    editorVars.loadFileText()

                    //destory objects ~~~ may not be necessary?
                    
                } label: {
                    Text("Restore Default")
                }
                Spacer()
                Button(){
                    
                    //Reset settings to what the user had previously
                    bufferGuiVars.copyContents(GUIObj: guiVars)
                    bufferEditorVars.copyContents(EditorObj: editorVars)
                    bufferSidebarVars.copyContents(SideObj: sidebarVars)
                    bufferPreviewerVars.copyContents(PreviewerObj: previewerVars)

                } label: {
                    Text("Cancel")
                }
                Button(){
                    
                    //apply new settings
                    guiVars.copyContents(GUIObj: bufferGuiVars)
                    editorVars.copyContents(EditorObj: bufferEditorVars)
                    sidebarVars.copyContents(SideObj: bufferSidebarVars)
                    previewerVars.copyContents(PreviewerObj: bufferPreviewerVars)
                    
                    //write the new settings
                    guiVars.writeSettings()
                    editorVars.writeSettings()
                    sidebarVars.writeSettings()
                    previewerVars.writeSettings()
                    
                    //reload the data from files in case the source has changed
                    editorVars.loadFileText()
                    
                } label: {
                    Text("Apply")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            .padding()
        }
        .environmentObject(bufferGuiVars)
        .environmentObject(bufferEditorVars)
        .environmentObject(bufferSidebarVars)
        .environmentObject(bufferPreviewerVars)
    }
}
        
#Preview {
   NoDeprecateSettingsView()
}
