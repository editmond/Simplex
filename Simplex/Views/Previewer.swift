//
//  Previewer.swift
//  Simplex
//
//  Created by Edmond Cheng on 4/12/2023.
//

import SwiftUI

struct Previewer: View {
    @EnvironmentObject var editorVars: EditorVariables
    @EnvironmentObject var previewerVars: PreviewerVariables
    var body: some View {
        ScrollView{
            Text("file://\(NSHomeDirectory())/\(previewerVars.previewReadFile)")
            if previewerVars.previewType == 1{
                Text(previewerVars.previewText)
            } else if previewerVars.previewType == 2{
                AsyncImage(url: URL(string: "file://\(NSHomeDirectory())/\(previewerVars.previewReadFile)"))
                    .id(previewerVars.previewID)
            } else if previewerVars.previewType == 0{
                Text("Unsupported File Type")
            }
            Text("Command Line Output")
                .font(.headline)
                .padding()
            Text("\(editorVars.shellOutput)")
        }
    }
}

#Preview {
    Previewer()
}
