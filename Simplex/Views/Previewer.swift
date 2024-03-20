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
            AsyncImage(url: URL(string: "file://\(NSHomeDirectory())/\(previewerVars.previewReadFile)"))
            //AsyncImage(url: URL(string: "file://\(NSHomeDirectory())/fun.ppm"))
            Text("Command Line Output")
                .font(.headline)
                .padding()
            Text("\(editorVars.previewText)")
        }
    }
}

#Preview {
    Previewer()
}
