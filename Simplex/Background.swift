//
//  Background.swift
//  Simplex
//
//  Created by Edmond Cheng on 9/12/2023.
//

import SwiftUI

struct Background: View {
    @EnvironmentObject var guiVars: GUIVariables
    var body: some View {
        guiVars.backgroundColour.ignoresSafeArea()
    }
}

#Preview {
    Background()
}
