//
//  SideBar.swift
//  Simplex
//
//  Created by Edmond Cheng on 4/12/2023.
//

import SwiftUI
struct SideBar: View {
    @Environment(\.openWindow) var openWindow
    
    @EnvironmentObject var guiVars: GUIVariables
    @EnvironmentObject var sideVars: SidebarVariables
    @EnvironmentObject var editorVars: EditorVariables
    @EnvironmentObject var previewerVars: PreviewerVariables
    
    var body: some View {
        VStack(){
            
            //Dynamically adding the buttons from the list of icons in SharedStuff
            let referenceNum = 0...sideVars.UpperSideBarIcons.count
            ForEach(Array(zip(sideVars.UpperSideBarIcons, referenceNum)), id: \.0){ (icon, num) in
                Button{
                    let output = UpperSidebarActor(actionNum: num, writeOutText: editorVars.fullText, sourceFilePath: editorVars.sourceFilePath, shellCommand: editorVars.shellCommand, shellOptions: editorVars.shellOptions, buildScriptName: editorVars.buildScriptName)
                    
                    //open a window if it is specified
                    if (output[0] != ""){
                        openWindow(id: output[0])
                    }
                    
                    //pipe any output into the preview view.
                    if (output[1] != ""){
                        editorVars.shellOutput = output[1]
                        //                                writeToFile(writeOutText: editorVars.shellOutput, sourceFilePath: previewerVars.previewReadFile)
                    }
                    previewerVars.previewText = ""
                    if (previewerVars.previewType == 1){
                        previewerVars.previewText = readFromFile(sourceFilePath: previewerVars.previewReadFile)
                    }
                    previewerVars.previewID = UUID()
                    
                } label:{
                    Image(systemName: icon)
                        .font(.system(size: guiVars.iconSize))
                        .foregroundStyle(.tint)
                }
                .buttonStyle(BorderlessButtonStyle())
                //attach a keyboard shortcut to each button.
                .keyboardShortcut(KeyEquivalent(Character(UnicodeScalar(sideVars.UpperShortcuts[num])!)))
            }
            Spacer()
            
            let lowerReferenceNum = 0...sideVars.LowerSidebarIcons.count
            ForEach(Array(zip(sideVars.LowerSidebarIcons, lowerReferenceNum)), id: \.0){ (icon, num) in
                Button{
                    let windowID = LowerSidebarActor(actionNum: num)
                    if (windowID != ""){
                        openWindow(id: windowID)
                    }
                    
                } label:{
                    Image(systemName: icon)
                        .font(.system(size: guiVars.iconSize))
                        .foregroundStyle(.tint)
                }
                .buttonStyle(BorderlessButtonStyle())
                //attach a keyboard shortcut to each button.
                .keyboardShortcut(KeyEquivalent(Character(UnicodeScalar(sideVars.LowerShortcuts[num])!)))
            }
        }
    }
}

//#Preview {
//    SideBar()
//}
