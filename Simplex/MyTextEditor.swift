//
//  Editor.swift
//  Simplex
//
//  Created by Edmond Cheng on 4/12/2023.
//

import SwiftUI

struct MyTextEditor: View {
    @EnvironmentObject var guiVars: GUIVariables
    @State var someText = "heelo"
    var body: some View {
        VStack{
            TextEditor(text: $guiVars.fullText)
                .foregroundColor(Color.gray)
                .font(.custom("HelveticaNeue", size: 13))
                .scrollContentBackground(.hidden)
            Button{
                try? safeShell("say Hello World!")
                try? safeShell("cd ~/Desktop")
                try? safeShell("mkdir heelo")
                someText = "asldkjflakdsj"
            } label: {
                Text(someText)
            }
        }
    }
}

#Preview {
    MyTextEditor()
}
