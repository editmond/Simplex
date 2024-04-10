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
                    Image(systemName: icon)
                        .font(.system(size: guiVars.iconSize))
                        .foregroundStyle(.tint)
                        .onTapGesture{
                            let output = UpperSidebarActor(actionNum: num, writeOutText: editorVars.fullText, sourceFilePath: editorVars.sourceFilePath, shellCommand: editorVars.shellCommand, shellOptions: editorVars.shellOptions, buildScriptName: editorVars.buildScriptName)
                            if (output[0] != ""){
                                openWindow(id: output[0])
                            }
                            if (output[1] != ""){
                                editorVars.previewText = output[1]
                                previewerVars.previewCheck.toggle()
//                                writeToFile(writeOutText: editorVars.previewText, sourceFilePath: previewerVars.previewReadFile)
                            }
                        }
            }
            
            Spacer()
            
            let lowerReferenceNum = 0...sideVars.LowerSidebarIcons.count
            ForEach(Array(zip(sideVars.LowerSidebarIcons, lowerReferenceNum)), id: \.0){ (icon, num) in
                    Image(systemName: icon)
                        .font(.system(size: guiVars.iconSize))
                        .foregroundStyle(.tint)
                        .onTapGesture{
                            let windowID = LowerSidebarActor(actionNum: num)
                            if (windowID != ""){
                                openWindow(id: windowID)
                            }
                        }
            }
        }
    }
}

#Preview {
    SideBar()
}
