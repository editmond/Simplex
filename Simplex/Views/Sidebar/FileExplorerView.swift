//
//  FileExplorer.swift
//  Simplex
//
//  Created by Edmond Cheng on 18/1/2024.
//

import SwiftUI

struct FileExplorerView: View {
    @State var availableItems: [String] = listDirectory()
    @State var iconSize:CGFloat = 70
    @State var showHidden = false
    var columns:[GridItem] {
        [GridItem(.adaptive(minimum: 100, maximum: 500))]
    }
    var body: some View {
        VStack{
            Text("Home")
                .padding(.bottom)
                .font(.largeTitle)
            Button("back"){
                print("go back?")
            }
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(availableItems, id: \.self){ item in
                        var dirCheckedItem = dirCheck(Filename: item)
                        VStack{
                            if !showHidden && dirCheckedItem[1]{
                                
                            }else{
                                Button{
                                    //if it is a file, replace the source code path with this one.
                                    //if it is a directory, change available items.
                                    if dirCheckedItem[0]{
                                        availableItems = listDirectory(fromHomePath: item)
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
            HStack{
                Slider(value: $iconSize, in: 50...100) // a slider to adjust the icon sizes.
                    .padding()
                Toggle("Show hidden items", isOn: $showHidden)
                    .toggleStyle(.checkbox)
                    .padding()
            }
            .padding()
        }
    }
}

#Preview {
    FileExplorerView()
}
