//
//  SideBar.swift
//  Simplex
//
//  Created by Edmond Cheng on 4/12/2023.
//

import SwiftUI
struct SideBar: View {
    @Environment(\.openWindow) var openWindow
    
    @EnvironmentObject var guiVars: GUIVariables
    @EnvironmentObject var sideVars: SidebarVariables
    
    var body: some View {
        VStack(){
            ForEach(sideVars.UpperSideBarViews, \.self){ iconView in
                self.iconView()
            }
            Image(systemName: "play.circle")
                .font(.system(size: guiVars.iconSize))
                .foregroundStyle(.tint)
            Image(systemName: "folder")
                .font(.system(size: guiVars.iconSize))
                .foregroundStyle(.tint)
            Spacer()
            Image(systemName: "music.note")
                .font(.system(size: guiVars.iconSize))
                .foregroundStyle(.tint)
            Image(systemName: "doc.text")
                .font(.system(size: guiVars.iconSize))
                .foregroundStyle(.tint)
            Image(systemName: "gearshape")
                .font(.system(size: guiVars.iconSize))
                .foregroundStyle(.tint)
        }
    }
}

#Preview {
    SideBar()
}
