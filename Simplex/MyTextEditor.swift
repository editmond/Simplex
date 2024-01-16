//
//  Editor.swift
//  Simplex
//
//  Created by Edmond Cheng on 4/12/2023.
//

import SwiftUI

struct MyTextEditor: View {
    @EnvironmentObject var guiVars: GUIVariables
    @EnvironmentObject var editorVars: EditorVariables
    @State var someText = "heelo"
    var body: some View {
        VStack{
            TextEditor(text: $editorVars.fullText)
                .foregroundColor(Color.gray)
                .font(.custom("HelveticaNeue", size: 13))
                .scrollContentBackground(.hidden)
                .background(guiVars.getBackgroundColour(brightnessMultiplier: 1.1))
//            Button(){
//                print(editorVars.fullText)
//            } label: {
//                Text("OUTPUT")
//            }
        }
    }
}

#Preview {
    MyTextEditor()
}
