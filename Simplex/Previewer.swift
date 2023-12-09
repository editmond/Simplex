//
//  Previewer.swift
//  Simplex
//
//  Created by Edmond Cheng on 4/12/2023.
//

import SwiftUI

struct Previewer: View {
    @EnvironmentObject var guiVars: GUIVariables
    var body: some View {
        Text(guiVars.fullText)
    }
}

#Preview {
    Previewer()
}
