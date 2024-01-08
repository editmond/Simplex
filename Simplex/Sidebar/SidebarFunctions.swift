//
//  SidebarFunctions.swift
//  Simplex
//
//  Created by Edmond Cheng on 8/1/2024.
//

import Foundation

func UpperSidebarActor(actionNum: Int) -> Void{
    switch actionNum{
    case 0:
        try? safeShell("say \(actionNum)")
    default:
        try? safeShell("say \(actionNum)")
    }
}

func LowerSidebarActor(actionNum: Int) -> Void{
    switch actionNum{
    case 0:
        try? safeShell("say \(actionNum)")
    default:
        try? safeShell("say \(actionNum)")
    }
}
