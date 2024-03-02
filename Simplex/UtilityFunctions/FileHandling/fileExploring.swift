//
//  fileExploring.swift
//  Simplex
//
//  Created by Edmond Cheng on 24/1/2024.
//

import Foundation

func listDirectory() -> Array<String>{
    let fm = FileManager.default
//                let path = Bundle.main.resourcePath!
    let path = "\(NSHomeDirectory())"
//    var outputString: String = ""
    var availableItems = [String]()
    do {
        print("Accessing \(path)")
        availableItems = try fm.contentsOfDirectory(atPath: path)
        
//        for item in items {
//            print("Found \(item)")
//            outputString = "\(outputString)\n\(item)"
//            availableItems.append(item)
//        }
    } catch {
        // failed to read directory – bad permissions, perhaps?
    }
//    return outputString
    return availableItems
}

func listDirectory(fromHomePath: String) -> Array<String>{
    let fm = FileManager.default
//                let path = Bundle.main.resourcePath!
    let path = "\(NSHomeDirectory())/\(fromHomePath)"
//    var outputString: String = ""
    var availableItems = [String]()
    do {
        print("Accessing \(path)")
        availableItems = try fm.contentsOfDirectory(atPath: path)
        
//        for item in items {
//            print("Found \(item)")
//            outputString = "\(outputString)\n\(item)"
//            availableItems.append(item)
//        }
    } catch {
        // failed to read directory – bad permissions, perhaps?
    }
//    return outputString
    return availableItems
}
