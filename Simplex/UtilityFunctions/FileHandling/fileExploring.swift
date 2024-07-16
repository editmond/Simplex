//
//  fileExploring.swift
//  Simplex
//
//  Created by Edmond Cheng on 24/1/2024.
//

import Foundation

func listDirectory() -> Array<String>{
    let fm = FileManager.default
    let path = "\(NSHomeDirectory())"
    var availableItems = [String]()
    do {
        print("Accessing \(path)")
        availableItems = try fm.contentsOfDirectory(atPath: path)
        
    } catch {
    }
    return availableItems
}

func listDirectory(fromHomePath: String) -> Array<String>{
    let fm = FileManager.default
    let path = "\(NSHomeDirectory())/\(fromHomePath)"
    var availableItems = [String]()
    do {
        print("Accessing \(path)")
        availableItems = try fm.contentsOfDirectory(atPath: path)
        
    } catch {
        // failed to read directory – bad permissions, perhaps?
    }
    return availableItems
}
