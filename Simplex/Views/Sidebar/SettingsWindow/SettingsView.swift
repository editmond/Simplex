//
//  SettingsView.swift
//  Simplex
//
//  Created by Edmond Cheng on 11/1/2024.
//

import SwiftUI

struct NoDeprecateSettingsView: View{
    @Environment(\.dismissWindow) private var dismissWindow
    
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

    //some flags for managing the views.
    @State private var showingAlert = false
    @State private var doAction = false
    @State private var isPresentingConfirmReset: Bool = false // for presenting confirmation dialogue when resetting defaults.
    
    var body: some View{
        VStack{
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
                    NavigationLink(destination: AudioSettingsView()) {
                        Label("Audio", systemImage: "headphones")
                    }
                }
                .navigationTitle("Settings")
                
            } detail: {
                GeneralSettingsView()
            }
            Divider()
            HStack{
                Button(){ //Restore Default settings
                    isPresentingConfirmReset = true

                } label: {
                    Text("Restore Default")
                } .confirmationDialog("Are you sure? Doing so will erase ALL prexisting settings to the default.",isPresented: $isPresentingConfirmReset) { // creates a popup asking for confirmation to reset to default.
                    Button("Restore Default?", role: .destructive){
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
                        
                        //dismiss the window
                        dismissWindow(id: "settings")
                    }
                }
                Spacer()
                Button(){
                    
                    //Reset settings to what the user had previously
                    bufferGuiVars.copyContents(GUIObj: guiVars)
                    bufferEditorVars.copyContents(EditorObj: editorVars)
                    bufferSidebarVars.copyContents(SideObj: sidebarVars)
                    bufferPreviewerVars.copyContents(PreviewerObj: previewerVars)
                   
                    //dismiss the window
                    dismissWindow(id: "settings")

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
                    
                    
                    dismissWindow(id: "settings")
                } label: {
                    Text("Apply")
                }
            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            .frame(maxWidth: .infinity, maxHeight: 20, alignment: .bottomTrailing)
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
