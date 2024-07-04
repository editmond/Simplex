//
//  FileExplorer.swift
//  Simplex
//
//  Created by Edmond Cheng on 18/1/2024.
//

import SwiftUI

struct FileExplorerView: View {
    
    @EnvironmentObject var editorVars: EditorVariables
    @EnvironmentObject var previewerVars: PreviewerVariables

    @State var availableItems: [String] = listDirectory()
    @State var iconSize:CGFloat = 70
    @State var showHidden = false
    @State var currentPath:[String] = []
    @State var concatenatedCurrentPath = ""
    @State var chosenFileName = ""

    @State var pathVarToChange = 0 //0: source file path. 1: build script path. 2: preview file path.
//    @State var bufferEditorVars: EditorVariables = EditorVariables(doLoad:false)
//    @State var bufferPreviewerVars: PreviewerVariables = PreviewerVariables(doLoad: false)
    @State var isOpenedFromSidebar = true
    @State var isFileSelected = false
    
    
    var columns:[GridItem] {
        [GridItem(.adaptive(minimum: 100, maximum: 500))]
    }
    var body: some View {
        VStack{
            Text("Home")
                .padding(.bottom)
                .font(.largeTitle)
            HStack{
                Button("back"){
                    currentPath.popLast()
                    availableItems = listDirectory(fromHomePath: catPathVariable(strArr: currentPath))
                }.padding().frame(alignment: .leading)
                Text("Selected: \(chosenFileName)")
                    .padding()
                    .frame(alignment: .center)
            }
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(availableItems, id: \.self){ item in
                        var dirCheckedItem = dirCheck(Filename: item)
                        VStack{
                            if !showHidden && dirCheckedItem[1]{
                                
                            }else{
                                Button{
                                    //if it is a directory, change available items.
                                    if dirCheckedItem[0]{
                                        currentPath.append(item+"/")
                                        availableItems = listDirectory(fromHomePath: catPathVariable(strArr: currentPath) )
                                    } else{
                                        currentPath.append(item)
                                        //if it is a file, replace the source code path with this one.
                                        concatenatedCurrentPath = catPathVariable(strArr: currentPath)
                                        
                                        //prime the variable for the next usage by removing the file, thus resetting it back to the current working directory.
                                        chosenFileName = currentPath.popLast()!
                                    }
                                }label:{
                                    if dirCheckedItem[0]{
                                        Image(systemName: "folder.fill")
                                            .font(.system(size: iconSize))
                                            .foregroundStyle(.tint)
                                        
                                    } else{
                                        Image(systemName: "doc.fill")
                                            .font(.system(size: iconSize))
                                            .foregroundStyle(.tint)
                                    }
                                }
                                .buttonStyle(BorderlessButtonStyle())
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
                Button("Open"){
                    if isOpenedFromSidebar{
                        editorVars.sourceFilePath = concatenatedCurrentPath
                        editorVars.writeSettings()
                        editorVars.loadFileText()
                        print("not using buffered")
                    }else{
//                        switch pathVarToChange{
//                        case 0:
//                            bufferEditorVars.sourceFilePath = concatenatedCurrentPath
//                            bufferEditorVars.writeSettings()
//                            bufferEditorVars.loadFileText()
//                        case 1:
//                            bufferEditorVars.buildScriptName = chosenFileName
//                            bufferEditorVars.writeSettings()
//                        case 2:
//                            bufferPreviewerVars.previewReadFile = concatenatedCurrentPath
//                            bufferPreviewerVars.writeSettings()
//                        default:
//                            print("Invalid path to change")
//                        }
                        isFileSelected = true
                    }
                    
                    //reset the flag variable
                    isOpenedFromSidebar = true
                }
            }
            .padding()
        }
    }
    func fileSelectListener() async -> [String]{
        while !isFileSelected{
            //just wait for the user to choose.
        }
        //reset the flag
        isFileSelected = false
        
        //return the file path and name of the file for processing.
        return [concatenatedCurrentPath, chosenFileName]
    }
}

func catPathVariable(strArr: [String]) -> String{
    var combinedStr = ""
    for element in strArr{
        combinedStr = combinedStr + element
    }
    return combinedStr
}
