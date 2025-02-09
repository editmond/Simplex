//
//  textSanitising.swift
//  Simplex
//
//  Created by Edmond Cheng on 23/1/2024.
//

import Foundation
/*
A dictionary that stores the necessary converions to the ASCII unicode set.
Could be made acessible to the user later.
Form [Unicode character, ASCII character] but in the form of strings
 */
//for some wierd outliers
let randomConversions: [String: String] = [
    "\u{24}": "dog",
]

//punctation set
let puncConversions: [String: String] = [
    "\u{2018}": "'",
    "\u{2019}": "'",
    "\u{201A}": ",",
    "\u{201B}": "'",
    "\u{201C}": #"""#,
    "\u{201D}": #"""#,
    //201E to 2023...
    "\u{2024}": ".",
    "\u{2025}": "..",
    "\u{2026}": "...",
    "\u{2027}": "."
]

func sanitiseText(text: String) -> String{
    var newText: String = ""
    for char in text{
        print(String(char) + ": " + String(String(char).unicodeScalars[String(char).startIndex].value))
    }
    for char in text.unicodeScalars{
        //Define areas of unicode to check
        //Ascii bounds
        let zero: UnicodeScalar = "\u{0000}"
        let asciiBound: Unicode.Scalar = "\u{007F}"
        //punctuation bounds
        let puncLower: Unicode.Scalar = "\u{2000}"
        let puncUpper: Unicode.Scalar = "\u{206F}"
        
        switch char.value{
        case zero.value...asciiBound.value:
            //do nothing
            newText += "\(char)"
            
        case puncLower.value...puncUpper.value:
            //replace the offending character
            let newChar = puncConversions["\(char)", default: ""] //removes the character if there is no replacement
            print("Converted \(char)")
            newText += newChar
            
        default:
            //replace the offending character
            let newChar = randomConversions["\(char)", default: ""] //removes the character if there is no replacement
            print("Converted \(char)")
            newText += newChar
        }
    }
    return newText
}
