//
//  FileExplorerVariables.swift
//  Simplex
//
//  Created by Edmond Cheng on 5/7/2024.
//

import Foundation
class FileExplorerVariables: ObservableObject{
    @Published var originalString = ""
    
    @Published var concatenatedCurrentPath = ""
    @Published var chosenFileName = ""

    @Published var pathVarToChange = 0 //0: source file path. 1: build script path. 2: preview file path.
    @Published var isOpenedFromSidebar = true
    @Published var applyChange = false //just toggle to get changes to happen.
}
