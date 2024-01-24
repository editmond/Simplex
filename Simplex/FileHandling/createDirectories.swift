//
//  createDirectories.swift
//  Simplex
//
//  Created by Edmond Cheng on 24/1/2024.
//

import Foundation

func createMyDir(dirPath: String) -> Bool{
    let fm = FileManager.default
    let path = "\(NSHomeDirectory())\(dirPath)"
    do {
        print("Accessing \(path)")
        try fm.createDirectory(atPath: path, withIntermediateDirectories: true)
    } catch {
        return false
    }
//    return outputString
    return true
}
