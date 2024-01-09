//
//  Previewer.swift
//  Simplex
//
//  Created by Edmond Cheng on 4/12/2023.
//

import SwiftUI

struct Previewer: View {
    @EnvironmentObject var editorVars: EditorVariables
    var body: some View {
        Text(editorVars.fullText)
    }
}

#Preview {
    Previewer()
}
