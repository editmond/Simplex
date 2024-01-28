//
//  test.swift
//  Simplex
//
//  Created by Edmond Cheng on 9/12/2023.
//

import SwiftUI

struct dummyView: View { //a view for testing, like the playground for functions. It is not implemented into the code unless testing.
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

func test(){
    print("bye bye")
}

#Preview {
    dummyView()
}
