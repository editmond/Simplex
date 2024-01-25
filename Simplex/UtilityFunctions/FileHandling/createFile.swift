//
//  createFile.swift
//  Simplex
//
//  Created by Edmond Cheng on 25/1/2024.
//

import Foundation

func createFile(filePath: String){
    let fm = FileManager.default
    let path = "\(NSHomeDirectory())/\(filePath)"
    fm.createFile(atPath: path, contents: nil)
    print("Create file at \(path)")
}
