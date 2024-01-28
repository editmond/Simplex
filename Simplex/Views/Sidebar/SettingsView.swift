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
    
    //the buffer for the globabl variables
    @StateObject var bufferGuiVars = GUIVariables(doLoad: true)
    @StateObject var bufferEditorVars = EditorVariables(doLoad: true)
    @StateObject var bufferSidebarVars = SidebarVariables(doLoad: true)
    
    //the default objects
    let defaultGuiObj = GUIVariables(doLoad: false)
    let defaultEditorObj = EditorVariables(doLoad: false)
    let defaultSideObj = SidebarVariables(doLoad: false)
    
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
                    
                    //copy to the buffer objects
                    bufferGuiVars.copyContents(GUIObj: defaultGuiObj)
                    bufferEditorVars.copyContents(EditorObj: defaultEditorObj)
                    bufferSidebarVars.copyContents(SideObj: defaultSideObj)
                    
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
                    
                } label: {
                    Text("Cancel")
                }
                Button(){
                    
                    //apply new settings
                    guiVars.copyContents(GUIObj: bufferGuiVars)
                    editorVars.copyContents(EditorObj: bufferEditorVars)
                    sidebarVars.copyContents(SideObj: bufferSidebarVars)
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
    }
}
        

struct GUISettingsView: View {
    @EnvironmentObject var guiVars: GUIVariables
    var body: some View{
        VStack{
            Text("Gui Settings")
                .padding()
            
            //temporary
            HStack{
                Button(){
                    guiVars.backgroundHue += 0.01
                } label: {
                    Image(systemName: "plus")
                }
                Button(){
                    guiVars.backgroundHue -= 0.01
                } label: {
                    Image(systemName: "minus")
                }
            }
            Spacer()
        }
        .navigationTitle("Settings - GUI")
    }
}

struct RuntimeSettingsView: View {
    var body: some View {
        VStack{
            Text("Runtime Settings")
                .padding()
            Spacer()
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
   NoDeprecateSettingsView()
}
