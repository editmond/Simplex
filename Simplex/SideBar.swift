//
//  SideBar.swift
//  Simplex
//
//  Created by Edmond Cheng on 4/12/2023.
//

import SwiftUI
struct SideBar: View {
    var body: some View {
        VStack(){
            Image(systemName: "play.circle")
                .font(.system(size: iconSize))
                .foregroundStyle(.tint)
            Image(systemName: "folder")
                .font(.system(size: iconSize))
                .foregroundStyle(.tint)
            Spacer()
            Image(systemName: "music.note")
                .font(.system(size: iconSize))
                .foregroundStyle(.tint)
            Image(systemName: "doc.text")
                .font(.system(size: iconSize))
                .foregroundStyle(.tint)
            Image(systemName: "gearshape")
                .font(.system(size: iconSize))
                .foregroundStyle(.tint)
        }
    }
}

#Preview {
    SideBar()
}
