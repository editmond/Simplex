//
//  Background.swift
//  Simplex
//
//  Created by Edmond Cheng on 9/12/2023.
//

import SwiftUI

struct Background: View {
    @EnvironmentObject var guiVars: GUIVariables
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        guiVars.getBackgroundColour(brightnessMultiplier: colorScheme == .dark ? 0.7 : 1, saturationMultiplier: 1).ignoresSafeArea()
    }
}

#Preview {
    Background()
}
