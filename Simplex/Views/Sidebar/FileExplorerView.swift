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
    var columns:[GridItem] {
        [GridItem(.adaptive(minimum: 100, maximum: 500))]
    }
    var body: some View {
        VStack{
            Text("Home")
                .padding(.bottom)
                .font(.largeTitle)
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(availableItems, id: \.self){ item in
                        var buttonClicked = false
                        VStack{
                            Button{
                                buttonClicked.toggle()
                            }label:{
                                Image(systemName: "folder.fill")
                                    .font(.system(size: iconSize))
                                    .foregroundStyle(.tint)
                                Text(item)
                            }
                        }
                    }
                }
            }
            Slider(value: $iconSize, in: 50...100) // a slider to adjust the icon sizes.
        }
    }
}

#Preview {
    FileExplorerView()
}
