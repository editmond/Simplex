//
//  Editor.swift
//  Simplex
//
//  Created by Edmond Cheng on 4/12/2023.
//

import SwiftUI

struct Editor: View {
    @State private var fullText: String = "This is some editable text..."
    var body: some View {
        TextEditor(text: $fullText)
            .foregroundColor(Color.gray)
            .font(.custom("HelveticaNeue", size: 13))
            .scrollContentBackground(.hidden)
            .background(.accent.gradient)
    }
}

#Preview {
    Editor()
}
