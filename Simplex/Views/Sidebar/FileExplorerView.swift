//
//  FileExplorer.swift
//  Simplex
//
//  Created by Edmond Cheng on 18/1/2024.
//

import SwiftUI

struct FileExplorerView: View {
    
    //allows functions in this view to dismiss windows
    @Environment(\.dismissWindow) private var dismissWindow
    
    //assigning names for the objects
    @EnvironmentObject var editorVars: EditorVariables
    @EnvironmentObject var previewerVars: PreviewerVariables
    @EnvironmentObject var fileExplorerVars: FileExplorerVariables
    
    //are not shared between views
    @State var availableItems: [String] = listDirectory()
    @State var iconSize:CGFloat = 70
    @State var showHidden = false
    @State var isPresentingConfirmOpen = false
    
    //set of intermediate variables
    @State var currentPath:[String] = [] //stores the current path in an array, manage it like a stack.
    @State var bufferConcatenatedCurrentPath = "" //a buffer variable, may or may not be applied.
    @State var bufferChosenFileName = "" //a buffer variable, may or may not be applied.
    
    var columns:[GridItem] {
        [GridItem(.adaptive(minimum: 100, maximum: 500))]
    }
    var body: some View {
        VStack{
            
            Text("")
            Text("Browsing: ~/"+catPathVariable(strArr: currentPath))
                .padding(.bottom)
                .font(.largeTitle)
            HStack(){
                Button(){
                    _ = currentPath.popLast()
                    availableItems = listDirectory(fromHomePath: catPathVariable(strArr: currentPath))
                }label:{
                    Image(systemName: "arrowshape.left.fill")
                        .font(.system(size: 30))
                        .foregroundStyle(.tint)
                }
                .padding()
                .buttonStyle(BorderlessButtonStyle())
                .accessibilityLabel("Go Back")

                Text("Selected: \(bufferChosenFileName)")
                    .font(.system(size: 20))
                    .padding()
                Spacer()
            }
            
            //the view containing the visual representation of the selected directory.
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(availableItems, id: \.self){ item in
                        let dirCheckedItem = dirCheck(Filename: item)
                        //                        var executableCheck = false
                        VStack{
                            if !showHidden && dirCheckedItem[1]{
                                
                            }else{
                                Button{
                                    //if it is a directory, change available items.
                                    if dirCheckedItem[0]{
                                        let executableCheck = execCheck(Filename: String(NSHomeDirectory())+"/"+catPathVariable(strArr: currentPath)+item)
                                        if !executableCheck{
                                            currentPath.append(item+"/")
                                            availableItems = listDirectory(fromHomePath: catPathVariable(strArr: currentPath) )
                                        } else{
                                            bufferChosenFileName = ""
                                        }
                                    } else{
                                        currentPath.append(item)
                                        //if it is a file, replace the source code path with this one.
                                        bufferConcatenatedCurrentPath = catPathVariable(strArr: currentPath)
                                        
                                        //prime the variable for the next usage by removing the file, thus resetting it back to the current working directory.
                                        bufferChosenFileName = currentPath.popLast()!
                                    }
                                }label:{
                                    if dirCheckedItem[0]{
                                        let executableCheck = execCheck(Filename: String(NSHomeDirectory())+"/"+catPathVariable(strArr: currentPath)+item)
                                        if executableCheck{
                                            Image(systemName: "doc.badge.gearshape.fill")
                                                .font(.system(size: iconSize))
                                                .foregroundStyle(.tint)
                                        } else{
                                            Image(systemName: "folder.fill")
                                                .font(.system(size: iconSize))
                                                .foregroundStyle(.tint)
                                        }
                                        
                                    } else{
                                        Image(systemName: "doc.fill")
                                            .font(.system(size: iconSize))
                                            .foregroundStyle(.tint)
                                    }
                                }
                                .buttonStyle(BorderlessButtonStyle())
                                .accessibilityLabel(item)
                                //                                Text(item)
//                                Text(catPathVariable(strArr: currentPath)+item)
                                Text(item)
                            }
                        }
                    }
                }
            }
            Divider()
            HStack{
                Slider(value: $iconSize, in: 50...100) // a slider to adjust the icon sizes.
                    .padding()
                Toggle("Show hidden items", isOn: $showHidden)
                    .toggleStyle(.checkbox)
                    .padding()
                Button("Cancel"){
                    fileExplorerVars.concatenatedCurrentPath = fileExplorerVars.originalString
                    fileExplorerVars.chosenFileName = fileExplorerVars.originalString
                    
                    //ensure this is run last as it closes this view
                    dismissWindow(id: "files")
                }
                Button("Open"){
                    var doOpen = true
                    print("\(currentPath) size: \(currentPath.count)")
                    if (fileExplorerVars.pathVarToChange == 1){
                        if (currentPath.count > 1){
                            if (currentPath[1] != "Build_Scripts/"){
                                isPresentingConfirmOpen = true
                                doOpen = false
                            }
                        } else{
                            isPresentingConfirmOpen = true
                            doOpen = false
                        }
                    }
                    if doOpen{
                        fileExplorerVars.applyChange.toggle()
                        if fileExplorerVars.isOpenedFromSidebar{
                            editorVars.sourceFilePath = bufferConcatenatedCurrentPath
                            editorVars.writeSettings()
                            editorVars.loadFileText()
                        }else{
                            fileExplorerVars.concatenatedCurrentPath = bufferConcatenatedCurrentPath
                            fileExplorerVars.chosenFileName = bufferChosenFileName
                        }
                        
                        //reset the flag variable
                        fileExplorerVars.isOpenedFromSidebar = true
                        
                        //ensure this is run last as it closes this view
                        dismissWindow(id: "files")
                    }
                }.confirmationDialog("Are you sure? Simplex cannot gain permission to run scripts outside of ~/\(NonUIVariables.appFolder)/Build_Scripts/",isPresented: $isPresentingConfirmOpen) {
                    Button("Cancel", role: .cancel){
                        
                    }
                    Button("I want it not to work!", role: .destructive){
                        fileExplorerVars.applyChange.toggle()
                        if fileExplorerVars.isOpenedFromSidebar{
                            editorVars.sourceFilePath = bufferConcatenatedCurrentPath
                            editorVars.writeSettings()
                            editorVars.loadFileText()
                        }else{
                            fileExplorerVars.concatenatedCurrentPath = bufferConcatenatedCurrentPath
                            fileExplorerVars.chosenFileName = bufferChosenFileName
                        }
                        
                        //reset the flag variable
                        fileExplorerVars.isOpenedFromSidebar = true
                        
                        //ensure this is run last as it closes this view
                        dismissWindow(id: "files")
                    }
                }
                .padding()
            }
        }
    }
    
    func catPathVariable(strArr: [String]) -> String{
        var combinedStr = ""
        for element in strArr{
            combinedStr = combinedStr + element
        }
        return combinedStr
    }
}
