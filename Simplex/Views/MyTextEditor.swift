//
//  Editor.swift
//  Simplex
//
//  Created by Edmond Cheng on 4/12/2023.
//

import SwiftUI

struct MyTextEditor: View {
    @Environment(\.colorScheme) var colorScheme
	
    @EnvironmentObject var guiVars: GUIVariables
    @EnvironmentObject var editorVars: EditorVariables
    @State var someText = "heelo"
    var body: some View {
        VStack{
			Text("Editing - " + editorVars.sourceFilePath)
            TextEditor(text: $editorVars.fullText)
                .foregroundColor(Color.black)
				.font(.custom("HelveticaNeue", size: 13))
                .scrollContentBackground(.hidden)
				.background(Color(hue: guiVars.backgroundHue, saturation: 0.2, brightness: colorScheme == .dark ? 0.7 : 1.0))
				.overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(hue: guiVars.backgroundHue, saturation: 0.2, brightness: colorScheme == .dark ? 0.7 : 1.0), lineWidth: 5))
			Button("Save"){
				writeToFile(writeOutText: editorVars.fullText, sourceFilePath: editorVars.sourceFilePath)
			}.keyboardShortcut("s").hidden()
        }
    }
}

#Preview {
    MyTextEditor()
}
