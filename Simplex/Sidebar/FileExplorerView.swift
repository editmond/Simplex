//
//  FileExplorer.swift
//  Simplex
//
//  Created by Edmond Cheng on 18/1/2024.
//

import SwiftUI

struct FileExplorerView: View {
    var body: some View {
        Text(listDirectory())
    }
}

func listDirectory() -> String{
    let fm = FileManager.default
//                let path = Bundle.main.resourcePath!
    let path = "\(NSHomeDirectory())/Documents"
    var outputString: String = ""
    do {
        print("Accessing \(path)")
        let items = try fm.contentsOfDirectory(atPath: path)

        for item in items {
            print("Found \(item)")
            outputString = "\(outputString)\n\(item)"
        }
    } catch {
        // failed to read directory – bad permissions, perhaps?
    }
    return outputString
}

#Preview {
    FileExplorerView()
}
