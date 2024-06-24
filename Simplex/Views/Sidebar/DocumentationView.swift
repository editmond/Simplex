//
//  DocumentationView.swift
//  Simplex
//
//  Created by Edmond Cheng on 28/1/2024.
//

import SwiftUI
import WebKit

struct DocumentationView: View {
    
    @Environment(\.openURL) private var openURL
    @EnvironmentObject var editorVars: EditorVariables
    
    @State private var selectedTab = "docView"
//    init(){
//        if let url = URL(string: "https://www.example.com") {
//                        openURL(url)
//        }
//    }
    var body: some View {
        VStack{
            Spacer()
            TabView(selection: $selectedTab) {
                WebView(url: $editorVars.documentationURL)
                    .tabItem{
                        Label("Language Help", systemImage: "star")
                    }
                    .tag("webView")
                Text("A website with simplex documentation will be displayed here.")
                    .tabItem{
                        Label("Simplex Help", systemImage: "star")
                    }
                    .tag("docView")
            }
        }
    }
}


//view from https://stackoverflow.com/questions/63070833/how-to-invoke-a-method-on-a-nsviewrepresentable-from-a-view by Asperi
struct WebView:  NSViewRepresentable{
    @Binding var url: URL?
    
    func makeNSView(context: Context) -> WKWebView {
            return WKWebView()
        }

    func updateNSView(_ browser: WKWebView, context: Context) {
        if let url = self.url, url != browser.url {
            browser.load(URLRequest(url: url))
        }
    }
}

#Preview {
    DocumentationView()
}
