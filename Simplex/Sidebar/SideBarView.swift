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
            
            //Dynamically adding the buttons from the list of icons in SharedStuff
            let referenceNum = 0...sideVars.UpperSideBarIcons.count
            ForEach(Array(zip(sideVars.UpperSideBarIcons, referenceNum)), id: \.0){ (icon, num) in
                    Image(systemName: icon)
                        .font(.system(size: guiVars.iconSize))
                        .foregroundStyle(.tint)
                        .onTapGesture{
                            UpperSidebarActor(actionNum: num)
                        }
            }
            
            Spacer()
            
            let lowerReferenceNum = 0...sideVars.LowerSidebarIcons.count
            ForEach(Array(zip(sideVars.LowerSidebarIcons, lowerReferenceNum)), id: \.0){ (icon, num) in
                    Image(systemName: icon)
                        .font(.system(size: guiVars.iconSize))
                        .foregroundStyle(.tint)
                        .onTapGesture{
                            LowerSidebarActor(actionNum: num)
                        }
            }
        }
    }
}

#Preview {
    SideBar()
}
