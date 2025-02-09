//
//  folderCheck.swift
//  Simplex
//
//  Created by Edmond Cheng on 16/2/2024.
//

import Foundation

//checks for the existence of a folder
func folderCheck(folderName: String) -> Bool{
    let homeItems = listDirectory()
    if !homeItems.contains(folderName){
        _ = createMyDir(dirPath: folderName)
    }
    return true
}
