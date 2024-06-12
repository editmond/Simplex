//
//  DocumentationView.swift
//  Simplex
//
//  Created by Edmond Cheng on 28/1/2024.
//

import SwiftUI

struct DocumentationView: View {
    
    @Environment(\.openURL) private var openURL
    
    init(){
        if let url = URL(string: "https://www.example.com") {
                        openURL(url)
        }
    }
    var body: some View {
        Text("Some documentation. Possibly web scraped")
    }
}

#Preview {
    DocumentationView()
}
