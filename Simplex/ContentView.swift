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
        HStack{ // All elements of the main window are arranged horizontally from each other
            
            SideBar()
            Divider()
            
            MyTextEditor()
            Divider()
            
            Previewer()
            Divider()
            
            //This is a test of the editable GUI variables concept. is temporary
            VStack{
                Button(){
                    guiVars.iconSize += 5
                } label: {
                    Image(systemName: "plus")
                }
                Button(){
                    guiVars.iconSize -= 5
                } label: {
                    Image(systemName: "minus")
                }
            }
        }.padding()
    }
}

#Preview {
    ContentView()
}
