//
//  FileExplorer.swift
//  Simplex
//
//  Created by Edmond Cheng on 18/1/2024.
//

import SwiftUI

struct FileExplorerView: View {
    @State var availableItems: [String] = listDirectory()
    var body: some View {
        VStack{
            Text("Home")
                .padding(.bottom)
                .font(.largeTitle)
            ForEach(availableItems, id: \.self){ item in
                Text(item)
            }
        }
    }
}

#Preview {
    FileExplorerView()
}
