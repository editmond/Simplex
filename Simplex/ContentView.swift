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
        HStack{
            SideBar()
            MyTextEditor()
            Previewer()
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
