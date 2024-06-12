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
    
    //A flag for each set of icons to determine when an indeterminate progress indicator should be displayed.
    //in form [true, action num], where true is represented by 1 and false is represented by 0. Action num is the index of the button in progress.
    @State var isUpperExecutingFunction = [0,0]
    @State var isLowerExecutingFunction = [0,0]

    var body: some View {
        VStack(){
            
            //Dynamically adding the buttons from the list of icons in SharedStuff
            let referenceNum = 0...sideVars.UpperSideBarIcons.count
            ForEach(Array(zip(sideVars.UpperSideBarIcons, referenceNum)), id: \.0){ (icon, num) in
                
                
                Button{
                    
                    isUpperExecutingFunction = [1,num]
                    
                    Task{
                        
                        let output = await UpperSidebarActor(actionNum: num, writeOutText: editorVars.fullText, sourceFilePath: editorVars.sourceFilePath, shellCommand: editorVars.shellCommand, shellOptions: editorVars.shellOptions, buildScriptName: editorVars.buildScriptName)
                        
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
                        
                        isUpperExecutingFunction[0] = 0
                    }
                    
                    
                } label:{
                    if(isUpperExecutingFunction[0]==1 && isUpperExecutingFunction[1]==num){
                        ProgressView()
                    }
                    else{
                        Image(systemName: icon)
                            .font(.system(size: guiVars.iconSize))
                            .foregroundStyle(.tint)
                    }
                }
                .buttonStyle(BorderlessButtonStyle())
                //attach a keyboard shortcut to each button.
                .keyboardShortcut(KeyEquivalent(Character(UnicodeScalar(sideVars.UpperShortcuts[num])!)))
            }
            Spacer()
            
            let lowerReferenceNum = 0...sideVars.LowerSidebarIcons.count
            ForEach(Array(zip(sideVars.LowerSidebarIcons, lowerReferenceNum)), id: \.0){ (icon, num) in
                Button{
                    
                    isLowerExecutingFunction = [1,num]

                    Task {
                        
                        let windowID = await LowerSidebarActor(actionNum: num)
                        if (windowID != ""){
                            openWindow(id: windowID)
                        }
                        isLowerExecutingFunction = [0,num]
                    }
                    
                } label:{
                    if (isLowerExecutingFunction[0] == 1 && isLowerExecutingFunction[1] == num){
                        ProgressView()
                    } else{
                        Image(systemName: icon)
                            .font(.system(size: guiVars.iconSize))
                            .foregroundStyle(.tint)
                    }
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
