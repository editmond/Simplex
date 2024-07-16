//
//  ContentView.swift
//  Simplex
//
//  Created by Edmond Cheng on 4/12/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var guiVars: GUIVariables
    var body: some View {
        VStack(){
            HStack{ // All elements of the main window are arranged horizontally from each other
                
                SideBar()
                Divider()
                
                MyTextEditor()
                Divider()
                
                Previewer()
                Divider()

            }.padding()
        }
    }
}

#Preview {
    ContentView()
}
