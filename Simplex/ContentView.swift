//
//  ContentView.swift
//  Simplex
//
//  Created by Edmond Cheng on 4/12/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            SideBar()
            MyTextEditor()
            Previewer()
            }.padding()
    }
}

#Preview {
    ContentView()
}
