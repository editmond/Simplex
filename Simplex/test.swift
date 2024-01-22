//
//  test.swift
//  Simplex
//
//  Created by Edmond Cheng on 9/12/2023.
//

import SwiftUI

struct dummyView: View {
    @EnvironmentObject var guiVars: GUIVariables
    @EnvironmentObject var sideVars: SidebarVariables
    @EnvironmentObject var editorVars: EditorVariables
    init(){
        print("yes")
    }
    var body: some View {
        Text("")
    }
}

#Preview {
    dummyView()
}
